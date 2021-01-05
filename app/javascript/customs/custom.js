document.addEventListener('DOMContentLoaded', function(){

  function HideAlert(){
      var x = document.getElementsByClassName('alert')[0];
      x.classList.add("hide");
  }

  setTimeout(HideAlert, 5000);

});