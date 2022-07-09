/*
Lekérdezések feladatsor

A feladatok a `world` adatbázishoz vonatkoznak.
Ez az adatbázis három táblát tartalmaz: `city`, `country`, `countrylanguage`.
A phpMyAdmin online felületén a `gigapoli_progmatic` néven található meg.

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

    Elvárt eredmény:
        -1523


*/
1.
SELECT `IndepYear`, MIN(country.IndepYear)
FROM `country`;

/*
2. feladat (4 pont)
    És melyik az az ország, amely legkorábban nyerte el a függetlenségét?
    Írj lekérdezést, amely visszaadja annak az országnak az összes adatát, amelyik legkorábban nyerte el a függetlenségét!
    A feladatot egy lekérdezésben oldd meg! Azaz nem elfogadható, ha először lekérdezed a legkorábbi függetlenség évszámát,
    azt kimásolod, és beilleszted a lekérdezésbe.

    Elvárt eredmény:
        CHN Code-ú ország (China)
*/
2.
SELECT *
FROM country
WHERE IndepYear = (SELECT MIN(IndepYear) FROM country);

/*
3. feladat (2 pont)
    Melyek azok a városok, amelyeknél a város neve ugyanaz, mint a körzeté?
    Írj lekérdezést, amely visszaadja a városok összes adatát, amelyeknél a név megegyezik a körzet nevével! (District)

    Elvárt eredmény:
        550 rekord
        ID szerint növekvő sorrendben az első 5 darab: 2, 3, 8, 11, 34
        ID szerint növekvő sorrendben az utolsó 3 darab: 4076, 4078, 4079
*/
3.
SELECT *
FROM `city`
WHERE city.Name = city.District
ORDER BY ID;

/*
4. feladat (3 pont)
    Mely országoknál tartalmazza az államfő neve az 'Ahmad', az 'Ahmed' vagy a 'Hamad' szavakat?
    Írj lekérdezést, amely visszaadja az ország nevét és az államfő nevét, amennyiben az államfő neve tartalmazza
    a fent leírt szavak bármelyikét! (HeadOfState)

    Elvárt eredmény:
        7 rekord
        országnevek: Bangladesh, Bahrain, Kuwait, Mauritania, Qatar, Sudan, Sierra Leone
*/
4.
SELECT Name, HeadOfState
FROM country
WHERE HeadOfState LIKE '%Ahmad%' OR HeadOfState LIKE '%Ahmed%' OR HeadOfState LIKE '%Hamad%';

/*
5. feladat (3 pont)
    Melyek azok az országok, amelyeknél nincs megadva várható életkor, de van lakosságuk?
    Írj lekérdezést, amely visszaadja azoknak az országoknak az összes adatát, ahol nem szerepel várható életkor (LifeExpectancy),
    de nem lakatlanok.

    Elvárt eredmény:
        10 rekord
        kontinensek: Oceania (7 db), Europe (2), South America (1)
*/
5.
SELECT *
FROM `country`
WHERE `LifeExpectancy` IS NULL AND `Population`> 0;

/*
6. feladat (2 pont)
    Mely országoknál nagyobb a GNPOld a GNP-nél?
    Írj lekérdezést, amely visszaadja az ország kódját, nevét, a GNP-t és a GNPOld-ot azokról az országokról,
    ahol a GNPOld nagyobb, mint a GNP!

    Elvárt eredmény:
        63 rekord
*/
6.
SELECT country.Code, country.Name, country.GNP,country.GNPOld
FROM `country`
WHERE country.GNPOld > country.GNP;

/*
7. feladat (4 pont)
    Mely nyelvek neve végződik úgy, hogy 'ian'?
    Írj lekérdezést, amely visszaadja a nyelvek nevét, ahol a név 'ian'-ra végződik!
    Mindegyik nyelv csak egyszer szerepeljen a találatok között, és rendezd őket név szerint ABC-sorrendbe!

    Elvárt eredmény:
        29 rekord
*/
7.
SELECT *
FROM `countrylanguage`
WHERE `Language` LIKE '%ian'
GROUP BY `Language`
ORDER BY `Language`;

/*
8. feladat (4 pont)
    Hány darab ország szerepel az adatbázisban a különböző európai régiókban?
    Írj lekérdezést, amely visszaadja a régiót és a régióban található országok darabszámát,
    ahol a régióban szerepel az, hogy 'Europe'!

    Elvárt eredmény:
        Southern Europe: 15
        Western Europe: 9
        Eastern Europe 10
*/
8.
SELECT Region, COUNT(Name) AS orszagok
FROM country
WHERE Region LIKE '%Europe%'
GROUP BY Region;

/*
9. feladat (5 pont)
    Melyek az országok fővárosai?
    Írj lekérdezést, amely visszaadja az ország kódját, nevét és a fővárosának a nevét,
    méghozzá az ország neve szerint ABC-sorrendben!
    A találati listában minden ország szerepeljen - még akkor is, ha nincsen fővárosa.

    Elvárt eredmény:
        239 rekord
        első országkód: AFG
        utolsó országkód: ZWE
*/
9.
SELECT Code,country.Name, city.Name
FROM country
LEFT JOIN city
ON country.Capital = city.ID
ORDER BY country.Name;

/*
10. feladat (3 pont)
    Melyek azok a városok, amelyeknél a populáció száma pontosan 3 számjegyből áll?
    Írj lekérdezést, amely visszaadja azoknak a városoknak az összes adatát, amelyeknél a lakosság száma pontosan 3 számjegyből áll!

    Elvárt eredmény:
        10 rekord
        a városok ID-ja: 61, 62, 1791, 2316, 2317, 2728, 2805, 2806, 3333, 3538
*/
10.
SELECT *
FROM city
WHERE Population LIKE '___';

/*
11. feladat (5 pont)
    Mely városok tartoznak olyan országokhoz, amelyek a 'Nordic Countries' régióban találhatóak?
    Írj lekérdezést, amely visszaadja azoknak a városoknak az összes adatát,
    amelyek valamilyen 'Nordic Countries' régióhoz tartozó országban vannak,
    méghozzá országkód szerint ABC-sorrendben (növekvő), populáció szerint csökkenő sorrendben!

    Elvárt eredmény:
        35 rekord
        országkódok, amelyek szerepelnek a listában: DNK, FIN, FRO, ISL, NOR, SJM, SWE
*/
11.
SELECT city.ID,city.Name,city.CountryCode,city.District,city.Population
FROM `city`
INNER JOIN country
ON city.CountryCode = country.Code
WHERE country.Region LIKE '%Nordic Countries%'
ORDER BY country.Code, city.Population DESC;

/*
12. feladat (5 pont)
    Hány ország található a különböző régiókban, amelyek időszámításunk szerint 1500 előtt nyerték el a függetlenségüket,
    vagy mindig is függetlenek voltak?
    Írj lekérdezés, amely visszaadja a régiót és a régióhoz tartozó azon országok darabszámát, amelyekre igaz,
    hogy nincs érték megadva az `IndepYear`-nél, vagy 1500 előtt nyerték el a függetlenségüket!
    A találatokat rendezd a darabszám szerint csökkenő sorrendbe!

    Elvárt eredmény:
        19 rekord
        legkisebb: Northern Africa (1)
        legnagyobb: Caribbean (11)
*/
12.
SELECT Region,COUNT(Region)
FROM country
WHERE IndepYear IS NULL OR IndepYear < 1500
GROUP BY Region
ORDER BY COUNT(Region) DESC;

/*
13. feladat (6 pont)
    Melyek azok az országok, amelyekben nem hivatalos nyelvként beszélik az angolt?
    Írj lekérdezést, amely visszaadja az országok összes adatát, amelyekben az angol nem hivatalos nyelv!

    Elvárt eredmény:
        16 rekord
        országkódok: ABW, ANT, BHR, BRN, COK, DNK, ISL, JPN, KWT, MAC, MCO, MDV, MYS, NOR, PRI, TTO
*/
13.
SELECT *
FROM country
Inner JOIN countrylanguage
ON country.Code=countrylanguage.CountryCode
WHERE IsOfficial = 'F' and Language Like 'English';

/*
14. feladat (6 pont)
    Mely országokhoz nem tartozik egy város sem?
    Írj lekérdezést, amely visszaadja azoknak az országoknak az összes adatát, amelyekhez nem tartozik város az adatbázisban!

    Elvárt eredmény:
        7 rekord
        országkódok: ATA, ATF, BVT, HMD, IOT, SGS, UMI
*/
14.
SELECT *
FROM `country`
LEFT JOIN city
ON city.CountryCode = country.Code
WHERE city.Name IS NULL;

/*
15. feladat (6 pont)
    Melyik országokhoz tartozik nyelv, ahol a nyelvet a lakosság 0%-a beszéli?
    Írj lekérdezést, amely visszaadja az ország nevét, kontinensét, régióját, a nyelv nevét és százalékát, amelyre igaz,
    hogy a nyelv százaléka 0!

    Elvárt eredmény:
        65 rekord
*/
15.
SELECT country.Name, country.Continent,country.Region,countrylanguage.Language, `Percentage`
FROM `countrylanguage`
INNER JOIN country
ON countrylanguage.CountryCode = country.Code
WHERE `Percentage` = 0;

-- ---------------------------------------------------------------------------------------------------------------------

/*
Bónusz feladatok
*/

/*
bónusz 1. (4 pont)
    Melyek azok az országok, amelyek kétbetűs országkódja nem a hárombetűs országkód első két betűje?
    Írj lekérdezést, amely visszaadja az ország hárombetűs kódját, kétbetűs kódját és nevét,
    ahol a hárombetűs országkód első két betűje nem azonos a kétbetűs kóddal!

    Elvárt eredmény:
        88 rekord
*/


/*
bónusz 2. (4 pont)
    Mely városok tartoznak ahhoz az országhoz, amelyik legelőbb nyerte el a függetlenségét?
    Írj lekérdezést, amely visszaadja azoknak a városoknak az összes adatát,
    amelyek a legkorábban függetlenné vált országhoz tartoznak!
    A feladatot egy lekérdezésben oldd meg! Azaz nem elfogadható, ha először lekérdezed az országkódot,
    az kimásolod, és beleilleszted a lekérdezésbe.

    Elvárt eredmény:
        363 rekord
*/


/*
bónusz 3. (4 pont)
    Mekkora a százaléka a legnagyobb százalékban beszélt nyelveknek országonként?
    Írj lekérdezést, amely visszaadja az országkódot és az országban a legnagyobb százalékban beszélt nyelv százalékát!
    A feladatot egy lekérdezésben oldd meg!

    Elvárt eredmény:
        233 rekord
        néhány példa:
            ABW 76.7
            AFG 52.4
            AGO 37.2
            AIA 0.0
*/


/*
bónusz 4. (6 pont)
    Melyik nyelvet beszélik a legnagyobb százalékban országonként?
    Írj lekérdezést, amely visszaadja az országkódot, a nyelvet és a százalékot,
    méghozzá országonként kiválasztva a legnagyobb százalékban beszélt nyelvet!
    A feladatot egy lekérdezésben oldd meg!

    Elvárt eredmény:
        241 rekord (néhány országban holtverseny van - ezért lesz itt több találat, mint a bónusz 3. feladatnál)
        néhány példa:
            ABW, Papiamento, 76.7
            AFG, Pashto, 52.4
            AGO, Ovimbundu, 37.2
            AIA, English, 0.0
*/


/*
bónusz 5. (6 pont)
    Hány hivatalos és nem hivatalos nyelv tartozik a különböző országokhoz?
    Írj lekérdezést, amely visszaadja az országkódot, a hozzá tartozó hivatalos nyelvek darabszámát
    és a nem hivatalos nyelvek darabszámát!

    Elvárt eredmény:
        233 rekord
        néhány példa:
            ABW, hivatalos: 1, nem hivatalos: 3
            AFG, hivatalos: 2, nem hivatalos: 3
            AGO, hivatalos: 0, nem hivatalos: 9
            AIA, hivatalos: 1, nem hivatalos: 0
*/

