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

    // 地块编码的图片路径
    const tileCodeToImagePath = {
        P: "numberGame/Sprite/TS_Mountain.png", // 山地
        S: "numberGame/Sprite/TS_Stronghold.png", //据点
        M: "", //陆地
        O: "", //海洋
        V: "" //虚无
    };

    const { tileCodeString,long } = useMapState('map', ['tileCodeString','long']);

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