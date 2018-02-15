window.addEventListener('load', initialize);

function initialize(){
  document.querySelector('.submitFact').addEventListener('click',submitFact)
}

//Add a new fact to the db
  async function submitFact(){
    const textEl = document.getElementById('factText');
    const factLatEl = document.getElementById('factLat');
    const factLongEl = document.getElementById('factLong');

    const submitButton = document.querySelector('.submitFact');
    submitButton.textContent = 'submitting';
    submitButton.disabled = true;

    let url ='/api/facts';
    url += '?text=' + encodeURIComponent(textEl.value);
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
    document.getElementById('factText').value='';
    document.getElementById('factLat').value='';
    document.getElementById('factLong').value='';

    loadFacts();
  }


//Google map API
  function initMap() {
    let portsmouth = {lat: 50.796, lng: -1.072974};

    let removePoi =[
    {
        featureType: "poi",
        elementType: "labels",
        stylers: [
              { visibility: "off" }
            ]
        }
    ];

    const map = new google.maps.Map(document.getElementById('mapholder'), {
      zoom: 16,
      center: portsmouth,
      styles: removePoi
    });

    loadFacts(map);
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
      content:'<p>' + fact.text + '</p><button><i class="material-icons">directions_walk</i></button></p><button><i class="material-icons">email</i></button>'
    });

    marker.addListener('click', function(){
      infoWindow.open(map,marker);
    });

  });
};
