<template>
    <div class="outer">
        <div v-for="int,index in player_num">
            <div>
                <div>
                    
                </div>
                <div>
                    <div>
                        {{ player_name[index] }}
                    </div>
                    <div>
                        {{ fraction[index] }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>

    import { useStore } from 'vuex'
    import { useMapState } from '/src/hooks/useMapState.js'

    const store = useStore()
    const {fraction,player_name,actioning,player_num} = useMapState('map', ['fraction','player_name','actioning','player_num']);

</script>

<style scoped>

</style>