import { ref } from 'vue';
import { MD5 } from 'crypto-js';

export default ()=>{
    let randomUsername = ref('');
    const timestamp = Date.now().toString();
    const hashedTimestamp = MD5(timestamp).toString();
    const usernameLength = 8;
    const randomString = hashedTimestamp.slice(0, usernameLength);
    randomUsername.value = `user_${randomString}`;

    return randomUsername;
}
