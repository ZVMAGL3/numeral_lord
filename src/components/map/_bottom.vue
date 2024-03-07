<template>
    <div class="chessboard" :style="checkerboardSize">
        <div 
            v-for="(tileCode, index) in tileCodeString" 
            :key="index" 
            class="cell" 
            :style="getTileStyle(index)"
        >
            <img 
                v-if="tileCodeToImagePath[tileCode]"
                :src="tileCodeToImagePath[tileCode]"
            />
        </div>
    </div>
</template>

<script setup>

    import map from '/src/hooks/map.js'
    import { useMapState } from '/src/hooks/useMapState.js'

    // 假设有一个地块编码到图片路径的映射对象
    const tileCodeToImagePath = {
        P: "", // 山地
        //   S: "public/numberGame/Sprite/TS_Stronghold.png", //据点
        S: "numberGame/Sprite/TS0.png", //据点
        M: "numberGame/Sprite/TS0.png", //陆地
        O: "numberGame/Sprite/TS_Water.png", //海洋
        V: "" //虚无
    };
    
    const { tileCodeString } = useMapState('map', ['tileCodeString']);

    const {checkerboardSize,getTileStyle} = map()
</script>

<style scoped>

    .chessboard{
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        overflow: hidden; /* 溢出 */
        pointer-events:none;
    }

    .cell{
        height: 80px;
        position: absolute;
        overflow: hidden; /* 溢出 */
    }

    .cell>img{
        height: 80px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    
</style>