
var modal = document.querySelector(".mm-modal");
var poster = document.querySelector(".poster");
var buttonQuit = document.querySelector(".button-quit");

var toggleModal = function() {
    modal.classList.toggle("active");
    console.log("bite");
}

var windowOnClick = function(event)  {
    if (event.target !== modal) {
        toggleModal();
    }
}

if (poster) {
  poster.addEventListener("click", toggleModal);
  buttonQuit.addEventListener("click", toggleModal);
  modal.addEventListener("click", toggleModal);
}
