<template>
    <div v-if="visible" class="fixed inset-0 bg-black/60 flex items-center justify-center z-50" @click.self="closePopup">
      <div class="bg-white rounded-lg overflow-hidden shadow-lg max-w-[90%] md:max-w-[70%] xl:max-w-[50%] max-h-[90vh] relative flex flex-col">
        
        <!-- Bezárás gomb -->
        <button class="absolute top-2 right-2 text-xl" @click="closePopup">✕</button>
  
        <!-- Görgethető tartalom -->
        <div class="overflow-auto">
          <!-- Cím + szöveg -->
          <div class="p-4">
            <h2 class="text-xl md:text-3xl font-bold mb-2" v-html="title"></h2>
            <div class="[&_a]:underline" v-html="text"></div>
          </div>
  
          <!-- Kép -->
          <div v-if="img">
            <img :src="img" alt="" class="w-full h-auto">
          </div>
        </div>
  
            <!-- Visszaszámláló fehér körben -->
            <div class="absolute bottom-3 right-3 bg-white text-gray-700 text-sm w-9 h-9 flex items-center justify-center rounded-full shadow font-bold">
            {{ counter }}
            </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    props: ["title", "text", "img"],
    data() {
      return {
        visible: true,
        counter: 6,
        timer: null
      };
    },
    mounted() {
      this.startCountdown();
    },
    beforeUnmount() {
      clearInterval(this.timer);
    },
    methods: {
      startCountdown() {
        this.timer = setInterval(() => {
          if (this.counter > 1) {
            this.counter--;
          } else {
            this.closePopup();
          }
        }, 1000);
      },
      closePopup() {
        this.visible = false;
        clearInterval(this.timer);
      }
    }
  };
  </script>
  