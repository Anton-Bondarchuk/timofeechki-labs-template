import { resolve } from 'path';

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vite.dev/config/
export default defineConfig({
  plugins: [vue()],
  resolve: {
    alias: {
      '@components': resolve(__dirname, './src/components'),
      '@stores': resolve(__dirname, './src/stores'),
      '@api': resolve(__dirname, './src/api'),
      '@helpers': resolve(__dirname, './src/lib/helpers'),
      '@src': resolve(__dirname, './src'),
    },
  },
  server: {
    port: 5177
  },
})
