<template>
    <li class="commentBox">
        
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
            <div class="spacer"></div>
            <div class="userInfo">
                <div class="userName" @click="jumpHomePage(account)">
                    <span>{{ userName }}</span>
                </div>
                <span  class="content" v-if="replyTo">回复<span class="jumpLink" @click="jumpHomePage(account)">@{{ replierName }}</span>:</span>
                <span class="content">{{ content }}</span>
            </div>

            <div class="operatingArea">
                <div class="timestamp">
                    <span>{{ timestamp(time) }}</span>
                </div>

                <div class="reply">
                    <button class="replyButton" @click="replyStatus(true,userName,account)">回复</button >
                </div>
            </div>

        </div>

        <!-- <div style="flex:1;"></div> -->


    </li>
</template>

<script>
    import avatarContainer from '/src/components/avatarContainer'
    export default {
        name:'userComment',
        components:{avatarContainer},
        props:['id','content','time','userName','account','replyTo','replierName','replyStatus','timestamp','jumpHomePage'],
        // computed:{
        //     replyContent(){
        //         if(this.replyTo){
        //             return `回复@${this.replierName}:${this.content}`
        //         }else{
        //             return this.content
        //         }
        //     }
        // }
    }
</script>

<style scoped>

    .commentBox{
        display: flex;
    }

    .imageExternal{
        width: 45px;
        display: flex;
        flex-direction: column;
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
        margin-top:10px;
        margin-bottom:10px;
    }

    .userName{
        color:#fa7298;
        font-size: 13px;
        line-height: 24px;
        display: inline-flex;
        margin-top:0px;
        margin-right: 15px;
        cursor: pointer;
    }

    .content{
        font-size: 16px;
        line-height: 24px;
        word-break: break-word;
        color: black;
    }
    
    .jumpLink{
        cursor: pointer;
        color:#008ac5;
    }
    
    .jumpLink:hover{
        transition: color .3s;
        color:#3fc3ef;
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

</style>