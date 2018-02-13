window.addEventListener('load', initialize);

function initialize(){
  window.log.addEventListener('click', openLogin);
  window.sign.addEventListener('click', openSignin);
}

function openLogin(){
  window.log.setAttribute("style","color:#00ABFF; background-color: white;")
  window.sign.setAttribute("style","color:white; background-color: #00ABFF;")

  window.logForm.setAttribute("style","display:grid;")
  window.signForm.setAttribute("style","display:none;")
}

function openSignin(){
  window.sign.setAttribute("style","color:#00ABFF; background-color: white;")
  window.log.setAttribute("style","color:white; background-color: #00ABFF;")

  window.logForm.setAttribute("style","display:none;")
  window.signForm.setAttribute("style","display:grid;")
}
