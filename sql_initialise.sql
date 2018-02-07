create database if not exists factBk;

create TABLE if not exists factBk.user(
  id int PRIMARY KEY auto_increment,
  email varchar(50) NOT NULL,
  password varchar(50) NOT NULL
);

create TABLE if not exists factBk.location(
  id int PRIMARY KEY auto_increment,
  locX FLOAT(5,2) NOT NULL,
  locY FLOAT(5,2) NOT NULL
);

create TABLE if not exists factBk.fact(
  id int PRIMARY KEY auto_increment,
  text varchar(500) NOT NULL,
  locationID INT(10) NOT NULL,
  CONSTRAINT fkLocation FOREIGN KEY (locationID) REFERENCES location(id)
);


/* USER INSERTS*/
insert ignore into factBk.user values (1, "dan lincoln", "testPassword");

/* LOCATION INSERTS */
insert ignore into factBk.location values (1, 50.802164, -1.108874);
insert ignore into factBk.location values (2, 50.800484, -1.109455);
insert ignore into factBk.location values (3, 50.800840, -1.110010);
insert ignore into factBk.location values (4, 50.801741, -1.110687);
insert ignore into factBk.location values (5, 50.798218, -1.109280);
insert ignore into factBk.location values (6, 50.798937, -1.094129);
insert ignore into factBk.location values (7, 50.800284, -1.094795);
insert ignore into factBk.location values (8, 50.797571, -1.092923);
insert ignore into factBk.location values (9, 50.796490, -1.093246);
insert ignore into factBk.location values (10, 50.788978, -1.104003);
insert ignore into factBk.location values (11, 50.779638, -1.089424);
insert ignore into factBk.location values (12, 50.777992, -1.088841);
insert ignore into factBk.location values (13, 50.800523, -1.109459);

/* FACT INSERTS */
insert ignore into factBk.fact values (1,"The Mary Rose Museum is a historical museum located at Historic Dockyards in Portsmouth in the United Kingdom run by the Mary Rose Trust. The museum is dedicated to the 16th century Tudor navy warship Mary Rose as well as the historical context in which she was active. The museum opened in 1984 and displays artefacts from the ship as well as the ship itself in a dedicated ship hall, while it has been undergoing conservation. In September 2009 the ship hall was closed to allow the start of construction of a new museum that was opened at the end of May 2013.", 1);
insert ignore into factBk.fact values (2,"Her Majesty's Naval Base, Portsmouth (HMNB Portsmouth) is one of three operating bases in the United Kingdom for the British Royal Navy. Portsmouth Naval Base is part of the city of Portsmouth; it is located on the eastern shore of Portsmouth Harbour, north of the Solent and the Isle of Wight. Until the early 1970s it was officially known as Portsmouth Royal Dockyard (or HM Dockyard, Portsmouth). The shipbuilding, repair and maintenance element of the base was privatized in the late-1990s/early-2000s. The base is home to one of the oldest dry docks in the world, as well as being the headquarters for two-thirds of the Royal Navy's surface fleet.", 2);
insert ignore into factBk.fact values (3,"The National Museum of the Royal Navy, Portsmouth, formerly known as the Royal Naval Museum, is a museum of the history of the Royal Navy located in the Portsmouth Historic Dockyard section of HMNB Portsmouth, Portsmouth, Hampshire, England. The museum is part of the National Museum of the Royal Navy, a non-departmental public body sponsored by the Ministry of Defence. The museum was founded in 1911. Known originally as the "Dockyard Museum", it was conceived by Mr Mark Edwin Pescott-Frost, then secretary to the Admiral Superintendent at Portsmouth. With a passion for naval history he spearheaded a project to save items for future generations, eventually leading to the opening of a new museum. His foresight ensured the survival of many interesting and important artefacts, several of which are still on display today. He was awarded the Imperial Service Order in 1916.", 3);
insert ignore into factBk.fact values (4,"HMS M33 is an M29-class monitor of the Royal Navy built in 1915. She saw active service in the Mediterranean during the First World War and in Russia during the Allied Intervention in 1919. She was used subsequently as a mine-laying training ship, fuelling hulk, boom defence workshop and floating office, being renamed HMS Minerva and Hulk C23 during her long life. She passed to Hampshire County Council in the 1980s and was then handed over to the National Museum of the Royal Navy in 2014. A programme of conservation was undertaken to enable her to be opened to the public. HMS M.33 is located within Portsmouth Historic Dockyard and opened to visitors on 7 August 2015 following a service of dedication. She is one of only three surviving Royal Navy warships of the First World War and the only surviving ship from the Gallipoli Campaign. M33 was built as part of the rapid ship construction campaign following the outbreak of the First World War by Harland and Wolff, Belfast. Ordered in March 1915, she was launched in May and commissioned in June; an impressive shipbuilding feat especially considering that numerous other ships of her type were being built in the same period.", 4);
insert ignore into factBk.fact values (5,"HMS Warrior is a 40-gun steam-powered armoured frigate[Note 1] built for the Royal Navy in 1859–61. She was the name ship of the Warrior-class ironclads. Warrior and her sister ship HMS Black Prince were the first armour-plated, iron-hulled warships, and were built in response to France's launching in 1859 of the first ocean-going ironclad warship, the wooden-hulled Gloire. Warrior conducted a publicity tour of Great Britain in 1863 and spent her active career with the Channel Squadron. Obsolescent following the 1871 launching of the mastless and more capable HMS Devastation, she was placed in reserve in 1875, and was "paid off" – decommissioned – in 1883. She subsequently served as a storeship and depot ship, and in 1904 was assigned to the Royal Navy's torpedo training school.", 5);
insert ignore into factBk.fact values (6,"Officially opened on 25 May 1878 and was the first public park to be opened in Portsmouth. It was designed by Alexander McKenzie. It has a total area of around 15 acres (61,000 m2) and is planted with trees, shrubs and flowers. The centre of the park features an enclosed area which inhabits animals such as birds, rabbits and guinea pigs. The park is also home to a number of monuments. These mostly consist of obelisks but there is also one in the style of a Chinese temple.", 6);
insert ignore into factBk.fact values (7,"The Cathedral Church of St John the Evangelist is a Roman Catholic cathedral in Portsmouth, England. It was opened in 1882 and is the first cathedral to have been built in Portsmouth.", 7);
insert ignore into factBk.fact values (8,"Constructed in 1890 and originally used by the local council, the building was known as Portsmouth Town Hall until 1926. It was heavily damaged by bombing during the Second World War and largely rebuilt during the 1950s. Today it operates as a concert, wedding and conference venue.", 8);
insert ignore into factBk.fact values (9,"The New Theatre Royal is a Victorian Grade II* listed theatre in the heart of Portsmouth, England, with a capacity of 667. The theatre building was constructed in 1854 as Landport Hall. It was converted to a theatre two years later.", 9);
insert ignore into factBk.fact values (10,"Used as an almshouse & hospice was firebombed in WWII. Domus Dei was an almshouse and hospice established in around 1212 A.D. at Old Portsmouth, Hampshire, UK by Peter des Roches, Bishop of Winchester.", 10);
insert ignore into factBk.fact values (11,"The D-Day Museum is located in Southsea, Portsmouth in Hampshire, England. Opened in 1984 by Queen Elizabeth The Queen Mother, it tells the story of Operation Overlord during the Normandy D-Day landings.", 11);
insert ignore into factBk.fact values (12,"Southsea Castle, historically also known as Chaderton Castle, South Castle and Portsea Castle, is an artillery fort originally constructed by Henry VIII on Portsea Island, Hampshire. Built in 1544, the Castle was part of a series of fortifications constructed by Henry VIII around England's coasts to protect the country from invaders. Barely was the work completed when Henry VIII's flagship, the Mary Rose, tragically sank in front of the Castle. During the English Civil War, nearly a century later, the Castle was captured for the only time in its history, by Parliamentarian forces.", 12);
insert ignore into factBk.fact values (13,"HMS Victory is a 104-gun first-rate ship of the line of the Royal Navy, ordered in 1758, laid down in 1759 and launched in 1765. She is best known for her role as Lord Nelson's flagship at the Battle of Trafalgar on 21 October 1805.", 13);

