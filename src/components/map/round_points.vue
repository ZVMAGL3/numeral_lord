<template>
    <div class="outer">
        <div class="topBox scoreboard">
            <img src="numberGame/Sprite/IconMenu.png" alt="">
        </div>
        <div class="Placeholder"></div>
        <div class="topBox people_num">
            <div class="title">人数</div>
            <div class="people_num_data">{{ player_num }}</div>
        </div>
        <div class="topBox round">
            <div class="title">回合</div>
            <div class="round_data">{{ player_num }}</div>
        </div>
        <div class="topBox score">
            <div class="title">点数</div>
            <div class="score_data">
                <span>{{ score[actioning] }}</span>
                <span>(+{{ roundScore[actioning] }})</span>
            </div>
        </div>
        <div class="Placeholder"></div>
        <div class="topBox setUp">
            设置
        </div>
    </div>
</template>

<script setup>

    import { useMapState } from '/src/hooks/useMapState.js'

    const {fraction,score,actioning,player_num,roundScore} = useMapState('map', ['fraction','score','actioning','player_num','roundScore']);

</script>

<style scoped>

    .Placeholder{
        flex:1
    }

    .outer{
        position: relative;
        width: 100vw;
        height: 7.5vh;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        background: linear-gradient(to bottom, #000 0%,rgba(0,0,0,0) 100%);
    }

    .title{
        color:#888;
        height: 25px;
        font-size: 20px;
        line-height: 25px;
    }
    
    .topBox {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
    }

    .scoreboard{
        min-width: 6.5vh;
        width: 4vw;
        max-width: 7.5vh;
    }

    .scoreboard>img{
        height: 6vh;
        width: 5.196vh;
    }

    .people_num{
        min-width: 6.5vh;
        width: 4vw;
        max-width: 7.5vh;
    }

    .people_num_data{
        height: 28px;
        font-size: 23px;
        line-height: 28px;
        color: chocolate;
    }

    .round{
        flex:0.4;
    }

    .score{
        min-width: 6.5vh;
        width: 4vw;
        max-width: 7.5vh;
    }

    .round_data{
        height: 28px;
        font-size: 23px;
        line-height: 28px;
        color: aqua;
    }

    .score_data{
        height: 28px;
        font-size: 23px;
        line-height: 28px;
    }

    .score_data>span:nth-child(1){
        color: rgb(220, 36, 237);
    }

    .score_data>span:nth-child(2){
        color: darksalmon;
    }

    .setUp{
        min-width: 6.5vh;
        width: 4vw;
        max-width: 7.5vh;
    }

</style>