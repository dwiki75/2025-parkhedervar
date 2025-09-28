<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

const LARGE_HEADER_HEIGHT = 144
const SMALL_HEADER_HEIGHT = 48
const LOGO_LARGE_HEIGHT = '100%'
const LOGO_SMALL_HEIGHT = '40px'

const props = defineProps({
  logoUrl: String,
  logoAlt: String,
  menuItems: Array,
  languageHtml: String
})

const menuOpen = ref(false)
const isMobile = ref(false)
const miniVisible = ref(false)            // mini-header láthatósága
const mainHeaderRef = ref(null)           // nagy fejléc DOM referenciája

function toggleMenu() {
  menuOpen.value = !menuOpen.value
  document.body.classList.toggle('overflow-hidden', menuOpen.value)
}

function checkScroll() {
  if (!mainHeaderRef.value) return
  const bottom = mainHeaderRef.value.getBoundingClientRect().bottom
  miniVisible.value = bottom <= 0
}

function checkIsMobile() {
  isMobile.value = window.innerWidth < 640 // Tailwind 'sm' breakpoint
}

function isCurrent(url) {
  try {
    const full = new URL(url, window.location.origin)
    if (full.host !== window.location.host) return false
    return full.pathname === window.location.pathname
  } catch {
    return false
  }
}

function linkClasses(url) {
  const isActive = isCurrent(url)
  return [
    // közös
    'rounded-full px-5 py-2 transition-colors duration-200',
    // állapotok
    isActive
      ? 'bg-thirdy text-black'
      : 'text-white hover:bg-thirdy hover:text-black'
  ]
}

onMounted(() => {
  checkScroll()
  checkIsMobile()
  window.addEventListener('scroll', checkScroll, { passive: true })
  window.addEventListener('resize', checkIsMobile)
})

onUnmounted(() => {
  window.removeEventListener('scroll', checkScroll)
  window.removeEventListener('resize', checkIsMobile)
})
</script>

<template>
  <!-- 1) NAGY, NEM-STICKY FEJLÉC (háttér nélkül, kifut) -->
  <header
    ref="mainHeaderRef"
    :class="['w-full transition-all duration-300 ease-in-out']"
    :style="{ height: (isMobile ? SMALL_HEADER_HEIGHT : LARGE_HEADER_HEIGHT) + 'px' }"
  >
    <div class="mx-auto h-full flex items-center justify-between">
      <!-- Logó -->
      <div
        class="flex items-center transition-all duration-300"
        :style="{
          height: (isMobile ? SMALL_HEADER_HEIGHT : LARGE_HEADER_HEIGHT) + 'px',
          paddingTop: (isMobile ? '4px' : '24px'),
          paddingBottom: (isMobile ? '4px' : '24px')
        }"
      >
        <a href="/" class="flex items-center h-full">
          <img
            :src="logoUrl"
            :alt="logoAlt"
            class="object-contain transition-all duration-300 block"
            :style="{ height: isMobile ? LOGO_SMALL_HEIGHT : LOGO_LARGE_HEIGHT }"
          />
        </a>
      </div>

      <!-- Hamburger -->
      <div class="sm:hidden">
        <button
          @click="toggleMenu"
          :aria-expanded="menuOpen ? 'true' : 'false'"
          aria-label="Toggle menu"
          type="button"
          class="w-[30px] h-[22px] flex flex-col justify-between cursor-pointer transition-all duration-300 ease-in-out pointer-events-auto"
          :class="[
            menuOpen ? 'fixed top-4 right-4 z-[70]' : 'relative z-[70]',
            menuOpen ? 'open' : ''
          ]"
          id="menu-toggle"
        >
          <span class="block bg-black rounded h-[3px] w-[30px] transition-all duration-300 ease-in-out"></span>
          <span class="block bg-black rounded h-[3px] w-[30px] transition-all duration-300 ease-in-out"></span>
          <span class="block bg-black rounded h-[3px] w-[30px] transition-all duration-300 ease-in-out"></span>
        </button>
      </div>

      <!-- Desktop menü -->
      <ul class="hidden sm:flex gap-[1px] items-center text-secondary text-base font-bold ml-auto">
        <template v-for="item in menuItems" :key="item.url">
          <li>
            <a
              :href="item.url"
              :class="linkClasses(item.url)"
              :target="item.external ? '_blank' : undefined"
              :rel="item.external ? 'noopener noreferrer' : undefined"
            >
              {{ item.title }}
            </a>
          </li>
        </template>
      </ul>
    </div>

    <!-- Mobil menü overlay -->
    <div
      id="mobile-menu"
      :class="[
        'fixed inset-0 bg-lightbrown z-40 flex-col px-6 py-8 pt-12 overflow-y-auto sm:hidden transition-all duration-300 ease-in-out',
        menuOpen ? 'opacity-100 pointer-events-auto translate-y-0' : 'opacity-0 pointer-events-none -translate-y-full'
      ]"
    >
      <img
        :src="logoUrl"
        :alt="logoAlt"
        id="mobile-logo"
        class="absolute top-4 left-4 h-8 w-auto transition-opacity duration-300 select-none z-50"
        :class="menuOpen ? 'opacity-100' : 'opacity-0'"
      />
      <ul class="flex flex-col gap-[1px] items-center text-secondary text-xl font-bold mt-12">
        <template v-for="item in menuItems" :key="item.url + '-mobile'">
          <li class="my-2">
            <a
              :href="item.url"
              :class="linkClasses(item.url)"
              :target="item.external ? '_blank' : undefined"
              :rel="item.external ? 'noopener noreferrer' : undefined"
            >
              {{ item.title }}
            </a>
          </li>
        </template>
      </ul>

      <!-- (OPCIONÁLIS) Nyelvváltó a mobil overlay alján -->
      <div class="mt-8" v-html="languageHtml"></div>
    </div>
  </header>

  <!-- 2) MINI FIX FEJLÉC (csak ha a nagy teljesen eltűnt) -->
  <header
    aria-hidden="true"
    class="fixed top-2 left-10 right-10 z-50 pointer-events-none"
    :class="[
      'transition-all duration-300 ease-out',
      miniVisible ? 'opacity-100 translate-y-0' : 'opacity-0 -translate-y-[10px]'
    ]"
  >
  <div
  class="pointer-events-auto max-w-8xl mx-auto px-6 py-2 rounded-xl
         bg-primary text-white backdrop-blur
         shadow-[0_0_40px_rgba(255,255,255,0.25)]"
>
      <div class="flex items-center justify-between">
        <!-- Kisebb logó -->
        <a href="/" class="flex items-center h-10">
          <img
            :src="logoUrl"
            :alt="logoAlt"
            class="h-8 w-auto object-contain"
          />
        </a>

        <!-- Desktop menü (kompakt) -->
        <ul class="hidden sm:flex gap-1 items-center text-secondary text-sm font-bold ml-auto">
          <template v-for="item in menuItems" :key="item.url + '-mini'">
            <li>
              <a
                :href="item.url"
                :class="linkClasses(item.url)"
                :target="item.external ? '_blank' : undefined"
                :rel="item.external ? 'noopener noreferrer' : undefined"
              >
                {{ item.title }}
              </a>
            </li>
          </template>
        </ul>

        <!-- Nyelvváltó a mini-header jobb oldalán -->
        <div class="hidden sm:block ml-4 pointer-events-auto" v-html="languageHtml"></div>
      </div>
    </div>
  </header>
</template>

<style scoped>
/* Hamburger → X átalakulás */
#menu-toggle.open span:nth-child(1),
#menu-toggle[aria-expanded="true"] span:nth-child(1) {
  transform: translateY(9.5px) rotate(45deg);
}
#menu-toggle.open span:nth-child(2),
#menu-toggle[aria-expanded="true"] span:nth-child(2) {
  opacity: 0;
}
#menu-toggle.open span:nth-child(3),
#menu-toggle[aria-expanded="true"] span:nth-child(3) {
  transform: translateY(-9.5px) rotate(-45deg);
}
</style>
