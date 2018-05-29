var radioButtons = document.querySelectorAll("[type='radio'][name='filter[moment]']");

radioButtons.forEach(function(radioButton) {
  radioButton.addEventListener("click", function() {
    setTimeout(function() {
      window.scroll({
        top: window.innerHeight - 70,
        left: 0,
        behavior: 'smooth'
      });
    }, 100);
  });
});
