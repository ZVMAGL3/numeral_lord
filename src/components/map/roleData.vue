<template>
    <div class="outer">
        <div v-for="int,index in player_num" :class="`player_box ${index === actioning?'background':''}`" :style="`order:${fraction[index]*(-1)};`">
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

    import { useStore } from 'vuex'
    import { useMapState } from '/src/hooks/useMapState.js'

    const store = useStore()
    const {fraction,player_name,actioning,player_num,player_ico} = useMapState('map', ['fraction','player_name','actioning','player_num','player_ico']);

</script>

<style scoped>

    .outer{
        position: relative;
        display: flex;
        flex-direction: column;
    }

    .player_box{
        display: flex;
        flex-direction: row;
        min-height: 25.98px;
        height: 10.39vw;
        max-height: 51.96px;
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