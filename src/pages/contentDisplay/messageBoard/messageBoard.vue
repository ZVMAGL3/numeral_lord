<template>
    <div class="external" @scroll="onScroll">
        <div class="middlePart">
            <div class="userInput">
                <userInput :imagePath="imagePath" replyType="message"/>
            </div>
            <div>
                <ul>
                    <messageBox 
                        v-for="userMessage in messageData" 
                        :key="userMessage.id" 
                        :imagePath="imagePath" 
                        :id="userMessage.id"
                        :account="userMessage.account"
                        :userName="userMessage.userName"
                        :userMessage="userMessage.userMessage"
                        :time="userMessage.time"
                        :commentCount="userMessage.commentCount"
                        :temporaryComments="filterComments(userMessage.id)"
                        :Comments="selectComment(userMessage.id)"
                    />
                </ul>
                <p class="bottomText" v-if="remaining">正在加载......</p>
                <p class="bottomText" v-if="!remaining">没有更多了</p>
            </div>
        </div>
    </div>
</template>

<script>
    import messageBox from './messageBox'
    import userInput from './userInput'
    import { mapState,mapMutations } from 'vuex';
    export default {
        name:'messageBoard',
        components:{messageBox,userInput},
        data(){
            return{
                counter:0,
            }
        },
        computed:{
            ...mapState('processUserInfo',['imagePath']),
            ...mapState('messageBoard',['remaining','messageData','temporaryComments']),
        },
        methods:{
            ...mapMutations('messageBoard',['initializeMessageBoard','handleSaveEvents','changeRemainingState']),
            onScroll(){
                //当滑动滚动条到最底部时调用
                if (this.$el.scrollTop + this.$el.clientHeight === this.$el.scrollHeight) {
                    this.readMessage()  
                }
            },
            //显示加载中...
            readMessage(){
                this.$store.dispatch('messageBoard/readMessage')
            },
            filterComments(id){
                return this.temporaryComments.filter(item => item.messageBoardId === id)
            },
            selectComment(id){
                return this.$store.state.messageBoard.comments[id]
            }
        },
        //退出的时候对vuex做一次初始化
        beforeDestroy(){
            console.log("退出了")
            this.initializeMessageBoard()
            this.changeRemainingState(true)
            this.handleSaveEvents(18446744073709551615)
        }
    }
</script>

<style scoped>

    .external{
        overflow:auto;
        width: 100%;
    }

    .middlePart{
        margin-right: 15vw;
        margin-left: 10vw;
        margin-top: 8vh;
        min-width: 600px;
        display: flex;
        flex-direction: column;
    }

    .userInput{
        align-items: center;
        width:100%;
        height:65px;
    }

    .bottomText{
        width: 100%;
        height: 40px;
        text-align: center;
        padding-top:20px;
        font-size:13px;
        color:#9499A0;
    }

</style>