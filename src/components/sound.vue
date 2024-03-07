<template>
    <audio ref="chessMoveSound" preload="auto"></audio>
</template>

<script setup>

    import { ref,watch,nextTick } from 'vue';
    import { useMapState } from '/src/hooks/useMapState.js'


    const srcAll = ref(['UI_Click','UI_Switch','UI_Placed','UI_Fight','UI_Ocean'])

    const { trigger,pictureIndex} = useMapState('soundEffects', ['trigger','pictureIndex']);

    // 创建音频元素的引用
    const chessMoveSound = ref(null);

    // 播放音效的函数
    const playChessMoveSound = () => {
        if (chessMoveSound.value) {
            // 创建新的Audio对象并加载音效
            const audio = new Audio(`numberGame/AudioClip/${srcAll.value[pictureIndex.value]}.wav`);
            audio.load();
            // 播放音效
            audio.play();
        }
    };

    watch(trigger,() => {
        // chessMoveSound.value.pause();

        nextTick(() => {
            playChessMoveSound()
        })
    });

</script>