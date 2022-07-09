/*
Adatbázis létrehozása feladat

Készíts adatbázis-táblákat a feladat leírása alapján!
(Magát az adatbázist nem kell létrehoznod.)

Amit be kell adnod:
    - a táblák létrehozásának MySQL utasítása
    - a táblák mezőinek létrehozásához és beállításához szükséges MySQL utasítások

Az utasításokat jelen fájl tartalmazza!

A bónusz feladat megoldása nem kötelező.

Nem futtatható (azaz szintaktikai hibás) SQL utasításokért nem jár pont.
A feladatot részben teljesítő megoldásokért részpontszám jár.
A bónusz feladatnál csak a teljesen helyes megoldásért jár pont.

A feladat leírása törölhető.

Jó munkát!
*/

/*
Adatbázis-táblák létrehozása (20 pont)

Az általad létrehozott adatbázist egy üzenetküldő alkalmazáshoz szeretnénk használni.
Az alkalmazásban a felhasználók regisztrálás után tudnak üzenetet küldeni szintén regisztrált felhasználóknak,
valamint a kapott üzenetekre válaszolhatnak.
Nincs lehetőség több címzett megadására - azaz egy üzenetet csak egy felhasználó részére lehet küldeni.

Az adatbázisnak képesnek kell lennie a következő adatok tárolására:
    1. regisztrált felhasználók adatai
        - kötelező adatok: név, email-cím, jelszó, aktív felhasználó-e, a regisztrálás időpontja


    2. a regisztrált felhasználók által egymásnak küldött üzenetek adatai
        - kötelező adatok: küldő, címzett, üzenet szövege, az üzenet küldésének időpontja,
          továbbá ha az üzenet egy korábban kapottra válasz, akkor hivatkozás a megválaszolt üzenetre



Kritériumok az adatbázissal kapcsolatban:
    - legalább kettő, legfeljebb négy táblát tartalmazzon
    - legyen legalább egy kapcsolat a létrehozott táblák között (idegen kulccsal)
      (egy tábla saját magával is kapcsolódhat)
    - a fent leírt adatokon kívül más adatokat is tárolhat, de egy táblán legfeljebb 8 mező lehet
    - az adatbázis, a táblák és a mezők elnevezése rajtad áll, azonban használj angol megnevezéseket, méghozzá következetesen
      (ha az egyik táblában camel-case szerinti mező-neveket adtál, akkor a másik táblában is tégy úgy)

*/
1.:
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Júl 09. 13:27
-- Kiszolgáló verziója: 10.4.24-MariaDB
-- PHP verzió: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `registered_user_datas`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_data`
--

CREATE TABLE `user_data` (
  `User_ID` int(11) NOT NULL,
  `User_name` varchar(100) NOT NULL,
  `Email_address` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Is_activeprofile` tinyint(1) NOT NULL,
  `Date_of_register` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `user_data`
--

INSERT INTO `user_data` (`User_ID`, `User_name`, `Email_address`, `Password`, `Is_activeprofile`, `Date_of_register`) VALUES
(1, '[zsomborleber]', '[email@email.com]', '[password]', 1, '2022-07-09');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`User_ID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `user_data`
--
ALTER TABLE `user_data`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;




2.:
 -- phpMyAdmin SQL Dump
        -- version 5.2.0
        -- https://www.phpmyadmin.net/
        --
        -- Gép: 127.0.0.1
        -- Létrehozás ideje: 2022. Júl 09. 13:27
        -- Kiszolgáló verziója: 10.4.24-MariaDB
        -- PHP verzió: 8.1.6

        SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
        START TRANSACTION;
        SET time_zone = "+00:00";


        /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
        /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
        /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
        /*!40101 SET NAMES utf8mb4 */;

        --
        -- Adatbázis: `registered_user_datas`
        --

        -- --------------------------------------------------------

        --
        -- Tábla szerkezet ehhez a táblához `data_from_messages`
        --

        CREATE TABLE `data_from_messages` (
          `Message_id` int(11) NOT NULL,
          `Send_from` varchar(1000) NOT NULL,
          `Send_to` varchar(1000) NOT NULL,
          `Message_value` mediumtext NOT NULL,
          `Message_date_time` datetime NOT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

        --
        -- A tábla adatainak kiíratása `data_from_messages`
        --

        INSERT INTO `data_from_messages` (`Message_id`, `Send_from`, `Send_to`, `Message_value`, `Message_date_time`) VALUES
        (1, 'zsomborleber', 'leberzsombor', 'Hello', '2022-07-09 00:00:00');

        --
        -- Indexek a kiírt táblákhoz
        --

        --
        -- A tábla indexei `data_from_messages`
        --
        ALTER TABLE `data_from_messages`
          ADD PRIMARY KEY (`Message_id`),
          ADD UNIQUE KEY `Send_from` (`Send_from`) USING HASH,
          ADD UNIQUE KEY `Send_to` (`Send_to`) USING HASH;

        --
        -- A kiírt táblák AUTO_INCREMENT értéke
        --

        --
        -- AUTO_INCREMENT a táblához `data_from_messages`
        --
        ALTER TABLE `data_from_messages`
          MODIFY `Message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
        COMMIT;

        /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
        /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
        /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



-- ---------------------------------------------------------------------------------------------------------------------

/*
Bónusz feladat (5 pont)

Adj hozzá adatokat mindegyik táblához!
(Az adatoknak nem kell valósnak lenniük. Egy felhasználói email-cím lehet például: 'valami@valami.va')

*/
