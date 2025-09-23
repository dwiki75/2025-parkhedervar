import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import tailwind from '@tailwindcss/vite'
import path from 'path';

export default defineConfig({
  plugins: [vue(), tailwind()],
  build: {
    outDir: 'web/styles-data',
    emptyOutDir: true,
    manifest: true,
    rollupOptions: {
      input: './src/main.js',
      output: {
        entryFileNames: 'js/main.js',
        chunkFileNames: 'js/[name]-[hash].js',
        assetFileNames: (assetInfo) => {
          if (assetInfo.name && assetInfo.name.endsWith('.css')) {
            return 'css/out.css';
          }
          return 'assets/[name]';
        },
      },
    },
  },
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src/components'),
    },
  },
});
