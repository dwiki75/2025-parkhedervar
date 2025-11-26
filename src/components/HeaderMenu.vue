<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

/* ========================
   Állandók
======================== */
const LARGE_HEADER_HEIGHT = 144
const SMALL_HEADER_HEIGHT = 48
const LOGO_LARGE_HEIGHT = '100%'
const LOGO_SMALL_HEIGHT = '40px'

/* ========================
   Twig → Vue adatátvétel
======================== */
const props = defineProps({
  logoUrl: String,
  logoAlt: String,
  languageHtml: String,
  menuItems: Array,
  mode: { type: String, default: 'default' }
})

const logoUrl = props.logoUrl
const logoAlt = props.logoAlt
const languageHtml = props.languageHtml
const menuItems = props.menuItems

/* ========================
   Reaktív állapotok
======================== */
const menuOpen = ref(false)
const isMobile = ref(false)
const miniVisible = ref(false)
const mainHeaderRef = ref(null)

/* Aktív anchor */
const activeAnchorId = ref(null)
let anchorObserver = null

/* ========================
   Menü nyit/zár
======================== */
function toggleMenu() {
  menuOpen.value = !menuOpen.value
  document.body.classList.toggle('overflow-hidden', menuOpen.value)

  if (!menuOpen.value && props.mode === 'default') {
    activeAnchorId.value = null
  }
}

/* ======================== */
function checkScroll() {
  if (!mainHeaderRef.value) return
  const bottom = mainHeaderRef.value.getBoundingClientRect().bottom
  miniVisible.value = bottom <= 0
}

function checkIsMobile() {
  isMobile.value = window.innerWidth < 640
}

/* ========================
   Anchor parsing
======================== */
function getAnchorId(url) {
  if (!url) return null
  const hashIndex = url.indexOf('#')
  if (hashIndex === -1) return null
  return url.slice(hashIndex + 1)
}

/* ========================
   SLUG NORMALIZÁLÁS
======================== */
function normalizeSlug(str) {
  if (!str) return ''
  return decodeURIComponent(str)
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '') // ékezetek törlése
    .toLowerCase()
    .replace(/[^a-z0-9]/g, '')      // minden nem alfanumerikus törlése
}

/* ========================
   IS INNER ACTIVE (SLUG ALAPÚ)
======================== */
function isInnerActive(item) {
  if (props.mode !== 'inner') return false
  if (!item.slug) return false

  const currentSlug = normalizeSlug(window.location.pathname.split('/').pop())
  const menuSlug = normalizeSlug(item.slug)

  return currentSlug === menuSlug
}

/* ========================
   URL normalizálás + path match
======================== */
function normalizePath(path) {
  if (!path) return ''

  return decodeURIComponent(path)
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase()
    .replace(/\/+$/, '')
}

function isPathActive(url) {
  try {
    const full = new URL(url, window.location.origin)

    const current = normalizePath(window.location.pathname)
    const target = normalizePath(full.pathname)

    if (current === target) {
      return true
    }

    // Cikk slug összevetés (encoded vs decoded)
    if (current.startsWith('/cikkek/') && target.startsWith('/cikkek/')) {
      const curSlug = current.replace('/cikkek/', '')
      const tarSlug = target.replace('/cikkek/', '')
      return curSlug === tarSlug
    }

    return false
  } catch {
    return false
  }
}

/* ========================
   Link CSS osztályok
======================== */
function linkClasses(itemOrUrl) {
  const base = 'rounded-full px-5 py-2 transition-colors duration-200'

  // Ha stringet kapott (régi hívás), alakítsuk át objektummá
  let item = typeof itemOrUrl === 'string'
    ? { url: itemOrUrl, slug: null }
    : itemOrUrl

  // --------- INNER MODE (slug alapú ACTIVE) ---------
  if (props.mode === 'inner') {
    const active = isInnerActive(item)
    return [
      base,
      active ? 'bg-thirdy text-black' : 'text-white hover:bg-thirdy hover:text-black'
    ]
  }

  // --------- DEFAULT MODE (főoldal anchor + path) ---------
  const url = item.url
  const anchorId = getAnchorId(url)

  // anchor-based active (NYITÓOLDAL)
  if (anchorId) {
    const active = activeAnchorId.value === anchorId
    return [
      base,
      active ? 'bg-thirdy text-black' : 'text-white hover:bg-thirdy hover:text-black'
    ]
  }

  // normál path-based active (NYITÓOLDALON)
  const active = isPathActive(url)
  return [
    base,
    active ? 'bg-thirdy text-black' : 'text-white hover:bg-thirdy hover:text-black'
  ]
}


/* ========================
   Smooth scroll
======================== */
function scrollToAnchor(anchorId) {
  const target = document.getElementById(anchorId)
  if (!target) return

  const offset = 70
  const top = target.getBoundingClientRect().top + window.scrollY - offset
  window.scrollTo({ top, behavior: 'smooth' })
}

/* ========================
   Kattintás menüponton
======================== */
function onMenuClick(item, event) {
  const url = item.url

  /* ——————————————
     1) ONEPAGE KEZELÉS
  —————————————— */
  if (url.startsWith('/#onepage-')) {

    // Nyitóoldal → scroll
    if (window.location.pathname === '/') {
      event.preventDefault()
      const anchorId = url.replace('/#', '')
      scrollToAnchor(anchorId)
      return
    }

    // Belső oldal → átirányítás a főoldal megfelelő szekciójához
    event.preventDefault()
    window.location.href = url
    return
  }

  /* ——————————————
     2) Normal URL-ek:
        anchor vagy path match
  —————————————— */

  const anchorId = getAnchorId(url)
  if (!anchorId) return

  let full
  try {
    full = new URL(url, window.location.origin)
  } catch {
    full = { pathname: window.location.pathname }
  }

  if (full.pathname === window.location.pathname) {
    event.preventDefault()
    scrollToAnchor(anchorId)

    if (props.mode === 'default') {
      activeAnchorId.value = anchorId
    }

    if (isMobile.value && menuOpen.value) toggleMenu()
  }
}

/* ========================
   IntersectionObserver
======================== */
function setupAnchorObserver() {
  if (!('IntersectionObserver' in window)) return

  const anchorIds = menuItems
    .map(item => getAnchorId(item.url))
    .filter(Boolean)

  if (!anchorIds.length) return

  anchorObserver = new IntersectionObserver(
    entries => {
      const visible = entries.filter(e => e.isIntersecting)

      if (visible.length === 0) {
        activeAnchorId.value = null
        return
      }

      const best = visible.reduce((a, b) =>
        a.intersectionRatio > b.intersectionRatio ? a : b
      )

      activeAnchorId.value = best.target.id
    },
    {
      root: null,
      rootMargin: '-20% 0px -50% 0px',
      threshold: [0.1, 0.25, 0.5]
    }
  )

  anchorIds.forEach(id => {
    const el = document.getElementById(id)
    if (el) anchorObserver.observe(el)
  })
}

/* ========================
   Mobil nyelvváltó fix
======================== */
function enforceLangRow() {
  const wrap = document.querySelector('.mobile-lang')
  if (!wrap) return

  const inner = wrap.firstElementChild
  if (!inner) return

  inner.style.display = 'flex'
  inner.style.flexWrap = 'nowrap'
  inner.style.alignItems = 'center'
  inner.style.gap = '8px'
}

/* ========================
   Mounted
======================== */
onMounted(() => {
  activeAnchorId.value = null

  checkIsMobile()
  enforceLangRow()

  if (props.mode === 'inner') {
    miniVisible.value = !isMobile.value
  } else {
    checkScroll()
    setupAnchorObserver()
    window.addEventListener('scroll', checkScroll, { passive: true })
  }

  window.addEventListener('resize', () => {
    checkIsMobile()
    enforceLangRow()

    if (props.mode === 'inner') {
      miniVisible.value = !isMobile.value
    }
  })
})

onUnmounted(() => {
  window.removeEventListener('scroll', checkScroll)
  if (anchorObserver) anchorObserver.disconnect()
})
</script>

<template>
  <!-- FŐ HEADER (csak default) -->
  <header
    v-if="props.mode === 'default'"
    ref="mainHeaderRef"
    class="w-full transition-all duration-300 ease-in-out"
    :style="{ height: (isMobile ? SMALL_HEADER_HEIGHT : LARGE_HEADER_HEIGHT) + 'px' }"
  >
    <div class="mx-auto h-full relative w-full">

      <div class="flex items-center justify-between w-full h-full px-4 sm:px-0">

        <!-- LOGÓ -->
        <div class="flex items-center"
            :style="{
              height: (isMobile ? SMALL_HEADER_HEIGHT : LARGE_HEADER_HEIGHT) + 'px',
              paddingTop: (isMobile ? '4px' : '24px'),
              paddingBottom: (isMobile ? '4px' : '24px')
            }">
          <a href="/" class="flex items-center h-full">
            <img
              :src="logoUrl"
              :alt="logoAlt"
              class="object-contain transition-all duration-300 block"
              :style="{ height: isMobile ? LOGO_SMALL_HEIGHT : LOGO_LARGE_HEIGHT }"
            />
          </a>
        </div>

        <!-- DESKTOP MENÜ -->
        <div class="hidden sm:flex flex-grow justify-center">
          <ul class="flex gap-[1px] items-center text-secondary text-base font-bold">
            <template v-for="item in menuItems" :key="item.url">
              <li>
                <a
                  :href="item.url"
                  :class="linkClasses(item)"
                  @click="onMenuClick(item, $event)"
                >
                  {{ item.title }}
                </a>
              </li>
            </template>
          </ul>
        </div>

        <!-- NYELVVÁLTÓ -->
        <div class="hidden sm:flex items-center">
          <div v-html="languageHtml"></div>
        </div>

      </div>

      <!-- MOBIL HEADER -->
      <div class="sm:hidden absolute right-4 top-1/2 -translate-y-1/2 flex items-center gap-3 z-20">

        <div class="mobile-lang" v-html="languageHtml"></div>

        <button
          @click="toggleMenu"
          aria-label="Menü"
          class="relative w-[30px] h-[22px] flex flex-col justify-between"
        >
          <span class="block h-[3px] w-[30px] rounded bg-white"></span>
          <span class="block h-[3px] w-[30px] rounded bg-white"></span>
          <span class="block h-[3px] w-[30px] rounded bg-white"></span>
        </button>

      </div>

    </div>
  </header>

  <!-- MOBIL MENÜ -->
  <div
    id="mobile-menu"
    :class="[
      'fixed inset-0 bg-primary z-40 flex flex-col sm:hidden transition-all duration-300 ease-in-out',
      menuOpen ? 'opacity-100 pointer-events-auto translate-y-0' : 'opacity-0 pointer-events-none -translate-y-full'
    ]"
  >

    <div class="flex items-center justify-between px-5 pt-2 pb-3">
      <img :src="logoUrl" :alt="logoAlt" class="h-10 w-auto" />

      <div class="flex items-center gap-2">
        <div class="mobile-lang flex items-center gap-1" v-html="languageHtml"></div>

        <button
          @click="toggleMenu"
          aria-label="Bezárás"
          class="relative w-[30px] h-[22px] flex flex-col justify-between"
        >
          <span class="block h-[3px] w-[30px] translate-y-[9px] rotate-45 bg-white"></span>
          <span class="block h-[3px] w-[30px] opacity-0 bg-white"></span>
          <span class="block h-[3px] w-[30px] -translate-y-[9px] -rotate-45 bg-white"></span>
        </button>
      </div>
    </div>

    <ul class="mt-10 flex flex-col items-center gap-6 text-xl font-bold text-white">
      <template v-for="item in menuItems" :key="item.url + '-mobile'">
        <li>
          <a
            :href="item.url"
            :class="linkClasses(item)"
            @click="onMenuClick(item, $event)"
          >
            {{ item.title }}
          </a>
        </li>
      </template>
    </ul>

  </div>

  <!-- MINI HEADER (DESKTOP ONLY) -->
  <header
    v-if="!isMobile && (props.mode === 'default' || props.mode === 'inner')"
    class="fixed top-2 left-10 right-10 z-50 pointer-events-none transition-all duration-300 ease-out"
    :class="miniVisible ? 'opacity-100 translate-y-0' : 'opacity-0 -translate-y-[10px]'"
  >
    <div class="pointer-events-auto mx-auto max-w-8xl rounded-xl bg-primary px-6 py-2 text-white shadow-[0_0_40px_rgba(255,255,255,0.25)] backdrop-blur">
      <div class="flex items-center justify-between">

        <a href="/" class="flex h-10 items-center">
          <img :src="logoUrl" :alt="logoAlt" class="h-8 w-auto object-contain" />
        </a>

        <ul class="hidden items-center gap-1 text-sm font-bold text-secondary sm:flex">
          <template v-for="item in menuItems" :key="item.url + '-mini'">
            <li>
              <a
                :href="item.url"
                :class="linkClasses(item)"
                @click="onMenuClick(item, $event)"
              >
                {{ item.title }}
              </a>
            </li>
          </template>
        </ul>

        <div class="pointer-events-auto ml-4 hidden sm:block" v-html="languageHtml"></div>

      </div>
    </div>
  </header>
</template>

<style scoped>
:deep(.mobile-lang ul) {
  display: flex !important;
  flex-wrap: nowrap !important;
  gap: 0.5rem !important;
}
</style>
