<template>
    <div class="outer">
        <div v-if="process === 0 && operable.has(actioning)" @click="endBattleRound" class="content" >
            <div class="status">
                <span class="text">点击地块</span>
                <span class="c_azure">扩张</span>
                <span class="text">,剩余</span>
                <span class="c_orange">{{ combatUnit.size }}</span>
                <span class="text">块</span>
            </div>
            <div class="end">
                点击这里结束扩张
            </div>
        </div>
        <div v-if="process === 1 && operable.has(actioning)" @click="endPointAllocation" class="content">
            <div class="status">
                <span class="text">点击地块</span>
                <span class="c_green">成长</span>
                <span class="text">,剩余</span>
                <span class="c_purple">{{ score[actioning] }}</span>
                <span class="text">点</span>
            </div>
            <div class="end">
                点击这里结束成长
            </div>
        </div>
        <div v-if="!operable.has(actioning)" class="content">
            <div class="status c_red">
                其他玩家行动中
            </div>
            <div class="end">
                点击这里加速
            </div>
        </div>
    </div>
</template>

<script setup>
    import { reactive,watch } from 'vue';
    import { useStore } from 'vuex'
    import { useMapState } from '/src/hooks/useMapState.js'

    const store = useStore()
    const {actioning,operable,score,combatUnit,process} = useMapState('map', ['actioning','operable','score','combatUnit','process']);
    let endBattleRound = () => {
        store.dispatch('map/endBattleRound');
    }
    let endPointAllocation = () => {
        store.dispatch('map/endPointAllocation');
    }
</script>

<style scoped>

    .outer{
        position: absolute;
        left: 0;
        bottom: 40px;
        transform: translate(-50%,0);

        cursor: pointer;
        padding: 10px 100px;
        background-color: rgba(0, 0, 0, 0.5);
        border: 1px solid rgba(127, 127, 127, 0.75);

        display: flex;
        flex-direction: column;
    }

    .outer:hover{
        background-color: rgba(50, 50, 50, 0.1);
    }

    .status{
        white-space: nowrap;
        font-size: 20px;
        line-height: 1.5;
        color: #fff;
    }

    .c_azure{
        color: #0ff;
    }

    .c_orange{
        color: #ffa300;
    }

    .end{
        color: rgba(127, 127, 127, 0.75);

    }

    .c_purple{
        color: #f0f;
    }

    .c_green{
        color: #0f0;
    }

    .c_red{
        color: #f00;
    }
</style>