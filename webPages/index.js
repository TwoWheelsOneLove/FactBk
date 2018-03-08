window.addEventListener('load', initialize);

function initialize(){

  const loggedInUser = null;

  document.querySelector('.submitFact').addEventListener('click',submitFact);
  window.LoginButton.addEventListener('click', login);
  window.SignupButton.addEventListener('click', signup);
  window.log.addEventListener('click', openLogin);
  window.sign.addEventListener('click', openSignin);
  window.showMap.addEventListener('click', goToMap);
  window.showAdmin.addEventListener('click', goToAdmin)
  window.logOutBtn.addEventListener('click', logOut);
}

//logIn system
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

async function login(){
  const email = document.getElementById('logEmail');
  const pass = document.getElementById('logPass');

  let url = '/api/login';
  url += '?email=' + encodeURIComponent(email.value);
  url += '&pass=' + encodeURIComponent(pass.value);

  //Check login against logins on server
  const response = await fetch(url);

  if (!response.ok) {
    console.log("Username or password incorrect");
    throw response;
  }else{
    goToMap();
    showNav();
    loadFacts(map);
  }
};

async function signup(){
  console.log('user signed up');
}


//UI FUNCTIONALITY

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

    if (response.ok) {
        factSubmitted();
    } else {
        console.error('error posting a story', response.status, response.statusText);
    }
  }

  function factSubmitted(){
    document.getElementById('factTitle').value='';
    document.getElementById('factText').value='';
    document.getElementById('factLat').value='';
    document.getElementById('factLong').value='';

    loadFacts(map);
  }

  function initMap() {
    let removePoi =[
    {
        featureType: "poi",
        elementType: "labels",
        stylers: [
              { visibility: "off" }
            ]
        }
    ];

    let directionsService = new google.maps.DirectionsService();
    let directionsDisplay = new google.maps.DirectionsRenderer();
    let portsmouth = new google.maps.LatLng(50.796162, -1.073248);
    window.map = new google.maps.Map(document.getElementById('mapholder'), {
      zoom: 16,
      center: portsmouth,
      styles: removePoi
    });
        directionsDisplay.setMap(map);
        directionsDisplay.setPanel(document.getElementById('panel'));
        infoWindow = new google.maps.InfoWindow;
        //document.getElementById("Direct").onclick = function () { calculateAndDisplayRoute(directionsService,directionsDisplay, new google.maps.LatLng(50.778047, -1.088848), new google.maps.LatLng(50.796984, -1.107903)); };

      //  calculateAndDisplayRoute(directionsService,directionsDisplay, new google.maps.LatLng(50.778047, -1.088848), new google.maps.LatLng(50.796984, -1.107903));

      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
          let pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          };

          let image = 'myLocation.png';
           let location = new google.maps.Marker({
             position: pos,
             map: map,
             icon: image
           });

          map.setCenter(pos);
        }, function() {
          handleLocationError(map, true, infoWindow, map.getCenter());
        });
      } else {
        // Browser doesn't support Geolocation
        handleLocationError(map, false, infoWindow, map.getCenter());
      }

  }

  function handleLocationError(map, browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
  infoWindow.open(map);
}

  function calculateAndDisplayRoute(directionsService, directionsDisplay, start, end) {
    directionsService.route({
      origin: start,
      destination: end,
      travelMode: 'DRIVING'
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
    let status = document.getElementById('status');
    status.setAttribute("style","display:block;")
    status.innerHTML='Gathering facts...';

    let url = '/api/facts';

    //TELL THE SERVER TO GET SOME FACTS
    const response = await fetch(url);
    if (!response.ok) throw response;

    //DO SOME STUFF WITH THE FACTS ONCE WE HAVE THEM FROM THE SERVER
    displayFacts(await response.json(),map);


  }catch (e) {
      console.error('error getting facts', e);
      window.status.innerHTML = 'sorry, something went wrong getting facts...';
  }
}

function displayFacts(facts,map){

  let factList = document.getElementById("listFacts");
  factList.innerHTML="";

  let status = document.getElementById('status');
  status.innerHTML='';
  status.setAttribute("style","display:none;");

  facts.forEach((fact) => {

    addToFactList(fact);

    let marker = new google.maps.Marker({
              map: map,
              position:{lat:fact.x,lng:fact.y}
            });


    let infoWindow = new google.maps.InfoWindow({
      content:'<img src=' + fact.imageSource + '>' +
              '<h1>'+ fact.title +'</h1> <p>' + fact.text + '</p>' +
              '<button><i class="material-icons">directions_walk</i></button></p>' +
              '<button><i class="material-icons">email</i></button>'
    });

    marker.addListener('click', function(){
      infoWindow.open(map,marker);
    });

  });
};

function requestDelete(e){
  if(e.target.dataset.id && window.confirm('Are you sure you want to delete this fact?')){
      console.log('request to delete fact' + dataset.id);
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
