// -----------------timtinhthanhpho------------------
const timTinh = document.querySelectorAll('.js-tim-tinh');
const modal = document.querySelector('.js-modal-tinh-thanh');
const close = document.querySelectorAll('.js-close');
const modalContainer = document.querySelector('.js-modal-container');

function showTinhThanh() {
  modal.classList.add('open');
}

function hideTinhThanh() {
  modal.classList.remove('open');
}

for (const timTinhElement of timTinh) {
  timTinhElement.addEventListener('click', showTinhThanh);

}
for (const closeElement of close) {
  closeElement.addEventListener('click', hideTinhThanh);

}

modal.addEventListener('click', hideTinhThanh);
modalContainer.addEventListener('click', function (event) {
  event.stopPropagation();
});


//--------------product------------
const ttsp = document.querySelector('.ttsp')
const tskt = document.querySelector('.tskt')
if(ttsp) {
  ttsp.addEventListener("click", function () {
    document.querySelector(".product-content-thongsokythuat").style.display = "none"
    document.querySelector(".product-content-thongtinsanpham").style.display = "block"

  })
  if (tskt) {
    tskt.addEventListener("click", function () {
      document.querySelector('.product-content-thongsokythuat').style.display = "block"
      document.querySelector('.product-content-thongtinsanpham').style.display = "none"

    })
  }
}

// ------------------picture in product---------------
const bigImg = document.querySelector(".product-content-left-big-img img")
const smallImg = document.querySelectorAll(".product-content-left-small-img img")
smallImg.forEach(function (imgItem, X){
  imgItem.addEventListener("click", function (){
    bigImg.src = imgItem.src
  })
})

//------------------------- vietdanhgia------------------------
const danhgiabtn = document.querySelector('.vietdanhgia')
const  dongbtn = document.querySelector('.form-danhgia-close')
danhgiabtn.addEventListener('click', function (){
  document.querySelector('.form-danhgia').style.display = "flex"
})
dongbtn.addEventListener('click', function (){
  document.querySelector('.form-danhgia').style.display = "none"
})

// -----------------------------lichsumuahang--------------------------------

const dhdm = document.querySelector('.lichsumuahang-damua-donhangdamua')
const ttvsdc = document.querySelector('.lichsumuahang-damua-thongtinvadiachi')
if(dhdm) {
  dhdm.addEventListener("click", function () {
    document.querySelector(".lichsumuahang-content-second").style.display = "none"
    document.querySelector(".lichsumuahang-content-first").style.display = "block"

  })
  if (ttvsdc) {
    ttvsdc.addEventListener("click", function () {
      document.querySelector('.lichsumuahang-content-second').style.display = "block"
      document.querySelector('.lichsumuahang-content-first').style.display = "none"

    })
  }
}



