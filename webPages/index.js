window.addEventListener('load', initialize);

function initialize(){
  document.querySelector('.submitFact').addEventListener('click',submitFact)
}

//Add a new fact to the db
  async function submitFact(){
    const titleEl = document.getElementById('factTitle');
    const textEl = document.getElementById('factText');
    const factLatEl = document.getElementById('factLat');
    const factLongEl = document.getElementById('factLong');

    const submitButton = document.querySelector('.submitFact');
    submitButton.textContent = 'submitting';
    submitButton.disabled = true;

    let url ='/api/facts';
    url += '?title=' + encodeURIComponent(titleEl.value);
    url += '&text=' + encodeURIComponent(textEl.value);
    url += '&lat=' + encodeURIComponent(factLatEl.value);
    url += '&long=' + encodeURIComponent(factLongEl.value);

    const response = await fetch(url, {method:'post'});

    submitButton.disabled = false;
    submitButton.textContent = 'submit';

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

    loadFacts();
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
    const map = new google.maps.Map(document.getElementById('mapholder'), {
      zoom: 16,
      center: portsmouth,
      styles: removePoi
    });
        directionsDisplay.setMap(map);
        directionsDisplay.setPanel(document.getElementById('panel'));
        infoWindow = new google.maps.InfoWindow;
        //document.getElementById("Direct").onclick = function () { calculateAndDisplayRoute(directionsService,directionsDisplay, new google.maps.LatLng(50.778047, -1.088848), new google.maps.LatLng(50.796984, -1.107903)); };
        loadFacts(map);
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
    window.main.setAttribute("style","display:block;")
    window.main.innerHTML='Gathering facts...';

    let url = '/api/facts';

    //TELL THE SERVER TO GET SOME FACTS
    const response = await fetch(url);
    if (!response.ok) throw response;

    //DO SOME STUFF WITH THE FACTS ONCE WE HAVE THEM FROM THE SERVER
    displayFacts(await response.json(),map);


  }catch (e) {
      console.error('error getting facts', e);
      window.main.innerHTML = 'sorry, something went wrong getting facts...';
  }
}

function displayFacts(facts,map){
window.main.innerHTML='';
window.main.setAttribute("style","display:none;")

  facts.forEach((fact) => {
    let marker = new google.maps.Marker({
              map: map,
              position:{lat:fact.x,lng:fact.y}
            });

    let infoWindow = new google.maps.InfoWindow({
      content:'<img src=' + fact.imageSource + '> <h1>'+ fact.title +'</h1> <p>' + fact.text + '</p><button><i class="material-icons">directions_walk</i></button></p><button><i class="material-icons"> onclick="window.open("https://mail.google.com/mail/?view=cm&fs=1&su=Check%20Out%20This%20Fact%20From%20FactBK&body="+fact.txt);">email</i></button>'
    });

    marker.addListener('click', function(){
      infoWindow.open(map,marker);
    });

  });
};
