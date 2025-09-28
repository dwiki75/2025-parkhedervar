// src/main.js
import './styles.css'

import { createApp } from 'vue'
import ImageSlider from './components/ImageSlider.vue'
import Gallery from './components/Gallery.vue'
import HeaderMenu from './components/HeaderMenu.vue'
import Popup from './components/Popup.vue'

// -- Kisegítő függvények --
function safeParseJSON(str, fallback = []) {
  try {
    return str ? JSON.parse(str) : fallback
  } catch {
    return fallback
  }
}
function ds(el, key, fallback = '') {
  return (el?.dataset?.[key] ?? fallback)
}

// -- ImageSlider mount --
{
  const el = document.getElementById('image-slider')
  if (el) {
    const pictures = safeParseJSON(ds(el, 'pictures'))
    const speed = ds(el, 'speed') ? Number(ds(el, 'speed')) : undefined
    createApp(ImageSlider, { pictures, speed }).mount(el)
  }
}

// -- Gallery mount --
{
  const el = document.getElementById('gallery')
  if (el) {
    const pictures = safeParseJSON(ds(el, 'pictures'))
    createApp(Gallery, { pictures }).mount(el)
  }
}

// -- HeaderMenu mount (desktop + mobil támogatás) --
function mountHeaderById(id) {
  const el = document.getElementById(id)
  if (!el) return

  const props = {
    logoUrl: ds(el, 'logoUrl'),
    logoAlt: ds(el, 'logoAlt'),
    languageHtml: ds(el, 'language'),          // ⬅️ nyelvváltó HTML
    menuItems: safeParseJSON(ds(el, 'menu'))    // ⬅️ menü tömb
  }

  createApp(HeaderMenu, props).mount(el)
}
mountHeaderById('site-header')   // desktop
mountHeaderById('mobile-header') // mobil

// -- Popup mount --
{
  const el = document.getElementById('vue-popup')
  if (el) {
    createApp(Popup, {
      title: ds(el, 'title'),
      text: ds(el, 'text'),
      img: ds(el, 'img')
    }).mount(el)
  }
}
