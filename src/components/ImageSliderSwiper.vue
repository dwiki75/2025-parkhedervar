<script setup>
import { ref, computed, onMounted } from 'vue'
import { Swiper, SwiperSlide } from 'swiper/vue'
import { Autoplay, A11y } from 'swiper/modules'
import 'swiper/css'

const props = defineProps({
  pictures: { type: Array, default: () => [] },
  speed:    { type: Number, default: 5000 }
})

const swiperRef   = ref(null)
const active      = ref(0)
const autoRunning = ref(false)

const loopEnabled = computed(() => props.pictures.length > 1)
// ↓ csökkentett mozgás
const prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches

function onSwiper(swiper) {
  swiperRef.value   = swiper
  active.value      = swiper.realIndex ?? 0
  autoRunning.value = !!swiper.autoplay?.running
}

function onSlideChange(swiper) { active.value = swiper.realIndex ?? 0 }
function onAutoplayStart()    { autoRunning.value = true }
function onAutoplayStop()     { autoRunning.value = false }

function next() { swiperRef.value?.slideNext() }
function prev() { swiperRef.value?.slidePrev() }
function goTo(i){
  const s = swiperRef.value
  if (!s) return
  if (loopEnabled.value && typeof s.slideToLoop === 'function') s.slideToLoop(i)
  else s.slideTo(i)
}
function togglePlay() {
  const s = swiperRef.value
  if (!s || !s.autoplay) return
  if (autoRunning.value) { s.autoplay.stop(); autoRunning.value = false }
  else { s.params.autoplay.disableOnInteraction = false; s.autoplay.start(); autoRunning.value = true }
}

onMounted(() => {
  // ha reduced motion, ne induljon autoplay
  if (prefersReduced && swiperRef.value?.autoplay?.running) {
    swiperRef.value.autoplay.stop()
    autoRunning.value = false
  }
})
</script>

<template>
  <div
    class="relative w-full overflow-hidden"
    @keydown.space.prevent="togglePlay"
    role="region"
    aria-label="Kiemelt képek csúszka"
  >
    <!-- Élő státusz a képernyőolvasónak -->
    <p class="sr-only" aria-live="polite">
      {{ active + 1 }} / {{ props.pictures.length }}
      <template v-if="props.pictures[active]?.title"> – {{ props.pictures[active]?.title }}</template>
    </p>

    <Swiper
      :modules="[Autoplay, A11y]"
      :slides-per-view="1"
      :loop="loopEnabled"
      :rewind="false"
      :autoplay="(!prefersReduced && loopEnabled) ? { delay: props.speed, disableOnInteraction: false } : false"
      :a11y="{ enabled: true }"
      class="relative w-full h-full"
      @swiper="onSwiper"
      @slideChange="onSlideChange"
      @autoplayStart="onAutoplayStart"
      @autoplayStop="onAutoplayStop"
    >
      <SwiperSlide
        v-for="(pic, i) in props.pictures"
        :key="i + '-' + (pic?.desktopUrl || 'slide')"
        class="relative"
        :id="`slide-${i}`"
        role="group"
        :aria-label="`${i+1} / ${props.pictures.length}`"
      >
        <picture>
          <source :srcset="pic?.mobileUrl" media="(max-width: 768px)" />
          <img
            :src="pic?.desktopUrl"
            :alt="pic?.alt ?? pic?.title ?? ''"
            class="block w-full h-auto object-cover select-none"
            draggable="false"
          />
        </picture>

        <!-- overlay-ek maradhatnak, pointer-events: none jó -->
      </SwiperSlide>
    </Swiper>

    <!-- Pöttyök -->
    <div
      v-if="props.pictures.length > 1"
      class="absolute bottom-4 left-1/2 -translate-x-1/2 flex gap-2 z-40"
      role="tablist"
      aria-label="Dia navigáció"
    >
      <button
        v-for="(_, j) in props.pictures.length"
        :key="'dot-' + j"
        type="button"
        role="tab"
        class="w-3 h-3 rounded-full transition transform hover:scale-125 focus:outline-none focus-visible:ring-2 focus-visible:ring-white"
        :class="j === active ? 'bg-white' : 'bg-gray-500/80'"
        :aria-selected="j === active ? 'true' : 'false'"
        :aria-current="j === active ? 'true' : 'false'"
        :aria-controls="`slide-${j}`"
        :tabindex="j === active ? 0 : -1"
        :title="`Ugrás a(z) ${j+1}. diára`"
        @click="goTo(j)"
      />
    </div>

    <!-- NAGY NYILAK -->
    <button
      v-if="props.pictures.length > 1"
      type="button"
      @click="prev"
      class="hidden md:flex items-center justify-center absolute top-1/2 left-6 -translate-y-1/2
             w-16 h-16 bg-primary text-white rounded-full shadow-lg z-20 transition-transform
             hover:scale-110 focus:outline-none focus-visible:ring-2 focus-visible:ring-white group"
      aria-label="Előző dia"
    >
      <span class="text-4xl leading-none transition-transform duration-150 group-hover:scale-125">‹</span>
    </button>

    <button
      v-if="props.pictures.length > 1"
      type="button"
      @click="next"
      class="hidden md:flex items-center justify-center absolute top-1/2 right-6 -translate-y-1/2
             w-16 h-16 bg-primary text-white rounded-full shadow-lg z-20 transition-transform
             hover:scale-110 focus:outline-none focus-visible:ring-2 focus-visible:ring-white group"
      aria-label="Következő dia"
    >
      <span class="text-4xl leading-none transition-transform duration-150 group-hover:scale-125">›</span>
    </button>

    <!-- PLAY / PAUSE -->
    <button
      v-if="props.pictures.length > 1"
      type="button"
      @click="togglePlay"
      class="absolute bottom-4 right-4 z-40 inline-flex items-center justify-center
             w-12 h-12 rounded-full bg-black/50 text-white transition-transform
             hover:scale-110 focus:outline-none focus-visible:ring-2 focus-visible:ring-white group"
      :aria-label="autoRunning ? 'Szünet' : 'Lejátszás'"
      :aria-pressed="autoRunning ? 'true' : 'false'"
      title="Autoplay váltása"
    >
      <span v-if="autoRunning" class="text-2xl leading-none transition-transform duration-150 group-hover:scale-125">❚❚</span>
      <span v-else class="text-2xl leading-none transition-transform duration-150 group-hover:scale-125">▶</span>
    </button>
  </div>
</template>
