// src/main.js
import './styles.css'
import { createApp } from 'vue'

// Komponensek
import ImageSliderSwiper from './components/ImageSliderSwiper.vue'
import Gallery from './components/Gallery.vue'
import HeaderMenu from './components/HeaderMenu.vue'
import Popup from './components/Popup.vue'
import MenuPopup from './components/MenuPopup.vue'


// --- Segédfüggvények ---
function safeParseJSON(str, fallback = []) {
  try { return str ? JSON.parse(str) : fallback } catch { return fallback }
}
function ds(el, key, fallback = '') {
  return (el?.dataset?.[key] ?? fallback)
}

// --- SLIDER (SWIPER) ---
{
  // FIGYELEM: az include-ban az ID legyen: id="image-slider-swiper"
  const el = document.getElementById('image-slider-swiper')
  if (el) {
    const pictures = safeParseJSON(ds(el, 'pictures'))
    const speed = ds(el, 'speed') ? Number(ds(el, 'speed')) : 5000
    console.log('[Slider] Mounting SWIPER', { count: pictures.length, speed })
    createApp(ImageSliderSwiper, { pictures, speed }).mount(el)
  }
}

// --- GALLERY ---
{
  const el = document.getElementById('gallery')
  if (el) {
    const pictures = safeParseJSON(ds(el, 'pictures'))
    createApp(Gallery, { pictures }).mount(el)
  }
}

// --- HEADER MENÜ (desktop + mobil) ---
function mountHeaderById(id) {
  const el = document.getElementById(id)
  if (!el) return
  const props = {
    logoUrl: ds(el, 'logoUrl'),
    logoAlt: ds(el, 'logoAlt'),
    languageHtml: ds(el, 'language'),
    menuItems: safeParseJSON(ds(el, 'menu')),
  }
  createApp(HeaderMenu, props).mount(el)
}
mountHeaderById('site-header')
mountHeaderById('mobile-header')

// --- POPUP ---
{
  const el = document.getElementById('vue-popup')
  if (el) {
    createApp(Popup, {
      title: ds(el, 'title'),
      text: ds(el, 'text'),
      img: ds(el, 'img'),
    }).mount(el)
  }
}


// --- MENU POPUP ---

{
  const el = document.getElementById('menu-popup-mount')
  if (el) {
    const ds = (node, key) => node.dataset[key] 
    const title = (el.dataset.title) || 'Heti menü'
    const contentHtml = el.dataset.content ? JSON.parse(el.dataset.content) : ''
    const attachment  = el.dataset.attachment ? JSON.parse(el.dataset.attachment) : null

    const app = createApp(MenuPopup, { title, contentHtml, attachment })
    const vm = app.mount(el)
    window.__menuPopup = vm // a gomb ezt hívja: window.__menuPopup.open()
  }
}