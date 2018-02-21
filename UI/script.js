    let p = document.getElementsByClassName('item1')[0]
    let x = document.getElementById("myDIV");
    let btn = document.getElementById('btn')
    let item = document.getElementById('here').addEventListener('click',() =>{
    let x = 1
    console.log(p)
      p.style.display = "none";
  })

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

/*Change between adding and removing the responsive class to the bottombar
when the user clicks the icon*/ 
   function myFunction2(){
     let x = document.getElementById("factbkBar");
     if (x.className === "bottombar"){
         x.className += "responsive";
     }else {
       x.className = "bottombar";
     }
   }
