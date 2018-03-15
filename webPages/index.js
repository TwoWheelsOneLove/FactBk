window.addEventListener('load', initialize);

function initialize(){

  const loggedInUser = null;

  document.querySelector('.submitFact').addEventListener('click',submitFact);
  window.LoginButton.addEventListener('click', login);
  window.showMap.addEventListener('click', goToMap);
  window.showAdmin.addEventListener('click', goToAdmin)
  window.logOutBtn.addEventListener('click', logOut);
  window.showInfo.addEventListener('click',goToInfo);

  let SignInlnk = document.getElementById("signUplnk");
  let signlnk = document.getElementById("SignInlnk");

  SignInlnk.addEventListener("click", switchToAccForm);
  signlnk.addEventListener("click", switchToSignInForm);
}




//logIn system
function switchToAccForm() {
  console.log("switching");
  let accForm = document.getElementById("accountForm");
  let signInForm = document.getElementById("logIn");

  if (accForm.style.display === "block") {
      accForm.style.display = "none";
      signInForm.style.display = "block";
    }

  else {
      accForm.style.display = "block";
      signInForm.style.display = "none";
  }
}

function switchToSignInForm() {
  let accForm = document.getElementById("accountForm");
  let signInForm = document.getElementById("logIn");

  if (signInForm.style.display === "block") {
      signInForm.style.display = "none";
      accForm.style.display = "block";
    }
  else {
      signInForm.style.display = "block";
      accForm.style.display = "none";
  }
}


async function login(){
  const email = document.getElementById('logEmail');
  const pass = document.getElementById('logPass');

  let url = '/api/login';
  url += '?email=' + encodeURIComponent(email.value);
  url += '&pass=' + encodeURIComponent(pass.value);

  //Check login against logins on server
  const response = await fetch(url);



  if (!response.ok) {
    setStatus("The Username or Password is incorrect");
    throw response;
  }else{
    clearStatus();
    goToMap();
    showNav();
    loadFacts(map);
  }
};

async function signup(){
  console.log('user signed up');
}


//UI FUNCTIONALITY
function clearStatus(){
  let status = document.getElementById('status');
  status.textContent="";
  status.setAttribute("style","opacity: 0; top:-10vh;");
}

function setStatus(text){
  let status = document.getElementById('status');
  status.textContent=text;
  status.setAttribute("style","opacity: 1; top:0;");

  window.setTimeout(clearStatus, 5000);
}

function showNav(){
  window.nav.setAttribute("style","display: grid;");
}

function goToMap(){
  window.main.setAttribute("style","top: -100vh;");
  loadFacts(map);
}

function logOut(){
  window.nav.setAttribute("style","display: none;");
  window.main.setAttribute("style","top: 0vh;");
}

function goToAdmin(){
    window.main.setAttribute("style","top: -200vh;");
    loadFacts(map);
}

function goToInfo(){
  window.main.setAttribute("style", "top: -300vh;")
}

//Add a new fact to the db
  async function submitFact(){
    const titleEl = document.getElementById('factTitle');
    const textEl = document.getElementById('factText');
    const factLatEl = document.getElementById('factLat');
    const factLongEl = document.getElementById('factLong');

    const submitButton = document.querySelector('.submitFact');
    submitButton.innerHTML = 'submitting';
    submitButton.disabled = true;

    let url ='/api/facts';
    url += '?title=' + encodeURIComponent(titleEl.value);
    url += '&text=' + encodeURIComponent(textEl.value);
    url += '&lat=' + encodeURIComponent(factLatEl.value);
    url += '&long=' + encodeURIComponent(factLongEl.value);

    const response = await fetch(url, {method:'post'});

    submitButton.disabled = false;
    submitButton.innerHTML = '<i class="material-icons md-48">add_location</i>';

    if (!response.ok) {
        console.error('error submitting fact', response.status, response.statusText);
    }else{
      factSubmitted();
    }
  }

  function factSubmitted(){
    loadFacts(map);
    document.getElementById('factTitle').value='';
    document.getElementById('factText').value='';
    document.getElementById('factLat').value='';
    document.getElementById('factLong').value='';
  }

  function initMap() { // Sets up Google Map
    let removePoi =[ // Removes points of interest (e.g. restaurants, gyms etc.)
    {
        featureType: "poi",
        elementType: "labels",
        stylers: [
              { visibility: "off" }
            ]
        }
    ];
    // initializes direction objects
    window.directionsService = new google.maps.DirectionsService();
    window.directionsDisplay = new google.maps.DirectionsRenderer();
    window.portsmouth = new google.maps.LatLng(50.796162, -1.073248);
    window.map = new google.maps.Map(document.getElementById('mapholder'), { // assaigns Google map to "mapholder" div
      zoom: 16,
      center: portsmouth,
      styles: removePoi
    });
        // Point direction objects to thier corresponding div panels
        directionsDisplay.setMap(map);
        directionsDisplay.setPanel(document.getElementById('panel'));

        // Initalise Information window for geolocation feature
        infoWindow = new google.maps.InfoWindow;

      // If the system is able to fetch the user's current location
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
          let pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          };

          // Display an icon at the user's location
          // This icon allows users to identify thier current location on the map
          let image = 'myLocation.png';
           let location = new google.maps.Marker({
             position: pos,
             map: map,
             icon: image
           });

          // Centre the map on thier location
          map.setCenter(pos);
        }, function() {
          handleLocationError(map, true, infoWindow, map.getCenter());
        });
      } else {
        // Browser doesn't support Geolocation
        handleLocationError(map, false, infoWindow, map.getCenter());
      }

  }
  // Error handling if browser cannot fetch user location
  function handleLocationError(map, browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
  infoWindow.open(map);
}

  // Directions
  function calculateAndDisplayRoute(fact) {
    // Fetch the location of the fact
    let factLat = fact.dataset.lat;
    let factLong = fact.dataset.long;

    let uni = new google.maps.LatLng(50.798474, -1.098504);
    let dest = new google.maps.LatLng(factLat, factLong);
    directionsService.route({
      origin: uni, // Need to replace with user location
      destination: dest, // Set fact location as route destination
      travelMode: 'WALKING' // Assume user will be walking due to Portsmouth's density
    }, function(response, status) {
      if (status === 'OK') {
        directionsDisplay.setDirections(response);
      } else {
        window.alert('Directions request failed due to ' + status);
      }
    });
  }

async function loadFacts(map){
  try {

    //TELL THE USER WE'RE WAITING FOR THE FACTS THAT THEY WANT
    setStatus('Gathering Facts...');

    let url = '/api/facts';

    //TELL THE SERVER TO GET SOME FACTS
    const response = await fetch(url);
    if (!response.ok) throw response;

    //DO SOME STUFF WITH THE FACTS ONCE WE HAVE THEM FROM THE SERVER
    displayFacts(await response.json(),map);


  }catch (e) {
      console.error('error getting facts', e);
      setStatus("Sorry, Something went wrong getting facts");
  }
}

function displayFacts(facts,map){

  let factList = document.getElementById("listFacts");
  factList.innerHTML="";

  clearStatus();

  facts.forEach((fact) => {

    addToFactList(fact);
    let markerIcon = '/images/marker.png';
    let marker = new google.maps.Marker({
              map: map,
              icon:markerIcon,
              position:{lat:fact.x,lng:fact.y}
            });

    // Window displayed when fact marker is clicked
    let infoWindow = new google.maps.InfoWindow({
      content:'<img src=' + fact.imageSource + '>' + // display fact image
              '<h1>'+ fact.title +'</h1> <p>' + fact.text + '</p>' +
              '<button data-lat='+fact.x+' data-long='+fact.y+' onclick="calculateAndDisplayRoute(this)"><i class="material-icons">directions_walk</i></button></p>' + // directions to fact
              '<button data-text='+ fact.text.split(' ').join('&#37;20') +' onclick="sendEmail(this)"><i class="material-icons">email</i></button>' // share fact
    });

    // fact information window opended when its marker is cliked
    marker.addListener('click', function(){
      infoWindow.open(map,marker);
    });

  });
};

// Shares a fact via email
function sendEmail(target){
  let text = target.dataset.text; // fetches fact text
  let emailLink = "https://mail.google.com/mail/u/0/?view=cm&fs=1&su=Check%20Out%20This%20Fact%20From%20FactBk&body=" + text; // mailto link
  window.open(emailLink); // Opens pre-written email
}
async function requestDelete(e){
  if(e.target.dataset.id && window.confirm('Are you sure you want to delete this fact?')){
    await fetch('/api/facts/' + e.target.dataset.id, {method:'DELETE'});
    loadFacts(map);
    }
}

function addToFactList(fact){
  const factList = document.getElementById("listFacts");
  const newFact = document.createElement('section');
      newFact.classList.add('fact');
      factList.appendChild(newFact);

  const title = document.createElement('p');
    title.textContent = fact.title;
    newFact.appendChild(title);

  let el = document.createElement('i');
    el.classList.add('material-icons');
    el.classList.add('deleteFact');
    el.textContent='delete';
    el.dataset.id = fact.id;
    el.onclick = requestDelete;
    newFact.appendChild(el);
};
