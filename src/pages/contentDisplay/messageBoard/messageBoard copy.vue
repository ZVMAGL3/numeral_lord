<template>
    <div class="external" @scroll="onScroll">
        <div class="middlePart">
            <div class="messageReleaseArea">
                <div class="avatarContainer">
                    <avatarContainer
                        :imagePath="imagePath"
                    />
                </div>
                <div class="operatingArea">
                    <div class="spacer"></div>
                    <div class="editingArea">
                        <el-input
                            type="textarea"
                            class="custom_textarea"
                            maxlength="521"
                            placeholder="天青色等烟雨,评论区在等你"
                            v-model="messageText"
                            show-word-limit
                            style="font-family: Arial; font-size: 12px;"  
                        ></el-input>
                    </div>
                    <div class="spacer"></div>
                    <div class="publishButton">
                        <el-button
                            type="primary"
                            style="font-family: Arial; font-size: 18px;min-height: 100%;min-width: 100%;"
                            @click="saveMessage"
                        >发布</el-button>
                    </div>
                </div>
            </div>
            <div>
                <ul>
                    <messageBox 
                        v-for="userMessage in messageData" 
                        :key="userMessage.index" 
                        :index="userMessage.index"
                        :account="userMessage.account"
                        :userName="userMessage.userName"
                        :userMessage="userMessage.userMessage"
                        :time="userMessage.time"
                    >
                        <template v-slot:userImage>
                            <avatarContainer
                                :imagePath="`http://localhost:1023/${userMessage.account}.jpg`"
                                :useDefaultAvatar="`http://localhost:1023/defaultAvatar.jpg`"
                            />
                        </template>
                    </messageBox>
                </ul>
                <p v-if="loading">加载中...</p>
                <p v-if="!remaining">没有更多了</p>
            </div>
        </div>
    </div>
</template>

<script>
    import avatarContainer from '../../../components/avatarContainer'
    import messageBox from './messageBox'
    import { mapState } from 'vuex';
    export default {
        name:'messageBoard',
        components:{avatarContainer,messageBox},
        data(){
            return{
                //编辑留言板的内容
                messageText:'',
                loading:false,
            }
        },
        computed:{
            ...mapState('processUserInfo',['imagePath']),
            ...mapState('messageBoard',['remaining','messageData']),
        },
        methods:{
            handleFocus() {
                this.$refs.textarea.classList.add('is-focus')  
            },
            // ...mapActions('messageBoard',['readMessage']),
            saveMessage(){
                this.$store.dispatch('messageBoard/saveMessage',[this.messageText])
                this.messageText = ''
            },
            onScroll(){
                //当滑动滚动条到最底部时调用
                if (this.$el.scrollTop + this.$el.clientHeight === this.$el.scrollHeight) {
                    this.readMessage()  
                }
            },
            readMessage(){
                this.loading = true
                this.$store.dispatch('messageBoard/readMessage').then(() => {
                    this.loading = false
                })
            }
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

    .messageReleaseArea{
        display: flex;
        align-items: center;
        flex-direction: row ;
        width:100%;
        height:80px;
    }

    .avatarContainer{
        width: 70px;
        height: 70px;
    }

    .operatingArea{
        flex:1;
        display: flex;
        height: 70%;
        margin-bottom: auto;
    }

    .operatingArea:hover{
        height: 100%;
    }

    .editingArea{
        height: 100%;
        flex-grow: 0.96;
    }

    ::v-deep .custom_textarea{
        height: 100%;
    }

    ::v-deep .custom_textarea>textarea{
        height: 100%; 
        color: gray;
        background-color:gainsboro ;
    }

   ::v-deep .custom_textarea>span{
        background-color:rgb(0,0,0,0) ;
    }

    .spacer{
        flex-grow: 0.02;
    }

    .publishButton{
        height: 100%;
        width: 80px;
    }
</style>