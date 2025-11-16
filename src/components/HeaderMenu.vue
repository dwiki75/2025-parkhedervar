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

  if (!menuOpen.value) {
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
   Anchor
======================== */
function getAnchorId(url) {
  if (!url) return null
  const hashIndex = url.indexOf('#')
  if (hashIndex === -1) return null
  return url.slice(hashIndex + 1)
}

function isPathActive(url) {
  try {
    const full = new URL(url, window.location.origin)
    return full.pathname === window.location.pathname
  } catch {
    return false
  }
}

/* ========================
   Link CSS osztályok
======================== */
function linkClasses(url) {
  const base = 'rounded-full px-5 py-2 transition-colors duration-200'
  const anchorId = getAnchorId(url)

  if (anchorId) {
    const active = activeAnchorId.value === anchorId
    return [
      base,
      active ? 'bg-thirdy text-black' : 'text-white hover:bg-thirdy hover:text-black'
    ]
  }

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
  const anchorId = getAnchorId(url)

  if (item.external) return
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

    activeAnchorId.value = anchorId

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
  <!-- ===========================
       NAGY HEADER (csak default mód)
  ============================ -->
  <header
    v-if="props.mode === 'default'"
    ref="mainHeaderRef"
    class="w-full transition-all duration-300 ease-in-out"
    :style="{ height: (isMobile ? SMALL_HEADER_HEIGHT : LARGE_HEADER_HEIGHT) + 'px' }"
  >
    <div class="mx-auto h-full relative w-full">

      <div class="flex items-center justify-between w-full h-full px-4 sm:px-0">

        <!-- BAL: LOGÓ -->
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

        <!-- KÖZÉP: DESKTOP MENÜ -->
        <div class="hidden sm:flex flex-grow justify-center">
          <ul class="flex gap-[1px] items-center text-secondary text-base font-bold">
            <template v-for="item in menuItems" :key="item.url">
              <li>
                <a
                  :href="item.url"
                  :class="linkClasses(item.url)"
                  @click="onMenuClick(item, $event)"
                >
                  {{ item.title }}
                </a>
              </li>
            </template>
          </ul>
        </div>

        <!-- JOBB: NYELVVÁLTÓ -->
        <div class="hidden sm:flex items-center">
          <div v-html="languageHtml"></div>
        </div>

      </div>

      <!-- MOBIL: HAMBURGER + NYELVVÁLTÓ -->
      <div class="sm:hidden absolute right-4 top-1/2 -translate-y-1/2 flex items-center gap-3 z-20">

        <!-- NYELVVÁLTÓ -->
        <div class="mobile-lang" v-html="languageHtml"></div>

        <!-- HAMBURGER GOMB -->
        <button
          @click="toggleMenu"
          aria-label="Menü"
          class="relative w-[30px] h-[22px] flex flex-col justify-between"
        >
          <span class="block bg-white h-[3px] w-[30px] rounded"></span>
          <span class="block bg-white h-[3px] w-[30px] rounded"></span>
          <span class="block bg-white h-[3px] w-[30px] rounded"></span>
        </button>

      </div>

    </div>
  </header>

  <!-- ===========================
       MOBIL OVERLAY MENÜ
  ============================ -->
  <div
    id="mobile-menu"
    :class="[
      'fixed inset-0 bg-primary z-40 flex flex-col sm:hidden transition-all duration-300 ease-in-out',
      menuOpen ? 'opacity-100 pointer-events-auto translate-y-0' : 'opacity-0 pointer-events-none -translate-y-full'
    ]"
  >

    <!-- FELSŐ SOR (logó + zászlók + X) -->
    <div class="flex items-center justify-between px-5 pt-2 pb-3">

      <!-- LOGÓ -->
      <img :src="logoUrl" :alt="logoAlt" class="h-10 w-auto" />

      <!-- ZÁSZLÓK + X -->
      <div class="flex items-center gap-2">

        <!-- NYELVVÁLTÓ -->
        <div class="mobile-lang flex items-center gap-1" v-html="languageHtml"></div>

        <!-- X GOMB -->
        <button
          @click="toggleMenu"
          aria-label="Bezárás"
          class="relative w-[30px] h-[22px] flex flex-col justify-between"
        >
          <span class="block bg-white h-[3px] w-[30px] rotate-45 translate-y-[9px]"></span>
          <span class="block bg-white h-[3px] w-[30px] opacity-0"></span>
          <span class="block bg-white h-[3px] w-[30px] -rotate-45 -translate-y-[9px]"></span>
        </button>

      </div>
    </div>

    <!-- MENÜ LISTA -->
    <ul class="flex flex-col gap-6 items-center text-white text-xl font-bold mt-10">
      <template v-for="item in menuItems" :key="item.url + '-mobile'">
        <li>
          <a
            :href="item.url"
            :class="linkClasses(item.url)"
            @click="onMenuClick(item, $event)"
          >
            {{ item.title }}
          </a>
        </li>
      </template>
    </ul>
  </div>

  <!-- ===========================
       MINI HEADER (DESKTOP ONLY)
  ============================ -->
  <header
  v-if="!isMobile && (props.mode === 'default' || props.mode === 'inner')"

    class="fixed top-2 left-10 right-10 z-50 pointer-events-none transition-all duration-300 ease-out"
    :class="miniVisible ? 'opacity-100 translate-y-0' : 'opacity-0 -translate-y-[10px]'"
  >
    <div class="pointer-events-auto max-w-8xl mx-auto px-6 py-2 rounded-xl bg-primary text-white backdrop-blur shadow-[0_0_40px_rgba(255,255,255,0.25)]">
      <div class="flex items-center justify-between">

        <a href="/" class="flex items-center h-10">
          <img :src="logoUrl" :alt="logoAlt" class="h-8 w-auto object-contain" />
        </a>

        <ul class="hidden sm:flex gap-1 items-center text-secondary text-sm font-bold">
          <template v-for="item in menuItems" :key="item.url + '-mini'">
            <li>
              <a
                :href="item.url"
                :class="linkClasses(item.url)"
                @click="onMenuClick(item, $event)"
              >
                {{ item.title }}
              </a>
            </li>
          </template>
        </ul>

        <div class="hidden sm:block ml-4 pointer-events-auto" v-html="languageHtml"></div>

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

