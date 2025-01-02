// wsHandler.js
const { userStates,deleteUserId } = require('./utils');
const { login } = require('./method/login');
const { pipei } = require('./method/pipei');

function setupWebSocketServer(wss) {
    wss.on('connection', (ws) => {

        console.log('Client connected');

        let userId = null;

        // 定时器，每分钟发送一条消息给客户端
        const timer = setInterval(() => {
            try {
                ws.send(JSON.stringify({ code: 'zaixian' }));
            } catch (error) {
                console.error('Error sending message:', error);
                clearInterval(timer);
                deleteUserId(userId);
                ws.terminate(); // 关闭连接
            }
        }, 60000);

        ws.on('message', (message) => {
            try {
                const { type,data } = JSON.parse(message);
                switch(type){
                    case 'login':
                        // 删除旧的临时ID
                        if(userId)deleteUserId(userId);
                        // 更新 userId 为用户发送的 ID
                        userId = login(data);
                        // 重新绑定用户ID和WebSocket连接
                        userStates.set(userId, {ws,state:1});
                        console.log(`User ID updated to ${userId}`);
                        break;
                    case 'pipei':
                        pipei(userId,data)
                    case 'zaixian':
                        break;
                    case 'fangjian':
                        break;
                    case 'xingdong':
                        break;
                }
            } catch (error) {
                console.error('Failed to parse message:', error);
            }
        });

        ws.on('close', () => {
            console.log('Client disconnected');
            clearInterval(timer);
            deleteUserId(userId); // 移除用户
        });
    });

    console.log('WebSocket server started at port 4047');
}

module.exports = { setupWebSocketServer };
