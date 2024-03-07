// useBackground.js

import { throttle } from 'lodash';
import { ref, onMounted, onBeforeUnmount } from 'vue';

export default function useBackground() {
    //保存最大的宽的高
    let maxWidth = window.innerWidth * 1.5 > 1200 ? window.innerWidth * 1.5 : 1200
    let maxHeight = window.innerHeight * 1.5 > 800 ? window.innerHeight * 1.5 : 800
    const myCanvas = ref(null);

    //根号3
    const sqrt_3 = Math.sqrt(3);

    const onResize = throttle(() => {
        if (maxHeight < window.innerHeight || maxWidth < window.innerWidth) {
            maxHeight = (maxHeight > window.innerHeight) ? maxHeight : window.innerHeight * 1.5
            maxWidth = (maxWidth > window.innerWidth) ? maxWidth : window.innerWidth * 1.5
            background();
        }
    }, 200, { trailing: true });

    //绘画背景
    function background() {
        const canvas = myCanvas.value;
        const context = canvas.getContext('2d');

        // 设置Canvas尺寸
        canvas.width = maxWidth;
        canvas.height = maxHeight;

        let x = 0.0;
        let y = 0.0;

        context.beginPath();

        //线段的宽
        const overflow_width = maxHeight;
        //线段间隔
        const interval = 4.5
        for (let row = 0; row < (maxWidth + overflow_width) / interval; row++) {
          x = row * interval
          context.moveTo(x, 0);
          context.lineTo(x - overflow_width, maxHeight);
        }
        // 绘制边框线条
        context.strokeStyle = '#2c3440';
        context.lineWidth = 1.5;
        context.stroke();

        context.beginPath();
        // 定义正六边形的边长
        const sideLength = 40;
        // 计算正六边形的高度
        // const height = sideLength * 2.0;
        for (let row = 0; row < (maxHeight / (sideLength * 1.5)) + 1; row++) {
            y = sideLength * 1.5 * row + 2
            for (let col = 0; col < (maxWidth / (sqrt_3 * sideLength)) + 1; col++) {
                x = sqrt_3 * sideLength * (col - (row % 2) * 0.5) + 2
                // 绘制正六边形边框
                context.moveTo(x, y + sideLength * 1.5);
                context.lineTo(x, y + sideLength / 2);
                context.lineTo(x + sqrt_3 * sideLength / 2, y);
                context.lineTo(x + sqrt_3 * sideLength, y + sideLength / 2);
            }
        }
        // 绘制边框线条
        context.strokeStyle = '#000';
        context.lineWidth = 0.8;
        context.stroke();
    }

    onMounted(() => {
        background();
        window.addEventListener('resize', onResize);
    });

    onBeforeUnmount(() => {
        window.removeEventListener('resize', onResize);
    });

    return {
       myCanvas
    };
}