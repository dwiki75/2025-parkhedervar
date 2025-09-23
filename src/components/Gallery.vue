<script setup>
import { ref, onMounted, onBeforeUnmount } from 'vue'

const props = defineProps({
  pictures: {
    type: Array,
    default: () => []
  }
})

const lightboxOpen = ref(false)
const currentIndex = ref(0)

function openLightbox(index) {
  currentIndex.value = index
  lightboxOpen.value = true
  document.body.classList.add('overflow-hidden')
}
function closeLightbox() {
  lightboxOpen.value = false
  document.body.classList.remove('overflow-hidden')
}
function nextImage() {
  currentIndex.value = (currentIndex.value + 1) % props.pictures.length
}
function prevImage() {
  currentIndex.value = (currentIndex.value - 1 + props.pictures.length) % props.pictures.length
}

let touchStartX = 0
let touchEndX = 0

function handleTouchStart(e) {
  touchStartX = e.changedTouches[0].screenX
}
function handleTouchEnd(e) {
  touchEndX = e.changedTouches[0].screenX
  if (touchEndX < touchStartX - 40) nextImage()
  else if (touchEndX > touchStartX + 40) prevImage()
}

function handleKeydown(e) {
  if (!lightboxOpen.value) return
  if (e.key === 'ArrowRight') nextImage()
  else if (e.key === 'ArrowLeft') prevImage()
  else if (e.key === 'Escape') closeLightbox()
}

onMounted(() => {
  window.addEventListener('keydown', handleKeydown)
})
onBeforeUnmount(() => {
  window.removeEventListener('keydown', handleKeydown)
})
</script>

<template>
  <div class="masonry-container px-2 sm:px-4 md:px-8 max-w-8xl mx-auto">
    <div class="columns-2 sm:columns-2 md:columns-4 2xl:columns-5 gap-4">
      <div
        v-for="(pic, i) in pictures"
        :key="pic.id"
        class="break-inside-avoid rounded-lg overflow-hidden cursor-pointer mb-4"
        @click="openLightbox(i)"
      >
      <div class="break-inside-avoid rounded-lg overflow-hidden cursor-pointer mb-4">
        <picture>
          <source :srcset="pic.thumbWebp" type="image/webp" />
          <img
            :src="pic.thumbJpg"
            :alt="pic.alt"
            class="w-full h-auto object-cover block transition-transform duration-500 ease-out hover:scale-110"
            loading="lazy"
            draggable="false"
          />
        </picture>
      </div>
      </div>
    </div>

    <!-- Lightbox -->
    <transition name="fade">
      <div
        v-show="lightboxOpen"
        class="fixed inset-0 bg-black bg-opacity-90 flex flex-col items-center justify-center z-50 transition-opacity duration-300"
        @click.self="closeLightbox"
        @touchstart="handleTouchStart"
        @touchend="handleTouchEnd"
      >
        <button
          @click="closeLightbox"
          class="absolute top-6 right-6 text-white text-3xl font-bold z-60"
        >
          &times;
        </button>

        <button
          @click.stop="prevImage"
          class="absolute left-6 top-1/2 transform -translate-y-1/2 text-white text-4xl z-60 p-4"
        >
          ‹
        </button>

        <picture class="max-w-[90vw] max-h-[90vh] transition-all duration-300">
          <source :srcset="pictures[currentIndex].largeWebp" type="image/webp" />
          <img
            :src="pictures[currentIndex].largeJpg"
            :alt="pictures[currentIndex].alt"
            class="max-w-full max-h-full object-contain"
            draggable="false"
          />
        </picture>

        <button
          @click.stop="nextImage"
          class="absolute right-6 top-1/2 transform -translate-y-1/2 text-white text-4xl z-60 p-4"
        >
          ›
        </button>
      </div>
    </transition>
  </div>
</template>

<style>
.fade {
  transition: opacity 1.9s ease;
}
</style>
