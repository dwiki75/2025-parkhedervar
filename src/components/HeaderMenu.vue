<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

const LARGE_HEADER_HEIGHT = 144
const SMALL_HEADER_HEIGHT = 48
const LOGO_LARGE_HEIGHT = '100%'
const LOGO_SMALL_HEIGHT = '40px'

const props = defineProps({
  logoUrl: String,
  logoAlt: String,
  menuItems: Array
})

const menuOpen = ref(false)
const isScrolled = ref(false)
const isMobile = ref(false)

const beforeScroll = 100
const afterScroll = 50

function toggleMenu() {
  menuOpen.value = !menuOpen.value
  document.body.classList.toggle('overflow-hidden', menuOpen.value)
}

function checkScroll() {
  const scrollY = window.scrollY
  if (scrollY > beforeScroll && !isScrolled.value) {
    isScrolled.value = true
  } else if (scrollY <= afterScroll && isScrolled.value) {
    isScrolled.value = false
  }
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

// ✅ Közös link class helper DRY
function linkClasses(url) {
  const isActive = isCurrent(url)

  return [
    isActive
      ? 'bg-primary text-white rounded-full px-5 py-2'
      : 'text-midgray hover:bg-primary hover:bg-opacity-100 hover:text-white rounded-full px-5 py-2',
    'hover:underline link-transition'
  ]
}

onMounted(() => {
  checkScroll()
  checkIsMobile()
  window.addEventListener('scroll', checkScroll)
  window.addEventListener('resize', checkIsMobile)
})

onUnmounted(() => {
  window.removeEventListener('scroll', checkScroll)
  window.removeEventListener('resize', checkIsMobile)
})
</script>

<template>
  <header
    :class="[
      'sticky top-0 z-50 w-full  transition-all duration-300 ease-in-out'
    ]"
    :style="{ height: (isMobile ? SMALL_HEADER_HEIGHT : (isScrolled ? SMALL_HEADER_HEIGHT : LARGE_HEADER_HEIGHT)) + 'px' }"
  >
    <div
      class="max-w-8xl mx-auto px-6 h-full flex items-center justify-between transition-all duration-300 bg-lightbrown"
    >
      <!-- Logó -->
      <div
        :class="['flex items-center transition-all duration-300']"
        :style="{
          height: (isMobile ? SMALL_HEADER_HEIGHT : (isScrolled ? SMALL_HEADER_HEIGHT : LARGE_HEADER_HEIGHT)) + 'px',
          paddingTop: (isMobile ? '4px' : (isScrolled ? '4px' : '24px')),
          paddingBottom: (isMobile ? '4px' : (isScrolled ? '4px' : '24px'))
        }"
      >
        <a href="/" class="flex items-center h-full">
          <img
            :src="logoUrl"
            :alt="logoAlt"
            class="object-contain transition-all duration-300 block mix-blend-multiply"
            :style="{ height: isMobile ? LOGO_SMALL_HEIGHT : (isScrolled ? LOGO_SMALL_HEIGHT : LOGO_LARGE_HEIGHT) }"
          />
        </a>
      </div>

      <!-- Hamburger -->
      <div class="relative z-50 sm:hidden flex items-center">
        <button
          @click="toggleMenu"
          aria-label="Toggle menu"
          type="button"
          class="relative w-[30px] h-[22px] flex flex-col justify-between cursor-pointer"
          :class="{ open: menuOpen }"
          id="menu-toggle"
        >
          <span class="block bg-black rounded h-[3px] w-[30px] transition-all duration-300 ease-in-out"></span>
          <span class="block bg-black rounded h-[3px] w-[30px] transition-all duration-300 ease-in-out"></span>
          <span class="block bg-black rounded h-[3px] w-[30px] transition-all duration-300 ease-in-out"></span>
        </button>
      </div>

      <!-- Desktop menu -->
     <ul class="hidden sm:flex gap-[1px] items-center text-secondary text-base font-bold ml-auto ">
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

      <!-- Mobile menu -->
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
        <ul class="flex flex-col gap-[1px] items-center text-secondary text-xl font-bold mt-12 ">
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
      </div>
    </div>
  </header>
</template>



<style scoped>
#menu-toggle.open span:nth-child(1) {
  transform: translateY(9.5px) rotate(45deg);
}
#menu-toggle.open span:nth-child(2) {
  opacity: 0;
}
#menu-toggle.open span:nth-child(3) {
  transform: translateY(-9.5px) rotate(-45deg);
}
</style>
