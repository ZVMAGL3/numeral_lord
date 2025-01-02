const userStates = new Map(); //在线用户的id
const pipeiStates = new Map(); //匹配状态的用户id
const roomStates = new Map(); //存储房间信息
const deleteUserId = (userId) => { //离线处理
    userStates.delete(userId)
    // pipeiStates.delete(userId) //离线强制退出匹配状态 //改为调用删除匹配状态的事件
}
const addRoom  = (users)=> {
    
}

module.exports = { userStates,deleteUserId,pipeiStates };
