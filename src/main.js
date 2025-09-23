// src/main.js

import './styles.css';

import { createApp } from 'vue'
import ImageSlider from './components/ImageSlider.vue'
import Gallery from './components/Gallery.vue'
import HeaderMenu from './components/HeaderMenu.vue' // ✅ név egyezik
import Popup from './components/Popup.vue' // ⬅ új import

// ImageSlider mount
const el = document.getElementById('image-slider')
if (el) {
  const pictures = JSON.parse(el.dataset.pictures)
  const speed = el.dataset.speed ? Number(el.dataset.speed) : undefined
  createApp(ImageSlider, { pictures, speed }).mount(el)
}

// Gallery mount
const galleryEl = document.getElementById('gallery')
if (galleryEl) {
  const pictures = JSON.parse(galleryEl.dataset.pictures)
  createApp(Gallery, { pictures }).mount(galleryEl)
}


// Header mount

// Feltételezve, hogy a twig-ben a #site-header elemre mountolunk
function mountHeaderById(id) {
  const el = document.getElementById(id);
  if (el) {
    const logoUrl = el.dataset.logoUrl;
    const logoAlt = el.dataset.logoAlt;
    const menuItems = JSON.parse(el.dataset.menu);

    createApp(HeaderMenu, { logoUrl, logoAlt, menuItems }).mount(el);
  }
}

mountHeaderById('site-header');      // desktop
mountHeaderById('mobile-header'); 



// Popup mount
const popupEl = document.getElementById('vue-popup')
if (popupEl) {
  createApp(Popup, {
    title: popupEl.dataset.title,
    text: popupEl.dataset.text,
    img: popupEl.dataset.img
  }).mount(popupEl)
}
