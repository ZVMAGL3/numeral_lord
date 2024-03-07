<template>
    <li class="messageBox">
        
        <div class="imageExternal">
            <div class="userImage" @click="jumpHomePage(account)">
                <avatarContainer
                    :imagePath="`http://localhost:1023/${account}.jpg`"
                    :defaultAvatar="`http://localhost:1023/defaultAvatar.jpg`"
                />
            </div>
            <div style="flex:1;"></div>
        </div>

        <div class="contentDisplay">

            <div class="userInfo">
                <div class="userName" @click="jumpHomePage(account)">
                    <span>{{ userName }}</span>
                </div>

                <div class="id">
                    <span>#{{ id }}</span>
                </div>
            </div>

            <div class="userMessage">
                <span>{{ userMessage }}</span>
            </div>

            <div class="operatingArea">
                <div class="timestamp">
                    <span>{{ timestamp(time) }}</span>
                </div>

                <div class="reply">
                    <button class="replyButton" @click="modifyReplyStatus(!replyStatus,userName,'')">回复</button >
                </div>
            </div>
            
            <div class="commentArea" v-if="commentSdealtWith">
                <ul>
                    <userComment
                        v-for="comment in commentSdealtWith.slice((currentPage-1)*pageSize,currentPage*pageSize)"
                        :key="comment.id"
                        :id="comment.id"
                        :account="comment.account"
                        :userName="comment.userName"
                        :content="comment.content"
                        :time="comment.time"
                        :replyTo="comment.replyTo"
                        :replierName="comment.replierName"
                        :replyStatus="modifyReplyStatus"
                        :timestamp="timestamp"
                        :jumpHomePage="jumpHomePage"
                    />
                </ul>
                <span v-if="commentCount > 3 && !commentStatus">共计{{ commentCount }}条评论,<button class="replyButton" @click="viewAll">点击查看</button ></span>
                <el-pagination
                    v-if="(commentStatus) && commentSdealtWith && (commentSdealtWith.length > pageSize) "
                    @current-change="handleCurrentChange"
                    :current-page.sync="currentPage"
                    :total="commentSdealtWith.length"
                    :page-size="pageSize"
                    layout="total, prev, pager, next"
                ></el-pagination>
            </div>

            <div class="userInput" v-if="replyStatus">
                <userInput 
                    :imagePath="imagePath" 
                    :placeholder="placeholder" 
                    :replyTo="replyTo"
                    :id="id" 
                    :packagingMethod="packagingMethod"
                />
            </div>

            <div class="bottomLine"></div>

        </div>

        <!-- <div style="flex:1;"></div> -->


    </li>
</template>

<script>
    import avatarContainer from '/src/components/avatarContainer'
    import userInput from './userInput'
    import userComment from './userComment'
    export default {
        name:'messageBox',
        components:{avatarContainer,userInput,userComment},
        props:['account','userName','time','userMessage','id','imagePath','commentCount','temporaryComments','Comments'],
        data(){
            return{
                replyStatus:false, //显示回复
                commentStatus:false, //显示全部评论
                placeholder:'', //输入框默认文本
                // prefix:'', //回复内容的前缀
                currentPage:1, //记录页数
                pageSize:10, //每页个数
                replyTo:'', //回复的对象,目标为层主则为空
            }
        },
        computed:{
            //返回显示全部还是部分
            commentSdealtWith(){
                if(!this.commentStatus || !this.Comments){
                    return this.temporaryComments
                }else{
                    return this.Comments
                }
            },
            //计算总页数
            pageCount(){
                return Math.ceil(this.commentSdealtWith.length / this.pageSize)
            }
        },
        mounted(){
            console.log(this.commentCount)
        },
        methods:{
            //跳转到用户主页
            jumpHomePage(account){
                this.$router.push({
                    name:'homePage',
                    params:{account:account},
                }).catch(err => {err})
            },
            //格式化时间
            timestamp(time){
                const date = new Date(time)
                const now = new Date()
                const diff = now - date  
                if (diff < 60 * 1000) {
                    return `刚刚`
                } else if (diff < 60 * 60 * 1000) {    
                    const minutes = Math.floor(diff / (60 * 1000))
                    return `${minutes}分钟前`
                } else if (diff < 24 * 60 * 60 * 1000) {   
                    const hours = Math.floor(diff / (60 * 60 * 1000))
                    return `${hours}小时前`  
                } else {
                    return date.getFullYear() + '-' + 
                        this.pad(date.getMonth() + 1) + '-' + 
                        this.pad(date.getDate()) + ' ' + 
                        this.pad(date.getHours()) + ':' + 
                        this.pad(date.getMinutes())
                }
            },
            pad(n){
                return n < 10 ? '0' + n : n  
            },
            //
            modifyReplyStatus(value,userName,account){
                this.replyStatus = value
                this.placeholder = `回复@${userName}:`
                this.replyTo = account
                // if(prefix){this.prefix = this.placeholder}
            },
            viewAll(){
                this.$store.dispatch('messageBoard/viewAll',this.id).then(() => {
                    this.ReviseCommentStatus(true)
                })
            },
            ReviseCommentStatus(value){
                this.commentStatus = value
            },
            handleCurrentChange(val){
                this.currentPage = val
            },
            jumpLastpage(){
                setTimeout(() => {
                    this.currentPage = this.pageCount
                },200)
            },
            //打包userINput需要触发的方法
            packagingMethod(value){
                this.ReviseCommentStatus(value)
                this.jumpLastpage()
            }
        },
        watch:{
            commentCount(newval){
                console.log('@',newval)
            }
        },
    }   
</script>

<style scoped>
    .messageBox{
        margin-top:20px;
        display: flex;
        width: 100%;
        min-height: 100px;
    }

    .imageExternal{
        width: 80px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .userImage{
        width: 3vw;
        min-width: 30px;
        max-width: 40px;
        height: 3vw;
        min-height: 30px;
        max-height: 40px;
        cursor: pointer;
    }

    .contentDisplay{
        display: flex;
        flex-direction: column;
        flex:0.98;
    }

    .userInfo{
        display: flex;
        margin-top:10px;
        margin-bottom:10px;
    }

    .userName{
        flex:1;
        color:#fa7298;
        font-size: 13px;
        font-family: -apple-system, BlinkMacSystemFont, Helvetica Neue, Helvetica, Arial, PingFang SC, Hiragino Sans GB, Microsoft YaHei, sans-serif;
        cursor: pointer;
    }

    .id{
        color:rgb(1, 1, 1,0.5);
        font-size:15px;
    }
    
    .userMessage{
        width:97%;
        color: var(--text1);
        overflow: hidden;
        word-break: break-word;
        line-height: 24px;
        font-size:16px;
    }

    .operatingArea{
        margin-top:8px;
        display:flex;
    }

    .timestamp{
        color:rgb(1, 1, 1,0.5);
        font-size:13px;
    }

    .reply{
        color:rgb(1, 1, 1,0.5);
        font-size:13px;
        margin-left:10px;
    }

    .replyButton{
        background: none;
        border: none;
        padding: 0;
        font: inherit;
        color: inherit;
        cursor: pointer; 
    }

    .replyButton:hover {
        color:deepskyblue;
    }

    .replyButton:active {
        color: #06c;
    }

    .commentArea{
        color:rgb(1, 1, 1,0.5);
        font-size:13px
    }

    .userInput{
        margin-top:5px;
        height: 65px;
    }

    .bottomLine{
        border-bottom: 1px solid rgb(1,1,1,0.1);
        margin-top: 10px;
    }

</style>