import axios from 'axios';

export default (url, headers)=>{
    const data = {};
    const error ='';
    const isLoading = false;
    isLoading = true;
    axios
        .post(url, headers)
        .then(response => {
            data.value = response.data;
        })
        .catch(err => {
            error = err;
        })
        .finally(() => {
            isLoading = false;
        });

    return { data, error, isLoading};
}