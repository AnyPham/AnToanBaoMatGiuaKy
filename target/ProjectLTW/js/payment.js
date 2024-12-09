const cancelbtn = document.querySelector('#cancel-form')
const closebtn = document.querySelector('#close')

cancelbtn.addEventListener("click",function(){
    document.querySelector('.cancel-form').style.display = "flex"
})

closebtn.addEventListener("click",function(){
    document.querySelector('.cancel-form').style.display = "none"
})