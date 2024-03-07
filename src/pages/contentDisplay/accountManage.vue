<template>
  <div class="div">
      <div class="sign-div">
          <h2>修改密码</h2>
          <input class="input-text" type="password" v-model="password.p_new" placeholder="新密码">
          <input class="input-text" type="password" v-model="password.p_copy" placeholder="确认密码">
          <input class="input-btn" type="submit" value="确认修改" @click="changePassword(password)">
      </div>
  </div>
</template>

<script>
    import {mapActions} from 'vuex'
    export default {
        name: 'accountManage',
        data(){
            return{
                password:{
                    p_new :'',
                    p_copy:''
                }
            }
        },
        methods:{
            ...mapActions('processUserInfo',['changePassword'])
        }
    }
</script>

<style scoped>

  .div {
      width: 400px;
      height: 500px;
      /* 实现整个框居中效果 */
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      overflow: hidden;
  }

  .head-div {
      width: 100px;
      height: 100px;
      border: 1px solid #999;
      border-radius: 50%;
      margin: 0 auto 10px auto;
      background-size: 100px 100px;
  }

  .sign-div {
      width: 400px;
      height: 275px;
      text-align: center;
      outline: none;
      border: 1px solid rgb(94, 92, 233);
      border-radius: 8px;
      background-color: rgba(172, 235, 243, .2);
      box-sizing: border-box;
  }

  .sign-div h2 {
      margin-top:20px;
      margin-bottom: 10px;
      color: rgb(29, 26, 26);
  }

  input {
      width: 250px;
      height: 44px;
      border: none;
      /* 元素周围的轮廓无效 */
      outline: none;
      /* 为元素指定的任何内边距和边框都将在已设定的宽度和高度内进行绘制 */
      box-sizing: border-box;
      display: block;
      padding: 0 16px;
  }

  .input-text {
      margin: 5px auto;
      border-radius: 16px;
  }

  .input-text:hover {
      border: 0.5px solid rgb(76, 76, 233);
      transition: 0.5s;
      border-radius: 4px;
  }

  .input-btn {
      margin: 30px auto 20px;
      border-radius: 44px;
      cursor: pointer;
      background-color: rgba(84, 175, 249, 0.8);
  }

  .input-btn:hover {
      color: #fff;
      font-size: 16;
      border-radius: 4px;
      transition: 0.5s;
      background-color: rgba(10, 138, 243, 0.8);
  }

  .sign-div a {
      text-decoration: none;
      color: rgb(92, 61, 112);
      font-size: 14px;
      padding: 10px;
      transition: 0.8s;
      display: block;
  }

  a:hover {
      color: #FFF;
      background: rgba(0, 0, 0, .3);
      border-radius: 8px;
  }
</style>