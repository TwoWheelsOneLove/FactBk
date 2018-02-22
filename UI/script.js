let p = document.getElementsByClassName('item1')[0]
let x = document.getElementById("myDIV");
let y = document.getElementById("nav");
let z = document.getElementById("myDIV2");
let btn = document.getElementById("btn");
let snd = document.getElementById("send");
let cls = document.getElementById("close");
let btn2 = document.getElementById("btn2");
let btn3 = document.getElementById('btn3');
let item = document.getElementById('here').addEventListener('click',() =>{
let x = 1
  p.style.display = "none";
})
  y.style.display = "none";

function myFunction() {
  if (x.style.display ==="block") {
      x.style.display = "none";
    }
  else {
      x.style.display = "block";
  }
}

btn.addEventListener('click',() =>{
if (p.style.display ==="block") {
    p.style.display = "none";
  }
else {
    p.style.display = "block";
    x.style.display = 'none'
}

})

btn2.addEventListener('click',() =>{
if (y.style.display ==="block") {
    y.style.display = "none";
  }
else {
    y.style.display = "block";
    p.style.display = 'none'
}
})

btn3.addEventListener('click',() =>{
if (p.style.display ==="block") {
    p.style.display = "none";
  }
else {
    p.style.display = "block";
    y.style.display = 'none'
    z.style.display = "none"
}

})


snd.addEventListener('click',() =>{
if (z.style.display ==="block") {
    z.style.display = "none";
  }
else {
    z.style.display = "none"
}

})


cls.addEventListener('click',() =>{
if (z.style.display ==="block") {
    z.style.display = "none";
  }
else {
    z.style.display = "none"
}

})


function myFunction2() {
let x = document.getElementById("myDIV2");
if (x.style.display ==="block") {
    x.style.display = "none";
  }
else {
    x.style.display = "block";
}
}
