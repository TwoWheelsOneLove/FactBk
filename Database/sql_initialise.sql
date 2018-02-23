create database if not exists factBk;

create TABLE if not exists factBk.user(
  id int PRIMARY KEY auto_increment,
  email varchar(50) NOT NULL,
  password varchar(50) NOT NULL
);

create TABLE if not exists factBk.fact(
  id int PRIMARY KEY auto_increment,
  factTitle varchar(50) NOT NULL,
  text varchar(500) NOT NULL,
  locX FLOAT(20) NOT NULL,
  locY FLOAT(20) NOT NULL,
  imgSrc varchar(100) NOT NULL
);


/* USER INSERTS*/
insert ignore into factBk.user values (1, "dan lincoln", "testPassword");
insert ignore into factBk.user values (2, "surajit ghosh", "testPassword2");
insert ignore into factBk.user values (3, "nasser", "testPassword3");
insert ignore into factBk.user values (4, "igor", "testPassword4");
insert ignore into factBk.user values (5, "isa", "testPassword5");

/* FACT INSERTS */
insert ignore into factBk.fact values (1,"The Mary Rose","The Mary Rose Museum is a historical museum located at Historic Dockyards in Portsmouth in the United Kingdom run by the Mary Rose Trust. The museum is dedicated to the 16th century Tudor navy warship Mary Rose as well as the historical context in which she was active. The museum opened in 1984 and displays artefacts from the ship as well as the ship itself in a dedicated ship hall, while it has been undergoing conservation. In September 2009 the ship hall was closed to allow the start of construction of a new museum that was opened at the end of May 2013.", 50.802164, -1.108874, "<img src=""../images/Hilsea Barracks.jpg"">");

insert ignore into factBk.fact values (2,"Portsmouth Historic Dockyard","Her Majesty's Naval Base, Portsmouth (HMNB Portsmouth) is one of three operating bases in the United Kingdom for the British Royal Navy. Portsmouth Naval Base is part of the city of Portsmouth; it is located on the eastern shore of Portsmouth Harbour, north of the Solent and the Isle of Wight. Until the early 1970s it was officially known as Portsmouth Royal Dockyard (or HM Dockyard, Portsmouth). The shipbuilding, repair and maintenance element of the base was privatized in the late-1990s/early-2000s. The base is home to one of the oldest dry docks in the world, as well as being the headquarters for two-thirds of the Royal Navy's surface fleet.", 50.800484, -1.109455, "<img src=""../images/Portsmouth Historic Dockyard.jpg"">");

insert ignore into factBk.fact values (3,"The National Museum of the Royal Navy","The National Museum of the Royal Navy, Portsmouth, formerly known as the Royal Naval Museum, is a museum of the history of the Royal Navy located in the Portsmouth Historic Dockyard section of HMNB Portsmouth, Portsmouth, Hampshire, England. The museum is part of the National Museum of the Royal Navy, a non-departmental public body sponsored by the Ministry of Defence. The museum was founded in 1911. Known originally as the Dockyard Museum, it was conceived by Mr Mark Edwin Pescott-Frost, then secretary to the Admiral Superintendent at Portsmouth. With a passion for naval history he spearheaded a project to save items for future generations, eventually leading to the opening of a new museum. His foresight ensured the survival of many interesting and important artefacts, several of which are still on display today. He was awarded the Imperial Service Order in 1916.", 50.800840, -1.110010, "<img src=""../images/The National Museum of the Royal Navy.jpg"">");

insert ignore into factBk.fact values (4,"HMS M33","HMS M33 is an M29-class monitor of the Royal Navy built in 1915. She saw active service in the Mediterranean during the First World War and in Russia during the Allied Intervention in 1919. She was used subsequently as a mine-laying training ship, fuelling hulk, boom defence workshop and floating office, being renamed HMS Minerva and Hulk C23 during her long life. She passed to Hampshire County Council in the 1980s and was then handed over to the National Museum of the Royal Navy in 2014. A programme of conservation was undertaken to enable her to be opened to the public. HMS M.33 is located within Portsmouth Historic Dockyard and opened to visitors on 7 August 2015 following a service of dedication. She is one of only three surviving Royal Navy warships of the First World War and the only surviving ship from the Gallipoli Campaign. M33 was built as part of the rapid ship construction campaign following the outbreak of the First World War by Harland and Wolff, Belfast. Ordered in March 1915, she was launched in May and commissioned in June; an impressive shipbuilding feat especially considering that numerous other ships of her type were being built in the same period.", 50.801741, -1.110687, "<img src=""../images/HMS M33.jpg"">");

insert ignore into factBk.fact values (5,"The HMS Warrior","HMS Warrior is a 40-gun steam-powered armoured frigate[Note 1] built for the Royal Navy in 1859–61. She was the name ship of the Warrior-class ironclads. Warrior and her sister ship HMS Black Prince were the first armour-plated, iron-hulled warships, and were built in response to France's launching in 1859 of the first ocean-going ironclad warship, the wooden-hulled Gloire. Warrior conducted a publicity tour of Great Britain in 1863 and spent her active career with the Channel Squadron. Obsolescent following the 1871 launching of the mastless and more capable HMS Devastation, she was placed in reserve in 1875, and was paid off – decommissioned – in 1883. She subsequently served as a storeship and depot ship, and in 1904 was assigned to the Royal Navy's torpedo training school.", 50.798218, -1.109280, "<img src=""../images/The HMS Warrior.jpg"">");

insert ignore into factBk.fact values (6,"Victoria Park","Officially opened on 25 May 1878 and was the first public park to be opened in Portsmouth. It was designed by Alexander McKenzie. It has a total area of around 15 acres (61,000 m2) and is planted with trees, shrubs and flowers. The centre of the park features an enclosed area which inhabits animals such as birds, rabbits and guinea pigs. The park is also home to a number of monuments. These mostly consist of obelisks but there is also one in the style of a Chinese temple.", 50.798937, -1.094129, "<img src=""../images/Victoria Park.jpg"">");

insert ignore into factBk.fact values (7,"St John Cathedral","The Cathedral Church of St John the Evangelist is a Roman Catholic cathedral in Portsmouth, England. It was opened in 1882 and is the first cathedral to have been built in Portsmouth.", 50.800284, -1.094795, "<img src=""../images/St John Cathedral.jpg"">");

insert ignore into factBk.fact values (8,"Guild Hall","Constructed in 1890 and originally used by the local council, the building was known as Portsmouth Town Hall until 1926. It was heavily damaged by bombing during the Second World War and largely rebuilt during the 1950s. Today it operates as a concert, wedding and conference venue.", 50.797571, -1.092923, "<img src=""../images/Guild Hall.jpg"">");

insert ignore into factBk.fact values (9,"New Theatre Royal","The New Theatre Royal is a Victorian Grade II* listed theatre in the heart of Portsmouth, England, with a capacity of 667. The theatre building was constructed in 1854 as Landport Hall. It was converted to a theatre two years later.", 50.796490, -1.093246, "<img src=""../images/New Theatre Royal.jpg"">");

insert ignore into factBk.fact values (10,"Domus Dei","Used as an almshouse & hospice was firebombed in WWII. Domus Dei was an almshouse and hospice established in around 1212 A.D. at Old Portsmouth, Hampshire, UK by Peter des Roches, Bishop of Winchester.", 50.788978, -1.104003, "<img src=""../images/Domus Dei.jpg"">");

insert ignore into factBk.fact values (11,"D-Day Museum","The D-Day Museum is located in Southsea, Portsmouth in Hampshire, England. Opened in 1984 by Queen Elizabeth The Queen Mother, it tells the story of Operation Overlord during the Normandy D-Day landings.", 50.779638, -1.089424, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (12,"Southsea Castle","Southsea Castle, historically also known as Chaderton Castle, South Castle and Portsea Castle, is an artillery fort originally constructed by Henry VIII on Portsea Island, Hampshire. Built in 1544, the Castle was part of a series of fortifications constructed by Henry VIII around England's coasts to protect the country from invaders. Barely was the work completed when Henry VIII's flagship, the Mary Rose, tragically sank in front of the Castle. During the English Civil War, nearly a century later, the Castle was captured for the only time in its history, by Parliamentarian forces.", 50.777992, -1.088841, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (13,"HMS Victory","HMS Victory is a 104-gun first-rate ship of the line of the Royal Navy, ordered in 1758, laid down in 1759 and launched in 1765. She is best known for her role as Lord Nelson's flagship at the Battle of Trafalgar on 21 October 1805.", 50.800523, -1.109459, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (14,"The Spinnaker Tower","The Spinnaker Tower is a 560-foot (170 m) landmark observation tower in Portsmouth, England, UK. It is the centrepiece of the redevelopment of Portsmouth Harbour, which was supported by a National Lottery grant. Its shape was chosen by Portsmouth residents from a selection. The tower, designed by local firm HGP Architects and engineering consultants Scott Wilson and built by Mowlem, reflects Portsmouth's maritime history through its being modelled after a sail. The tower was opened on 18 October 2005. The tower is owned by Portsmouth City Council, but operationally it is managed by Continuum Leading Attractions, a cultural attractions group based in York. Continuum also runs five other visitor attractions across the country. Following a commercial sponsorship deal with Dubai-based Emirates airline, the tower was renamed in July 2015.", 50.795573, -1.108490, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (15,"Portchester Castle","Portchester Castle is a medieval castle built within a former Roman fort at Portchester to the east of Fareham in the English county of Hampshire. It is located at the northern end of Portsmouth Harbour. Probably founded in the late 11th century, Portchester was a baronial castle taken under royal control in 1154. The monarchy controlled the castle for several centuries and it was a favoured hunting lodge of King John. It was besieged and captured by the French in 1216 before permanently returning to English control shortly thereafter. Occupying a commanding position at the head of Portsmouth Harbour, in the medieval period Portchester was an important port. The castle saw the disembarkation for several campaigns to France led by England's kings. In anticipation of a French invasion during the first quarter of the 14th century, Edward II spent £1,100 repairing and reinforcing Portchester Castle. A plot to overthrow Henry V was discovered and the culprits apprehended at Portchester; this event features in Shakespeare's play, Henry V. Later in its history, the castle was used as a prison. Today Portchester Castle is a Scheduled Ancient Monument, and a Grade I listed building.The castle has been in the ownership of the Southwick Estate since the 17th century but is managed by English Heritage and open to visitors throughout the year.The Norman church, St. Mary's, which stands in the south-east corner of the grounds, falls within the Anglican Diocese of Portsmouth.", 50.837546, -1.113722, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (16,"Southsea Castle","Southsea Castle, historically also known as Chaderton Castle, South Castle and Portsea Castle,is an artillery fort originally constructed by Henry VIII on Portsea Island, Hampshire, in 1544. It formed part of the King's Device programme to protect against invasion from France and the Holy Roman Empire, and defended the Solent and the eastern approach to Portsmouth. The castle had a square central keep, two rectangular gun platforms to the east and west, and two angled bastions to the front and rear, and was an early English example of the trace italienne-style of fortification popular on the Continent. The Cowdray engraving of the Battle of the Solent in 1545 depicted Henry VIII visiting the castle. Despite several serious fires, it remained in service and saw brief action at the start of the English Civil War in 1642 when it was stormed by Parliamentary forces.", 50.777995, -1.088822, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (17,"Fort Cumberland","Fort Cumberland is a pentagonal artillery fortification erected to guard the entrance to Langstone Harbour, east of the Dockyard of Portsmouth on the south coast of England. It was sited to protect the Royal Navy Dockyard, by preventing enemy forces from landing in Langstone Harbour and attacking from the landward side. Fort Cumberland is widely recognised as the finest example of a bastion trace fort in England. It is a scheduled monument and a Grade II* listed building.", 50.789043, -1.037450, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (18,"King James's and Landport Gates","King James's and Landport Gates are two English Heritage gateways in Portsmouth, Hampshire, England.Earthen ramparts protecting the land side of the port containing munitions, international goods storage, warehouses, shops and homes were constructed in the 14th century which were strengthened by order of Henry VIII in the 16th.Four ornate gateways were originally access points to Portsmouth through the town walls. The majority of the town walls were demolished in 1860.", 50.795858, -1.098550, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (19,"Millennium Promenade","Three kilometres of promenade now links all of Portsmouth’s historic waterfront. The route starts from Spur Redoubt near Clarence Pier, Southsea and finishes on The Hard, taking in Old Portsmouth, the Camber and Gunwharf Quays.", 50.785743, -1.101013, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (20,"Square Tower","The Square Tower is one of the oldest surviving parts of Portsmouth's fortifications, built to defend the city and harbour. Built in 1494, it was originally a fortified residence for the governor of Portsmouth. It has subsequently been used to first store gunpowder and then meat for the Royal Navy.", 50.789327, -1.106513, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (21,"Round Tower","The site was originally occupied by a wooden tower before being replaced by a stone one. The wooden tower was built between 1418 and 1426 on the orders of King Henry V. In the 1490s the tower was rebuilt in stone. In the 1680s a line of ramparts was added that connected the tower to the square tower.", 50.790537, -1.108886, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (22,"Portsmouth Harbour","The mouth of the harbour provides access to the Solent. It is best known as the home of the Royal Navy, HMNB Portsmouth. Because of its strategic location on the south coast of England, protected by the natural defence of the Isle of Wight, it has since the Middle Ages been the home to England's (and later Britain's) navy. The narrow entrance, and the forts surrounding it gave it a considerable advantage of being virtually impregnable to attack from the sea. Before the fortifications were built the French burned Portsmouth in 1338.", 50.824558, -1.117679, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (23,"Camber Dock","Camber Dock is the oldest developed part of the Portsmouth Harbour complex. Lying within the historic area of Old Portsmouth, it is part of Portsmouth Point that lies outside the original fortified boundaries of Portsmouth. After improvements in the King James's and Landport Gates and the areas military defences, civilian building of dockside storage and ancillary servicing facilities began from 1590. With major ships anchored at Spithead, from the 18th century the surrounding area became noted as a popular but lewd area for visiting sailors.", 50.792040, -1.107465, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (24,"Portsdown Hill","The forts on Portsdown Hill were built as a result of the 1859 Royal Commission, as part of a series of fortifications built to defend Portsmouth and its dockyard (which is 8 kilometres away) from a possible attack from inland, as the development of rifled gun barrels made it possible for an invading army to land elsewhere, circle around to the top of the hill and bombard the city from there, rendering the existing Hilsea Lines at the bottom of the ridge useless. A series of 6 forts were planned along the 10 km (6.2 mi) of the ridge. From west to east they are forts Fareham, Wallington, Nelson, Southwick, Widley and Purbrook. The line was finished off at the eastern end with Crookhorn Redoubt and Farlington Redoubt. The main threat was perceived to be from Napoleon III of France, but this receded soon after the forts' completion. Due to this they became known as Palmerston's Folly but, though never needed for their original purpose, were useful anti-aircraft gun emplacements during World War II.",50.854421, -1.086837, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (25,"Portsmouth Cathedral","The Cathedral Church of St Thomas of Canterbury, commonly known as Portsmouth Cathedral, is an English cathedral church. It is the cathedral of the Church of England Diocese of Portsmouth and is located in the centre of Old Portsmouth. It is the seat of the Bishop of Portsmouth.Around the year 1180, Jean de Gisors, a wealthy Norman merchant and Lord of the Manor of Titchfield, gave land in his new town of Portsmouth to the Augustinian canons of Southwick Priory so that they could build a chapel to the Glorious Honour of the Martyr Thomas of Canterbury, one time Archbishop, on my land which is called Sudewede, the island of Portsea.It was given so that they could build a chapel dedicated to the honour of St Thomas of Canterbury, who was assassinated and martyred ten years earlier. This chapel was to become, in turn, a parish church in the 14th century and then a cathedral in the 20th century.",50.790457, -1.104274, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (26,"Statue of Charles Dickens","The bronze statue of the writer surrounded by books has been placed in Guildhall Square in Portsmouth, the city in which he was born.More than 100 invited guests, including 40 members of the Dickens family, attended.One of the youngest members, nine-year-old Oliver Dickens, helped to unveil the £140,000 statue.", 50.797370, -1.092488, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (27,"The Froddington Arms","The name Fratton was once Froddington, a Saxon name which originally meant Frodda's Farm or Frodda's village. A pub on Fratton Road is still named The Froddington Arms. Goldsmith's Farm and Fratton Common were part of the original small rural village originally called Froddington, the only visible evidence of this being the presence of a public house, The Froddington Arms on the western side of Fratton Road.", 50.798111, -1.077030, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (28,"The Mudlarking Statue","A mudlark is someone who scavenges in river mud for items of value, a term used especially to describe those who scavenged this way in London during the late 18th and 19th centuries.The nearby statue commemorates the generations of Portsea children who enjoyed mudlarking here - entertaining travellers by retrieving coins they threw into the mud below the bridge to the harbour station and Gosport Ferry. Boys and girls would scramble to find the money tossed down, sometimes diving into the mud, performing handstands or dipping their heads in it. Many Portsea families lived in poverty, so the small change was welcomed. Usually, what the children did not spend on sweets or pie and chips was given to mum to help out the family finances.", 50.798618, -1.107341, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (29,"The Hilsea Lines","The Hilsea Lines are a line of 18th- and 19th-century fortifications built to protect the northern approach to Portsea, an island off the coast of England which is part of the city of Portsmouth and its key naval base. They are now used as a greenspace and leisure area.", 50.834502, -1.063504, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (30,"Hilsea Barracks","Hilsea Barracks was a military installation at Hilsea in Portsmouth. The site was originally occupied by Gatcombe Manor, a medieval house which was acquired through marriage by Admiral Sir Roger Curtis in the 18th century.The War Office requisitioned the site from Curtis for military purposes in the 1770s. The garrison commander's house, which was rebuilt in 1780, evolved to become the officers' mess and survives as a Grade II listed building. The barracks, built to accommodate several thousand troops, were completed in 1794 and subsequently enhanced in 1854 for occupation by the Royal Field Artillery: a military chapel known as St Barbara's Garrison Church was added in 1888.", 50.82838, -1.06682, "<img src=""../images/imgname.jpg"">");

insert ignore into factBk.fact values (31,"Queen Victoria Statue","The Queen is shown standing in contemplation, gazing forward and slightly downward, mouth severe; the likeness is considered excellent. Alfred Drury made several statues of Queen Victoria. The Portsmouth one dates from 1903, and a very similar one was emplaced in Bradford in the following year.",50.797369, -1.091873, "<img src=""../images/Queen Victoria Statue.jpg"">");

insert ignore into factBk.fact values (32,"Great Salterns Recreation Ground","In the 17th and 18th Centuries this area was dominated by extensive salt workings and was a major supplier of sea salt to the Royal Navy. Now it's part of a golf course, but the lake itself and the surrounding areas are particularly interesting. It is a pleasant 7-hectare area of open grassland and scrub.",50.811559, -1.051832, "<img src=""../images/Great Salterns Recreation Ground.jpg"">");

insert ignore into factBk.fact values (33,"Fort Brockhurst","Fort Brockhurst is one of the Palmerston Forts, in Gosport, England and a Scheduled Ancient Monument. It is now an English Heritage property.",50.815004, -1.154968, "<img src=""../images/Fort Brockhurst.jpg"">");

insert ignore into factBk.fact values (34,"Buckland, Portsmouth","Buckland, then known as Bocheland, was one of the three settlements on Portsea Island mentioned in the Domesday Book. The Manor of Bocheland was purchased by Jean de Gisors. De Gisors, a Norman lord who then founded Portsmouth on land at the southern end of the manor, in 1180. The area was extensively bombed during the Second World War.",50.807929, -1.083293, "<img src=""../images/Buckland, Portsmouth.jpg"">");

insert ignore into factBk.fact values (35,"Copnor","Copnor is an area of Portsmouth, England, located on the eastern side of Portsea Island. The population of Copnor Ward at the 2011 Census was 13,608. As Copenore, it was one of the three villages listed as being on Portsea Island in the Domesday book. In the late 19th, early 20th century the rapid expansion of Portsmouth saw the original village engulfed.",50.816083, -1.064722, "<img src=""../images/Copnor.jpg"">");

insert ignore into factBk.fact values (36,"Clarence Pier","Clarence Pier is an amusement pier in Portsmouth, Hampshire. It is located next to Southsea Hoverport. Unlike most seaside piers in the UK, the pier does not extend very far out to sea and instead goes along the coast.The pier was originally constructed in 1861 and boasted a regular ferry service to the Isle of Wight. It was damaged by air raids during World War II and opened in its current form in 1961. ",50.786021, -1.101466,"<img src=""../images/Clarence Pier.jpg"">");

insert ignore into factBk.fact values (37,"Fratton Park","Fratton Park is a football stadium in the English city-port of Portsmouth in the United Kingdom. It remains as the original home of Portsmouth F.C. ever since the football club was first founded in 1898.Uniquely, Fratton Park is currently the only stadium in English professional football that is not on the mainland island of Great Britain, as it is built on Portsea Island, where the city of Portsmouth is located.The stadium has a current (reduced) capacity for 19,669 supporters, although the stadium has had a much larger capacity in its history, with a record attendance of 51,385 supporters. The football pitch, measuring 115 x 73 yards, is aligned from east to west, which is considered unusual in English football, as most other pitches are orientated north to south.",50.796480, -1.063801,"<img src=""../images/Fratton Park.jpg"">");

insert ignore into factBk.fact values (38,"Portsmouth Naval Memorial","The Portsmouth Naval Memorial, sometimes known as Southsea Naval Memorial, is a war memorial in Portsmouth, Hampshire, England, on Southsea Common beside Clarence Esplanade, between Clarence Pier and Southsea Castle.The memorial was extended after the Second World War, to a design by Sir Edward Maufe. Names of those lost in the Second World War are recorded on panels set into the low walls of an enclosure added to the north, leading to a barrel-vaulted pavilion on each side. Additional sculpture was created by Charles Wheeler, William McMillan, and Esmond Burton. The additions were unveiled by the Queen Elizabeth, the Queen Mother, on 29 April 1953.",50.782650, -1.095711,"<img src=""../images/Portsmouth Naval Memorial.jpg"">");

insert ignore into factBk.fact values (39,"Landport","Landport is a district located near the centre of Portsea Island and is part of the city of Portsmouth, England. Before World War II the district was also a residential area, mainly catering for employees of the naval dockyard and their families. The district was heavily damaged by bombing during the war. After the war the decision was made that most of the remaining houses were substandard and the area was largely cleared. Some of the cleared area was used for the controversial Tricorn Centre.Landport used to encompass Old Commercial Road, which was the birthplace of English novelist Charles Dickens born February 7th, 1812.",50.812781, -1.087202,"<img src=""../images/Landport.jpg"">");

insert ignore into factBk.fact values (40,"The University of Portsmouth","The history of the university dates to 1908, when the Park building opened as a Municipal college and public library. The focus was on chemistry and engineering. The roots of the University can be traced back even further to the Portsmouth and Gosport School of Science and the Arts. Shortly after in the year of 1911 a Student Union was established; as early records from the Student Union newspaper The Galleon show. From 1945 to 1960 the college diversified its syllabus adding arts and humanities subjects after World War II, in response to a decline in the need for engineering skills. This did not hinder its expansion or reputation, as from 1960 to 1980 it opened the Frewen library, gained Polytechnic status and became one of the largest polytechnics by the late 1980s. On 7 July 1992 the inauguration of the University of Portsmouth was celebrated at a ceremony at Portsmouth Guildhall. As one of the new universities, it could validate its own degrees, under the provision of the Further and Higher Education Act 1992.",50.795149, -1.093612,"<img src=""../images/The University of Portsmouth.jpg"">");

insert ignore into factBk.fact values (41,"Horatio Nelson Statue","Vice-Admiral Horatio Nelson, 1st Viscount Nelson, 1st Duke of Bronté, KB (29 September 1758 – 21 October 1805) was a British flag officer in the Royal Navy. He was noted for his inspirational leadership, superb grasp of strategy, and unconventional tactics, which together resulted in a number of decisive naval victories, particularly during the Napoleonic Wars. He was wounded several times in combat, losing the sight in one eye in Corsica and most of one arm in the unsuccessful attempt to conquer Santa Cruz de Tenerife. He was shot and killed during his final victory at the Battle of Trafalgar near the port city of Cádiz in 1805.",50.789226, -1.105444,"<img src=""../images/Horatio Nelson Statue.jpg"">");

insert ignore into factBk.fact values (42,"Portsmouth Museum","The building dates from the 1890s and was previously part of the Clarence and Victoria Barracks complex, which apart from the museum block, were demolished in 1967. The museum includes a display on the author Arthur Conan Doyle and his fictional creation, the detective Sherlock Holmes. Richard Lancelyn Green's Sir Arthur Conan Doyle Collection is one of the most wide-ranging in the world. It includes first editions of books, related letters, film and television memorabilia. The Museum also includes the city's art and design collections and a special Sherlock Holmes trail in the grounds.",50.791627, -1.097575,"<img src=""../images/Portsmouth Museum.jpg"">");

insert ignore into factBk.fact values (43,"Southwick House","Southwick House is a manor house of the Southwick Estate located just to the north of Portsmouth in Hampshire, England. The house was built in 1800 in the late Georgian style, to replace Southwick Park house. The house is distinct for its two-story foyer lit from a cupola, and a series of elliptical rooms. A hemi-circular portico is centered on the house's colonnade of paired Ionic columns.The house became important during World War II. In 1940 the estate owners allowed the Royal Navy to use the house to accommodate overnight pupils of the Royal Navy School of Navigation, HMS Dryad in Portsmouth Naval Dockyard. In 1941, after heavy bombing of the dockyard, the house was requisitioned and became the new home of HMS Dryad.",50.8748635,-1.1020408,"<img src=""../images/Southwick House.jpg"">");

insert ignore into factBk.fact values (44,"Little Woodham","Little Woodham, also known as The Living History Village of Little Woodham or The Seventeenth Century Village, is a living museum dedicated to recreating life in a rural village in the mid-17th century. It is situated in ancient woodland in Rowner, on the Gosport peninsula, Hampshire. The hamlet of Little Woodham was initially created in 1984 as a temporary reenactment of village life on the eve of the English Civil War by members of The English Civil War Society as part of their enactment of the fictional Battle Of Stokes Bay. Following this, Society volunteers continued the exhibition during the summers of 1984 and 1985.",50.8006188,-1.1753584,"<img src=""../images/Little Woodham.jpg"">");

insert ignore into factBk.fact values (45,"Explosion! Museum of Naval Firepower","Explosion! is the Museum of Naval Firepower situated in the former Royal Naval Armaments Depot at Priddy's Hard, in Gosport, Hampshire, England. It now forms part of the National Museum of the Royal Navy.The Museum includes a wide variety of exhibits ranging from the 18th Century to the present day. These range in size from small arms, to missiles and missile launching systems, as well as complete gun turrets. Exhibits range from the Victorian RBL 20 pounder Armstrong gun through to the Second World War QF 4 inch Mk XVI naval gun. Post-war missile systems include the Exocet missile and launcher and Sea Dart missile. Modern weapons are represented in the Sea Wolf missile system and 4.5 inch Mark 8 naval gun.",50.807553,-1.1285417,"<img src=""../images/Explosion! Museum of Naval Firepower.jpg"">");

insert ignore into factBk.fact values (46,"Eastney Beam Engine House","Eastney Beam Engine House is a Grade II -listed Victorian engine house in Portsmouth, Hampshire, England. Dating from 1887, it contains two 150 hp James Watt & Co. beam engines. The pumps were built as part of a plan to improve Portsmouth's sewage system. The other element of the plan was large holding tanks which held the sewage until the pumps could empty them into the ebb tide. The pumps have since been superseded by advancing technology but have been restored (in 1980). The restoration was funded by grants totalling £10,066 from Portsmouth city council, £4000 from Hampshire county council and £2000 from the Department of the Environment. The Engine House is now open to the public as a museum, owned by Portsmouth City Council (Museums Service) but operated by volunteers. consequently is only open on the last weekend in every month.",50.788838,-1.0479067,"<img src=""../images/Eastney Beam Engine House.jpg"">");
 
