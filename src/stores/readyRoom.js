import { ref,reactive,onBeforeUnmount,onMounted } from 'vue';
import { defineStore } from 'pinia';

export default defineStore('counter',() => {
    let room_num = ref(15)
    const player_id = ref(0)

    // const socket = new WebSocket('ws://localhost:4047')

    socket.onopen = function() {    
        console.log('WebSocket 连接已打开!')
    }

    socket.onmessage = function(e) {
        console.log('收到消息:', e.data)
        room_num.value++
        console.log(room_num)
        socket.send('Hello Server!')
    }

    onBeforeUnmount(()=>{
        socket.onclose = function() {
            console.log('WebSocket 连接已关闭')
        }
    })
    return { room_num,player_id }
});