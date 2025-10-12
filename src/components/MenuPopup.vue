<template>
    <div v-show="open" class="fixed inset-0 z-[9999]">
      <div class="absolute inset-0 bg-black/50" @click="close" />
      <div
        ref="dialog"
        class="relative mx-auto my-6 w-[92vw] max-w-3xl max-h-[90vh] overflow-auto
               rounded-2xl bg-white p-4 shadow-2xl md:my-12"
        role="dialog"
        aria-modal="true"
        :aria-labelledby="titleId"
      >
        <button
          type="button"
          class="absolute right-3 top-3 inline-flex h-9 w-9 items-center justify-center
                 rounded-full border border-gray-200 bg-white text-gray-700 hover:bg-gray-50
                 focus:outline-none focus:ring-2 focus:ring-primary"
          @click="close"
          aria-label="Bezárás"
          ref="closeBtn"
        >✕</button>
  
        <div class="pt-6">
          <!-- A teljes HTML-t a Twig állítja elő; itt biztonságosan beillesztjük -->
          <div v-html="contentHtml"></div>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue'
  
  const props = defineProps({
    title: { type: String, default: 'Heti menü' },
    contentHtml: { type: String, default: '' },
    attachment: { type: Object, default: null },
    openDefault: { type: Boolean, default: false },
  })
  
  const open = ref(props.openDefault)
  const dialog = ref(null)
  const closeBtn = ref(null)
  const titleId = 'menu-popup-title'
  
  function lockScroll(lock) {
    const html = document.documentElement
    if (lock) {
      html.dataset.prevOverflow = html.style.overflow || ''
      html.style.overflow = 'hidden'
    } else {
      html.style.overflow = html.dataset.prevOverflow || ''
      delete html.dataset.prevOverflow
    }
  }
  
  function openPopup() {
    open.value = true
    lockScroll(true)
    requestAnimationFrame(() => { closeBtn.value && closeBtn.value.focus() })
  }
  function close() {
    open.value = false
    lockScroll(false)
  }
  
  onMounted(() => {
    // ESC zárás
    window.addEventListener('keydown', (e) => {
      if (e.key === 'Escape' && open.value) close()
    })
  })
  
  // A gombhoz:
  defineExpose({ open: openPopup, close })
  </script>
  
  <style scoped>
  /* Ha szeretnél, ide jöhetnek popup-specifikus finomhangolások */
  </style>
  