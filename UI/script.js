let main = document.getElementsByClassName('main')[0]
let accForm = document.getElementById("accountForm");
let nav = document.getElementById("navigation");
let fForm = document.getElementById("feedbackForm");
let factForm = document.getElementById("addFact");
let SignInlnk = document.getElementById("SignInlnk");
let snd = document.getElementById("send");
let submit = document.getElementById("submitFact");
let clsFForm = document.getElementById("closeFForm");
let clsFactForm = document.getElementById("closeFactForm");
let signInbtn = document.getElementById("signInbtn");
let logOutbtn = document.getElementById('logOutbtn');
let signUplnk = document.getElementById('signUplnk').addEventListener('click',() =>{
let accForm = 1
  main.style.display = "none";
})
  nav.style.display = "none";

function switchToAccForm() {
  if (accForm.style.display ==="block") {
      accForm.style.display = "none";
    }
  else {
      accForm.style.display = "block";
  }
}

SignInlnk.addEventListener('click',() =>{
if (main.style.display ==="block") {
    main.style.display = "none";
  }
else {
    main.style.display = "block";
    accForm.style.display = 'none'
}

})

signInbtn.addEventListener('click',() =>{
if (nav.style.display ==="block") {
    nav.style.display = "none";
  }
else {
    nav.style.display = "block";
    main.style.display = 'none'
}
})

logOutbtn.addEventListener('click',() =>{
if (main.style.display ==="block") {
    main.style.display = "none";
  }
else {
    main.style.display = "block";
    nav.style.display = 'none'
    fForm.style.display = "none"
    factForm.style.display = "none";
}

})


snd.addEventListener('click',() =>{
if (fForm.style.display ==="block") {
    fForm.style.display = "none";
  }
else {
    fForm.style.display = "none"
}

})


submit.addEventListener('click',() =>{
if (factForm.style.display ==="block") {
    factForm.style.display = "none";
  }
else {
    factForm.style.display = "none"
}

})



clsFForm.addEventListener('click',() =>{
if (fForm.style.display ==="block") {
    fForm.style.display = "none";
  }
else {
    fForm.style.display = "none"
}

})


clsFactForm.addEventListener('click',() =>{
if (factForm.style.display ==="block") {
    factForm.style.display = "none";
  }
else {
    factForm.style.display = "none"
}

})


function displayFdBckForm() {
let accForm = document.getElementById("feedbackForm");
if (accForm.style.display ==="block") {
    accForm.style.display = "none";
  }
else {
    accForm.style.display = "block";
    factForm.style.display = "none";

}
}


function displayAddFctForm() {
let factForm = document.getElementById("addFact");
if (factForm.style.display ==="block") {
    factForm.style.display = "none";
  }
else {
    factForm.style.display = "block";
    fForm.style.display="none";
}
}
