const express = require('express')
const cors = require('cors');
const bodyParser = require('body-parser'); // 导入 body-parser
const db = require('./conf/db'); //引入数据库文件

const crypto = require('crypto'); //引入crypto模块,hash校验
const fs = require('fs'); //引入fs模块,文件操作

let app = express(); 
//处理跨域问题 
app.use(cors());
// 使用 body-parser 解析 JSON 格式的数据,请求体的大小为10mb
app.use(bodyParser.json({ limit: '10mb' })); 

// //头像文件夹,让前端可以访问
// app.use(express.static("./public/avatar"));

const WebSocket = require('ws')

const wss = new WebSocket.Server({ port: 4047 })

wss.on('connection', function(ws) {
    console.log('Client connected');
    
    // 定时器，每秒发送一条消息给客户端
    const timer = setInterval(() => {
        ws.send('This is a message from the server');
    }, 1000);

    ws.on('message', function(data) {
        console.log('Received data: %s', data);
    });

    ws.on('close', function() {
        console.log('Client disconnected');
        
        // 在客户端断开连接时清除定时器
        clearInterval(timer);
    });
});
console.log('WebSocket server started at port 4047')

//登录管理
app.post('/login',function(req,res){ 
    var loginInfo = req.body.data.loginInfo;
    var params = [loginInfo.account,loginInfo.password];
    db.query("SELECT account,userName,identity FROM user_password WHERE account = ? AND password = ? ",params, function (error,results,fields) {
        if(results.length == 0){
            res.send(false);
            return;
        }
        // 处理结果
        const userInfoHash = crypto.createHash('sha256');
        userInfoHash.update(JSON.stringify(results[0]));
        const result = userInfoHash.digest('hex');
        res.send({userInfo:results[0],userInfoHash:result});
    });
})

//监听1023端口 
app.listen(1023);