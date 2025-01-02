// server.js
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const WebSocket = require('ws');
const db = require('./conf/db');
const { userStates,generateUniqueId } = require('./utils');
const wsHandler = require('./wsHandler');

const app = express();

// 中间件设置
app.use(cors());
app.use(bodyParser.json({ limit: '10mb' }));

// 路由
// app.post('/login', (req, res) => {
//     const loginInfo = req.body.data.loginInfo;
//     const params = [loginInfo.account, loginInfo.password];
//     db.query("SELECT account,userName,identity FROM user_password WHERE account = ? AND password = ?", params, (error, results) => {
//         if (results.length === 0) {
//             res.send(false);
//             return;
//         }
//         // 处理结果
//         const userInfoHash = crypto.createHash('sha256');
//         userInfoHash.update(JSON.stringify(results[0]));
//         const result = userInfoHash.digest('hex');
//         res.send({ userInfo: results[0], userInfoHash: result });
//     });
// });

// 启动 HTTP 服务器
const PORT = 1023;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});

// 启动 WebSocket 服务器
const wss = new WebSocket.Server({ port: 4047 });
wsHandler.setupWebSocketServer(wss);
