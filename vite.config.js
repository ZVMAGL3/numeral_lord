import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';

export default defineConfig({
  // 禁用依赖优化预构建
  optimizeDeps: false,
  // 忽略 server 目录
  ignore: ['server'],
  // 插件配置
  plugins: [
    vue(),
    // 其他插件...
  ],
  // 其他配置...
});