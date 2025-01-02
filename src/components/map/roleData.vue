<template>
    <div class="outer">
        <div v-for="int,index in player_num" :class="`player_box ${index === actioning?'background':''}`" :style="`top:${fraction_input[index]}px`">
            <div class="chessman_box">
                <img 
                    class="chessman" 
                    :src="`numberGame/Sprite/${player_ico[index]}`"
                />
            </div>
            <div class="playerInfoBox">
                <div class="playe_name">
                    {{ player_name[index] }}
                </div>
                <div class="playe_score">
                    {{ fraction[index] }}
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    import { reactive,watch } from 'vue';
    import { useStore } from 'vuex'
    import { useMapState } from '/src/hooks/useMapState.js'

    const store = useStore()
    const {fraction,player_name,actioning,player_num,player_ico} = useMapState('map', ['fraction','player_name','actioning','player_num','player_ico']);
    let fraction_input = reactive(new Array(player_num.value).fill(0));
    function getSortedIndexes(arr) {
        // 创建一个包含元素及其原始索引的副本
        let indexedArray = arr.map((value, index) => ({ value, index }));
        
        // 按照值进行降序排序
        indexedArray.sort((a, b) => b.value - a.value);

        // 提取排序后的索引
        return indexedArray.map(item => item.index);
    }
    // 监听数组变化
    watch(fraction, (newItems, oldItems) => {
        let new_fraction_input = getSortedIndexes(newItems)

        new_fraction_input.forEach((value,index) => {
            return fraction_input[value] = (index - value) * 52;
        });
    },{deep:true});
</script>

<style scoped>

    .outer{
        position: relative;
        display: flex;
        flex-direction: column;
    }

    .player_box{
        position: relative;
        top: 0;
        left: 0;
        display: flex;
        flex-direction: row;
        min-height: 25.98px;
        height: 10.39vw;
        max-height: 51.96px;
        transition: all 700ms cubic-bezier(0.25, 0.5, 0.75, 1);
    }

    .background{
        background: radial-gradient(circle at 120% 50%, rgba(22,28,40,0) 40%, rgb(40, 58, 194,0.5) 99%)
    }

    .chessman_box{
        position: relative;
        min-width: 25.98px;
        width: 10.39vw;
        max-width: 51.96px;
        height: 100%;
    }

    .chessman{
        min-height: 20px;
        min-width: 17.32px;
        height: 8vw;
        width: 6.92vw;
        max-height: 40px;
        max-width: 34.64px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    
    .playerInfoBox{
        display: flex;
        flex-direction: column;
    }

    .playe_name{
        display: flex;
        color:#78bfdb;
    }

    .playe_score{
        flex: 1;
        padding-left: 10px;
        display: flex;
        align-items: center;
    }

</style>