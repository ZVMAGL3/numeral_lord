<template>
    <div class="chessboard" :style="checkerboardSize">
        <div 
            v-for="chessman, index in soldiers" 
            :key="index" 
            class="cell" 
            :style="getTileStyle(index)"
        >
            <img
                class="chessman"
                v-if="tileCodeToImagePath[tileCodeString[index]]"
                :src="tileCodeString[index] !== 'S'?tileCodeToImagePath[tileCodeString[index]]:tileCodeToImagePath['M']"
            />

            <img 
                v-if="chessman.dots>0" 
                class="chessman" 
                :src="`numberGame/Sprite/${player_ico[chessman.contingent]}`"
                :style="specialForces.has(index)?'height:60px;':''"
            />

            <img 
                class="chessman"
                v-if="tileCodeToImagePath[tileCodeString[index]] && tileCodeString[index] === 'S'"
                :src="tileCodeToImagePath[tileCodeString[index]]"
            />

            <aperture :chessman="chessman" :index="index"/>

            <span v-if="chessman.dots>1 || specialForces.has(index)" :style="spanStyle(index)">{{ chessman.dots }}</span>
        </div>
        <img class="selected" v-if="selected.length && !specialForces.has(selected[0])" src="numberGame/Sprite/TST.png" :style="getTileStyle(selected[0])">            
        <div class="operationsLayer" @click.stop="checkerboardClickEvent"></div>
    </div>
</template>

<script setup>

    import map from '/src/hooks/map.js'
    import { useStore } from 'vuex'
    import { useMapState } from '/src/hooks/useMapState.js'
    import aperture from '/src/components/map/aperture.vue'
    import { onMounted } from "vue";
    
    const store = useStore()

    const { soldiers,tileCodeString,selected,specialForces,process,player_ico,actioning } = useMapState('map', ['soldiers','tileCodeString','selected','specialForces','process','player_ico','actioning']);

    // 地块编码的图片路径
    const tileCodeToImagePath = {
        P: "numberGame/Sprite/TS_Mountain.png", // 山地
        S: "numberGame/Sprite/TS_Stronghold.png", //据点
        M: "numberGame/Sprite/TS0.png", //陆地
        O: "numberGame/Sprite/TS_Water.png", //海洋
        V: "" //虚无
    };

    const {checkerboardSize,getTileStyle,getTileIndexFromWindowCoords,spanStyle} = map() //引入棋盘样式

    //处理用户点击事件
    function checkerboardClickEvent(event){
        // 获取父元素的位置信息
        const parentRect = event.target.getBoundingClientRect();
        // 计算相对于父元素的坐标
        const xCoord = event.clientX - parentRect.left;
        const yCoord = event.clientY - parentRect.top;
        let index = getTileIndexFromWindowCoords(xCoord,yCoord)
        if(index !== false){
            if(process.value){
                store.dispatch('map/bonusEvent',index)
            }else{
                store.dispatch('map/selectedEvent',index)
            }
        }
    }

    onMounted(()=>{
        //初始化
        store.dispatch('map/initialization')
    })

</script>

<style scoped>

    .chessboard{
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        overflow: hidden; /* 溢出 */
    }

    .cell{
        position: absolute;
        overflow: hidden; /* 溢出 */
        pointer-events:none;
        user-select: none; 
    }

    .chessman{
        height: 80px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

    .cell>span{
        height: 80px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        line-height: 80px;
        font-size: 24px;
        color:darkgray;
        font-family: 'KaiTi', serif;
        font-weight:bold;
        user-select: none; 
    }

    .selected{
        position: absolute;
        pointer-events:none;
        user-select: none; 
    }

    .operationsLayer{
        width: 100%;
        height: 100%;
        background-color: rgb(0, 0, 0, 0);
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

</style>