<template>
</template>

<script setup>
    import {onBeforeUnmount} from 'vue'
    const socket = new WebSocket('ws://localhost:4047')
    socket.onopen = function() {    
        console.log('WebSocket 连接已打开!')
    }

    socket.onmessage = function(e) {
        console.log('收到消息:', e.data)
        socket.send('Hello Server!')
    }

    onBeforeUnmount(()=>{
        socket.onclose = function() {
            console.log('WebSocket 连接已关闭')
        }
    })
</script>
