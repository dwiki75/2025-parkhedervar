<script setup>
import { ref, onMounted, onBeforeUnmount, watch } from 'vue'

const props = defineProps({
  pictures: {
    type: Array,
    default: () => []
  },
  speed: {
    type: Number,
    default: 10000
  }
})

const currentIndex = ref(0)
let timeoutId = null

function next() {
  currentIndex.value = (currentIndex.value + 1) % props.pictures.length
}

function prev() {
  currentIndex.value = (currentIndex.value - 1 + props.pictures.length) % props.pictures.length
}

function nextWithAutoplay() {
  next()
  timeoutId = setTimeout(nextWithAutoplay, props.speed)
}

function startAutoplay() {
  stopAutoplay()
  timeoutId = setTimeout(nextWithAutoplay, props.speed)
}

function stopAutoplay() {
  if (timeoutId) {
    clearTimeout(timeoutId)
    timeoutId = null
  }
}

// Swipe / drag változók
let startX = 0
let isDragging = false

function handleStart(x) {
  startX = x
  isDragging = true
}

function handleEnd(x) {
  if (!isDragging) return
  const deltaX = x - startX

  if (Math.abs(deltaX) > 50) {
    if (deltaX > 0) {
      prev()
    } else {
      next()
    }
  }

  isDragging = false
}

// Ha sebesség változik, újratöltjük az autoplay-t
watch(() => props.speed, () => {
  startAutoplay()
})

onMounted(() => {
  startAutoplay()

  const slider = document.querySelector('.relative.w-full.overflow-hidden')
  if (slider) {
    slider.addEventListener('mouseenter', stopAutoplay)
    slider.addEventListener('mouseleave', startAutoplay)

    // Mobil – ujjhúzás
    slider.addEventListener('touchstart', (e) => {
      handleStart(e.touches[0].clientX)
    })
    slider.addEventListener('touchend', (e) => {
      handleEnd(e.changedTouches[0].clientX)
    })

    // Desktop – egérhúzás
    slider.addEventListener('mousedown', (e) => {
      handleStart(e.clientX)
    })
    slider.addEventListener('mouseup', (e) => {
      handleEnd(e.clientX)
    })
    slider.addEventListener('mouseleave', () => {
      isDragging = false
    })
  }

  window.addEventListener('keydown', (e) => {
    if (e.key === 'ArrowLeft') prev()
    else if (e.key === 'ArrowRight') next()
  })
})

onBeforeUnmount(() => {
  stopAutoplay()

  const slider = document.querySelector('.relative.w-full.overflow-hidden')
  if (slider) {
    slider.removeEventListener('mouseenter', stopAutoplay)
    slider.removeEventListener('mouseleave', startAutoplay)
    slider.removeEventListener('touchstart', () => {})
    slider.removeEventListener('touchend', () => {})
    slider.removeEventListener('mousedown', () => {})
    slider.removeEventListener('mouseup', () => {})
    slider.removeEventListener('mouseleave', () => {})
  }

  window.removeEventListener('keydown', () => {})
})
</script>


<template>
  <div class="relative w-full overflow-hidden">
    <!-- Slide container -->
    <div
      class="flex transition-transform duration-700 ease-in-out will-change-transform"
      :style="{
        width: `${props.pictures.length * 100}%`,
        transform: `translateX(-${currentIndex * (100 / props.pictures.length)}%)`
      }"
    >
      <div
        v-for="(pic, i) in props.pictures"
        :key="i"
        class="relative w-full flex-none flex flex-col"
        :style="{ width: `${100 / props.pictures.length}%` }"
      >
        <!-- Responsive picture element -->
        <picture>
          <source
            :srcset="pic.mobileUrl"
            media="(max-width: 768px)"
          />
          <img
            :src="pic.desktopUrl"
            :alt="pic.title || 'slider image'"
            class="block w-full h-auto object-cover"
            draggable="false"
          />
        </picture>

        <!-- Desktop overlay szöveg -->
        <div
          v-if="pic.simpleText"
          class="hidden md:flex absolute inset-y-0 left-0 w-full md:w-3/4 bg-gradient-to-r from-black/80 to-transparent z-10 items-center pl-8 md:pl-20 pr-6"
        >
          <div class="text-white max-w-md md:max-w-lg ">
            <h2 class="text-2xl md:text-4xl font-bold mb-3 text-white">{{ pic.title }}</h2>
            <p class="text-base md:text-lg leading-relaxed font-gilda">{{ pic.simpleText }}</p>
          </div>
        </div>

        <!-- Mobil overlay szöveg -->
        <div
          v-if="pic.simpleText"
          class="md:hidden absolute inset-0 z-10 flex flex-col justify-center items-center text-center px-4"
        >
          <div class="absolute inset-0 bg-black opacity-50"></div>
          <div class="relative text-white">
            <h2 class="text-xl mb-2 text-white font-normal">{{ pic.title }}</h2>
            <p class="text-base leading-relaxed font-gilda">{{ pic.simpleText }}</p>
          </div>
        </div>

        <!-- Mobilon ha nincs szöveg -->
        <div v-else class="md:hidden h-0"></div>
      </div>
    </div>

    <!-- Pötty navigáció -->
    <div
      class="absolute bottom-4 left-1/2 transform -translate-x-1/2 flex gap-2 z-40"
      aria-label="Slide indicators"
    >
      <button
        v-for="(pic, j) in props.pictures"
        :key="j"
        @click="currentIndex = j"
        class="w-3 h-3 rounded-full"
        :class="j === currentIndex ? 'bg-white' : 'bg-gray-500'"
        :aria-current="j === currentIndex ? 'true' : 'false'"
        :aria-label="'Go to slide ' + (j + 1)"
      />
    </div>

    <!-- Navigációs nyilak -->
    <!-- Bal nyíl -->
    <button
      @click="prev"
      class="hidden md:flex items-center justify-center absolute top-1/2 left-4 transform -translate-y-1/2 w-12 h-12 bg-primary hover:bg-primary text-white text-xl rounded-full shadow-md z-20"
      aria-label="Previous slide"
    >
      ‹
    </button>
    <!-- Jobb nyíl -->
    <button
      @click="next"
      class="hidden md:flex items-center justify-center absolute top-1/2 right-4 transform -translate-y-1/2 w-12 h-12 bg-primary hover:bg-primary text-white text-xl rounded-full shadow-md z-20"
      aria-label="Next slide"
    >
      ›
    </button>
  </div>
</template>


