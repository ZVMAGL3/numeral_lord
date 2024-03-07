<template>
    <div class="all">
        <div class="top">
            <div class="icon">

            </div>
            <div class="searchBox">

            </div>
        </div>
        <div class="center">
            <swiper
                :src="src"
            />
        </div>
        <div class="bottom">
            <div>
                <div class="game_nav">
                    <p class="decorative-line"></p>
                    <span>热门推荐</span>
                </div>
                <div v-if="data && data.games" class="game_card">
                    <div class="GameCardHome-box" v-for="game in data.games">
                        <div class="van_image">
                            <img :src="game.Image" class="van-image__img">
                        </div>
                        <div class="game_name_home_text">
                            {{ game.Title }}
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="game_nav">
                    <p class="decorative-line"></p>
                    <span>浏览记录</span>
                </div>
                <div v-if="data && data.games" class="game_card">
                    <div class="GameCardHome-box" v-for="historyName in history">
                        <div class="van_image">
                            <img :src="data.games[historyName].Image" class="van-image__img">
                        </div>
                        <div class="game_name_home_text">
                            {{ data.games[historyName].Title }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    import {reactive} from 'vue'
    import swiper from '/src/components/swiper/swiper.vue'
    import useApi from '/src/hooks/useApi.js';
    
    //记录要播放的图片地址
    let src = reactive([
        'https://game.xdline.cn/client/gamespace/fileServer/static/app/image/ad/plane1.png',
        'https://game.xdline.cn/client/gamespace/fileServer/static/app/image/ad/plane2.png',
    ])

    const { data, error, isLoading, fetchData } = useApi()
    
    fetchData()

    let history = ['secondGame','fourGame']
</script>

<style scoped>
    .all{
        height: 100vh;
        width: 100vw;
        display: flex;
        flex-direction: column;
        background-color: #292725;
        color:#fff;
    }

    .top{
        display: flex;
    }

    .center{
        height: 20vh;
        width: 100vw;
    }

    .bottom{
        padding-left: 3vw;
        padding-right: 3vw;
    }

    .game_nav{
        text-align: left;
        display: flex;
        align-items: center;
        position: relative;
    }

    .decorative-line{
        width: .483092vw;
        height: 4.830918vw;
        background: #f9d341;
        border-radius: .01333rem;
        margin-right: .26667rem;
    }

    .game_card{
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        align-content: center;
        padding-left: 2.415459vw;
        padding-right: 2.415459vw;
    }

    .GameCardHome-box{
        width: 44.202899vw;
        height: 28.502415vw;
        display: flex;
        flex-direction: column;
        background: #393631;
        margin-bottom: 3.623188vw;
    }

    .van_image{
        position: relative;
        display: inline-block;
        display: flex; /* 使用 Flex 布局 */
        justify-content: center; /* 水平居中 */
        overflow: hidden; /* 设置不溢出 */
    }

    .van-image__img{
        display: block;
        width: 100%;
        height: 100%;
    }

</style>
