window.addEventListener('DOMContentLoaded', () => {
    let tdEle = document.getElementsByTagName('td');
    // console.log(tdEle.length);
    for(let i = 0; i < tdEle.length; i++){
        if(tdEle[i].innerHTML == ''){
            tdEle[i].innerHTML = '&nbsp';
        }
    }
})
