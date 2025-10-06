<script setup>
import { ref, onMounted, onBeforeUnmount, watch, nextTick } from 'vue'

const props = defineProps({
  pictures: { type: Array, default: () => [] },
  speed: { type: Number, default: 10000 }
})

const currentIndex = ref(0)
const enableTransition = ref(true)
const isAutoplaying = ref(true)
let timer = null

// Következő dia
function next() {
  if (props.pictures.length <= 1) return
  enableTransition.value = true
  currentIndex.value += 1
}

// Előző dia
function prev() {
  if (props.pictures.length <= 1) return
  enableTransition.value = true
  currentIndex.value -= 1
  if (currentIndex.value < 0) {
    // ha visszafelé lépünk az elején, azonnal reset az utolsóra
    enableTransition.value = false
    currentIndex.value = props.pictures.length - 1
  }
}

// Autoplay
function clearTimer() {
  if (timer) clearTimeout(timer)
  timer = null
}
function scheduleNext() {
  clearTimer()
  if (!isAutoplaying.value || props.pictures.length < 2) return
  timer = setTimeout(() => {
    next()
    scheduleNext()
  }, props.speed)
}
function play()  { isAutoplaying.value = true; scheduleNext() }
function pause() { isAutoplaying.value = false; clearTimer() }
function togglePlay() { isAutoplaying.value ? pause() : play() }

watch(() => props.speed, () => { if (isAutoplaying.value) play() })
watch(currentIndex, () => { if (isAutoplaying.value) scheduleNext() })

// Swipe
let startX = 0, dragging = false
function startDrag(x) { startX = x; dragging = true }
function endDrag(x) {
  if (!dragging) return
  const dx = x - startX
  if (Math.abs(dx) > 50) (dx > 0 ? prev() : next())
  dragging = false
}

// Transition reset trükk a végtelenítéshez
async function onTransitionEnd() {
  if (currentIndex.value >= props.pictures.length) {
    enableTransition.value = false
    currentIndex.value = 0
    await nextTick()
    requestAnimationFrame(() => { enableTransition.value = true })
  }
}

onMounted(() => {
  if (props.pictures.length > 1) play()

  const root = document.querySelector('.relative.w-full.overflow-hidden')
  if (root) {
    root.addEventListener('touchstart', e => startDrag(e.touches[0].clientX), { passive: true })
    root.addEventListener('touchend',   e => endDrag(e.changedTouches[0].clientX), { passive: true })
    root.addEventListener('mousedown',  e => startDrag(e.clientX))
    root.addEventListener('mouseup',    e => endDrag(e.clientX))
    root.addEventListener('mouseleave', () => { dragging = false })
  }

  window.addEventListener('keydown', e => {
    if (e.key === 'ArrowLeft') prev()
    if (e.key === 'ArrowRight') next()
  })
})
onBeforeUnmount(() => clearTimer())
</script>

<template>
  <div class="relative w-full overflow-hidden">
    <!-- Track -->
    <div
      class="flex will-change-transform"
      :class="enableTransition ? 'transition-transform duration-700 ease-in-out' : ''"
      :style="{
        width: `${props.pictures.length * 100}%`,
        transform: `translateX(-${currentIndex * (100 / props.pictures.length)}%)`
      }"
      @transitionend="onTransitionEnd"
    >
      <div
        v-for="(pic, i) in props.pictures"
        :key="i"
        class="relative w-full flex-none flex flex-col"
        :style="{ width: `${100 / props.pictures.length}%` }"
      >
        <picture>
          <source :srcset="pic.mobileUrl" media="(max-width: 768px)" />
          <img
            :src="pic.desktopUrl"
            :alt="pic.title || 'slider image'"
            class="block w-full h-auto object-cover select-none"
            draggable="false"
          />
        </picture>

        <!-- Desktop overlay -->
        <div
          v-if="pic.simpleText"
          class="hidden md:flex absolute inset-y-0 left-0 w-full md:w-3/4 bg-gradient-to-r from-black/80 to-transparent z-10 items-center pl-8 md:pl-20 pr-6 pointer-events-none"
        >
          <div class="text-white max-w-md md:max-w-lg">
            <h2 class="text-2xl md:text-4xl font-bold mb-3">{{ pic.title }}</h2>
            <p class="text-base md:text-lg leading-relaxed font-gilda">{{ pic.simpleText }}</p>
          </div>
        </div>

        <!-- Mobil overlay -->
        <div
          v-if="pic.simpleText"
          class="md:hidden absolute inset-0 z-10 flex flex-col justify-center items-center text-center px-4 pointer-events-none"
        >
          <div class="absolute inset-0 bg-black opacity-50"></div>
          <div class="relative text-white">
            <h2 class="text-xl mb-2 font-normal">{{ pic.title }}</h2>
            <p class="text-base leading-relaxed font-gilda">{{ pic.simpleText }}</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Dots -->
    <div class="absolute bottom-4 left-1/2 -translate-x-1/2 flex gap-2 z-40" role="tablist">
      <button
        v-for="(pic, j) in props.pictures"
        :key="j"
        type="button"
        class="w-3 h-3 rounded-full transition hover:scale-125 focus:outline-none focus-visible:ring-2 focus-visible:ring-white"
        :class="j === currentIndex ? 'bg-white' : 'bg-gray-500/80'"
        :aria-label="`Ugrás a(z) ${j+1}. diára`"
        @click="currentIndex = j"
      />
    </div>

    <!-- Nyilak -->
    <button
      type="button"
      @click="prev"
      class="hidden md:flex items-center justify-center absolute top-1/2 left-6 -translate-y-1/2 w-16 h-16 bg-primary text-white rounded-full shadow-lg z-20 transition-transform hover:scale-110 focus:outline-none focus-visible:ring-2 focus-visible:ring-white group"
      aria-label="Előző dia"
    >
      <span class="text-4xl leading-none group-hover:scale-125 transition-transform">‹</span>
    </button>
    <button
      type="button"
      @click="next"
      class="hidden md:flex items-center justify-center absolute top-1/2 right-6 -translate-y-1/2 w-16 h-16 bg-primary text-white rounded-full shadow-lg z-20 transition-transform hover:scale-110 focus:outline-none focus-visible:ring-2 focus-visible:ring-white group"
      aria-label="Következő dia"
    >
      <span class="text-4xl leading-none group-hover:scale-125 transition-transform">›</span>
    </button>

    <!-- Play/Pause -->
    <button
      type="button"
      @click="togglePlay"
      class="absolute bottom-4 right-4 z-40 inline-flex items-center justify-center w-12 h-12 rounded-full bg-black/50 text-white transition-transform hover:scale-110 focus:outline-none focus-visible:ring-2 focus-visible:ring-white"
      :aria-label="isAutoplaying ? 'Szünet' : 'Lejátszás'"
    >
      <span v-if="isAutoplaying" class="text-2xl">❚❚</span>
      <span v-else class="text-2xl">▶</span>
    </button>
  </div>
</template>
