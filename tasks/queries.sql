/*
Lekérdezések feladatsor

Kötelezően megoldandó feladatok: 1 - 15.
A bónusz feladatok nem kötelezőek.

A megoldásaidat a megfelelő feladat után írd! A feladat szövege törölhető, de a sorszáma nem.
Azaz legyen teljesen egyértelmű, hogy melyik feladatra mi a megoldásod.

A nem beazonosítható, nem egyértelmű megoldásokért nem jár pont.
Nem futtatható (azaz szintaktikai hibás) SQL utasításokért nem jár pont.
(Nem minősül szintaktikai hibának az utasítást lezáró pontosvessző elhagyása.)
Nem teljesen helyes, azonban a feladatot részben teljesítő megoldásokért részpontszám jár.
A bónusz feladatoknál csak a teljesen helyes megoldásért jár pont.

Fokozottan ügyelj arra, hogy kövesd a feladat leírását. (Például csak olyan mezőket tartalmazzon a találati lista,
amelyeket a feladat kér; olyan sorrendben jelenjenek meg a találatok, amit a feladat kér - stb.)

Ne feledd, hogy a megoldásaidat jelen fájlnak tartalmaznia kell.

Jó munkát!
*/

/*
1. feladat (2 pont)
    Melyik évben nyerte el egy ország legkorábban a függetlenségét?
    Írj lekérdezést, amely visszaadja azt az évszámot, amikor az első ország független lett! (IndepYear)
*/


/*
2. feladat (4 pont)
    És melyik az az ország, amely legkorábban nyerte el a függetlenségét?
    Írj lekérdezést, amely visszaadja annak az országnak az összes adatát, amelyik legkorábban nyerte el a függetlenségét!
    A feladatot egy lekérdezésben oldd meg! Azaz nem elfogadható, ha először lekérdezed a legkorábbi függetlenség évszámát,
    azt kimásolod, és beilleszted a lekérdezésbe.
*/


/*
3. feladat (2 pont)
    Melyek azok a városok, amelyeknél a város neve ugyanaz, mint a körzeté?
    Írj lekérdezést, amely visszaadja a városok összes adatát, amelyeknél a név megegyezik a körzet nevével! (District)
*/


/*
4. feladat (3 pont)
    Mely országoknál tartalmazza az államfő neve az 'Ahmad', az 'Ahmed' vagy a 'Hamad' szavakat?
    Írj lekérdezést, amely visszaadja az ország nevét és az államfő nevét, amennyiben az államfő neve tartalmazza
    a fent leírt szavak bármelyikét! (HeadOfState)
*/


/*
5. feladat (3 pont)
    Melyek azok az országok, amelyeknél nincs megadva várható életkor, de van lakosságuk?
    Írj lekérdezést, amely visszaadja azoknak az országoknak az összes adatát, ahol nem szerepel várható életkor (LifeExpectancy),
    de nem lakatlanok.
*/


/*
6. feladat (2 pont)
    Mely országoknál nagyobb a GNPOld a GNP-nél?
    Írj lekérdezést, amely visszaadja az ország kódját, nevét, a GNP-t és a GNPOld-ot azokról az országokról,
    ahol a GNPOld nagyobb, mint a GNP!
*/


/*
7. feladat (4 pont)
    Mely nyelvek neve végződik úgy, hogy 'ian'?
    Írj lekérdezést, amely visszaadja a nyelvek nevét, ahol a név 'ian'-ra végződik!
    Mindegyik nyelv csak egyszer szerepeljen a találatok között, és rendezd őket név szerint ABC-sorrendbe!
*/


/*
8. feladat (4 pont)
    Hány darab ország szerepel az adatbázisban a különböző európai régiókban?
    Írj lekérdezést, amely visszaadja a régiót és a régióban található országok darabszámát,
    ahol a régióban szerepel az, hogy 'Europe'!
*/


/*
9. feladat (5 pont)
    Melyek az országok fővárosai?
    Írj lekérdezést, amely visszaadja az ország kódját, nevét és a fővárosának a nevét,
    méghozzá az ország neve szerint ABC-sorrendben!
    A találati listában minden ország szerepeljen - még akkor is, ha nincsen fővárosa.
*/


/*
10. feladat (3 pont)
    Melyek azok a városok, amelyeknél a populáció száma pontosan 3 számjegyből áll?
    Írj lekérdezést, amely visszaadja azoknak a városoknak az összes adatát, amelyeknél a lakosság száma pontosan 3 számjegyből áll!
*/


/*
11. feladat (5 pont)
    Mely városok tartoznak olyan országokhoz, amelyek a 'Nordic Countries' régióban találhatóak?
    Írj lekérdezést, amely visszaadja azoknak a városoknak az összes adatát,
    amelyek valamilyen 'Nordic Countries' régióhoz tartozó országban vannak,
    méghozzá országkód szerint ABC-sorrendben (növekvő), populáció szerint csökkenő sorrendben!
*/


/*
12. feladat (5 pont)
    Hány ország található a különböző régiókban, amelyek időszámításunk szerint 1500 előtt nyerték el a függetlenségüket,
    vagy mindig is függetlenek voltak?
    Írj lekérdezés, amely visszaadja a régiót és a régióhoz tartozó azon országok darabszámát, amelyekre igaz,
    hogy nincs érték megadva az `IndepYear`-nél, vagy 1500 előtt nyerték el a függetlenségüket!
    A találatokat rendezd a darabszám szerint csökkenő sorrendbe!
*/


/*
13. feladat (6 pont)
    Melyek azok az országok, amelyekben nem hivatalos nyelvként beszélik az angolt?
    Írj lekérdezést, amely visszaadja az országok összes adatát, amelyekben az angol nem hivatalos nyelv!
*/


/*
14. feladat (6 pont)
    Mely országokhoz nem tartozik egy város sem?
    Írj lekérdezést, amely visszaadja azoknak az országoknak az összes adatát, amelyekhez nem tartozik város az adatbázisban!
*/


/*
15. feladat (6 pont)
    Melyik országokhoz tartozik nyelv, ahol a nyelvet a lakosság 0%-a beszéli?
    Írj lekérdezést, amely visszaadja az ország nevét, kontinensét, régióját, a nyelv nevét és százalékát, amelyre igaz,
    hogy a nyelv százaléka 0!
*/


-- ---------------------------------------------------------------------------------------------------------------------

/*
Bónusz feladatok
*/

/*
bónusz 1. (4 pont)
    Melyek azok az országok, amelyek kétbetűs országkódja nem a hárombetűs országkód első két betűje?
    Írj lekérdezést, amely visszaadja az ország hárombetűs kódját, kétbetűs kódját és nevét,
    ahol a hárombetűs országkód első két betűje nem azonos a kétbetűs kóddal!
*/


/*
bónusz 2. (4 pont)
    Mely városok tartoznak ahhoz az országhoz, amelyik legelőbb nyerte el a függetlenségét?
    Írj lekérdezést, amely visszaadja azoknak a városoknak az összes adatát,
    amelyek a legkorábban függetlenné vált országhoz tartoznak!
    A feladatot egy lekérdezésben oldd meg! Azaz nem elfogadható, ha először lekérdezed az országkódot,
    az kimásolod, és beleilleszted a lekérdezésbe.
*/


/*
bónusz 3. (4 pont)
    Mekkora a százaléka a legnagyobb százalékban beszélt nyelveknek országonként?
    Írj lekérdezést, amely visszaadja az országkódot és az országban a legnagyobb százalékban beszélt nyelv százalékát!
    A feladatot egy lekérdezésben oldd meg!
*/


/*
bónusz 4. (6 pont)
    Melyik nyelvet beszélik a legnagyobb százalékban országonként?
    Írj lekérdezést, amely visszaadja az országkódot, a nyelvet és a százalékot,
    méghozzá országonként kiválasztva a legnagyobb százalékban beszélt nyelvet!
    A feladatot egy lekérdezésben oldd meg!
*/


/*
bónusz 5. (6 pont)
    Hány hivatalos és nem hivatalos nyelv tartozik a különböző országokhoz?
    Írj lekérdezést, amely visszaadja az országkódot, a hozzá tartozó hivatalos nyelvek darabszámát
    és a nem hivatalos nyelvek darabszámát!
*/

