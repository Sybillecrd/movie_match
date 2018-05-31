
var modal = document.querySelector(".mm-modal");
var poster = document.querySelector(".poster");
var buttonQuit = document.querySelector(".button-quit");
var showtimeModal = document.querySelector(".showtime-modal");

var toggleModal = function() {
    modal.classList.toggle("active");
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

var toggleModal = function() {
    showtimeModal.classList.toggle("active");
}

var windowOnClick = function(event)  {
    if (event.target !== showtimeModal) {
        toggleModal();
    }
}
