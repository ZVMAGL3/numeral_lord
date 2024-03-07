import { customRef } from 'vue';
export default function(value,time=500){
    let timer
    return customRef((track,trigger)=>{
        return {
            get(){
                track()
                return value
            },

            set(newValue){
                clearTimeout(timer)
                timer = setTimeout(() => {
                    value = newValue
                    trigger()
                }, time);
            }
        }
    })
}   