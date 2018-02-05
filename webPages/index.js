window.addEventListener('load', initialize);

function initialize(){
  loadFacts();
}

async function loadFacts(){
  try {

    //TELL THE USER WE'RE WAITING FOR THE FACTS THAT THEY WANT
    window.main.innerHTML='Gathering facts...';

    let url = '/api/facts';

    //TELL THE SERVER TO GET SOME FACTS
    const response = await fetch(url);
    if (!response.ok) throw response;

    //DO SOME STUFF WITH THE FACTS ONCE WE HAVE THEM FROM THE SERVER
    displayFacts(await response.json());


  }catch (e) {
      console.error('error getting facts', e);
      window.main.innerHTML = 'sorry, something went wrong getting facts...';
  }
}

function displayFacts(facts){

  window.main.innerHTML = facts;

  facts.forEach((fact) => {
    const marker = document.createElement('div');
    marker.classList.add('factMarker');
    marker.setAttribute("style", "left: " + fact.x + "px;");
    marker.setAttribute("style", "bottom: " + fact.y + "px;");
    window.main.appendChild(marker);

    const locationIcon = document.createElement("i");
    locationIcon.classList.add('material-icons');
    locationIcon.innerHTML = 'location_on';
    marker.appendChild(locationIcon);
    
    const info = document.createElement('div');
    info.classList.add('factText');
    info.textContent = fact.text;
    marker.appendChild(info);
  });
};
