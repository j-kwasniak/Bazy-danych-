--1. Utwórz bazê danych
CREATE DATABASE firma;

--2. Utwórz schemat

USE firma;
CREATE SCHEMA rozliczenia;

--3. Utwórz tabelê.
CREATE TABLE rozliczenia.pracownicy (ID_pracownika integer PRIMARY KEY, imie varchar(25) NOT NULL, nazwisko varchar(40) NOT NULL, telefon VARCHAR(9), adres varchar(60));
CREATE TABLE rozliczenia.godziny (ID_godziny integer PRIMARY KEY, _data date, liczba_godzin integer, ID_pracownika integer NOT NULL);
CREATE TABLE rozliczenia.pensje (ID_pensji integer PRIMARY KEY, stanowisko varchar(50), kwota money, ID_premii integer NOT NULL);
CREATE TABLE rozliczenia.premie (ID_premii integer PRIMARY KEY, rodzaj varchar(50), kwota money);

--dodanie kluczy obcych

ALTER TABLE rozliczenia.godziny
ADD FOREIGN KEY (ID_pracownika) REFERENCES rozliczenia.pracownicy(ID_pracownika);

ALTER TABLE rozliczenia.pensje
ADD FOREIGN KEY (ID_premii) REFERENCES rozliczenia.premie(ID_premii);



--4. Wype³nianie tabeli rekordami
INSERT INTO rozliczenia.pracownicy VALUES (1, 'Jan', 'Kowalski', '507438298', null);
INSERT INTO rozliczenia.pracownicy VALUES (2, 'Tomasz', '£ysiak', '501886539', null);
INSERT INTO rozliczenia.pracownicy VALUES (3, 'Aleksandra', 'Zwolska', '604867392', null);
INSERT INTO rozliczenia.pracownicy VALUES (4, 'Julian', 'Abramowicz', '601367907', null);
INSERT INTO rozliczenia.pracownicy VALUES (5, 'Amadeusz', 'Abbacki', '507438298', 'ul. Œwi¹tkowska 45 34-105 Maciejowice');
INSERT INTO rozliczenia.pracownicy VALUES (6, 'Julia', 'Nowak', '507438298', null);
INSERT INTO rozliczenia.pracownicy VALUES (7, 'Kornel', 'Kowalski', '503873528', null);
INSERT INTO rozliczenia.pracownicy VALUES (8, 'Alicja', 'Baran', '508645002', 'al. Ma³a 38/22 24-100 Góra Pu³awska');
INSERT INTO rozliczenia.pracownicy VALUES (9, 'Maria', 'Karaœ', '607663027', null);
INSERT INTO rozliczenia.pracownicy VALUES (10, 'Cezray', 'Bajew', '609993726', null);

INSERT INTO rozliczenia.godziny VALUES (1, '2020-05-15', 146, 4); 
INSERT INTO rozliczenia.godziny VALUES (2, '2020-08-26', 106, 7); 
INSERT INTO rozliczenia.godziny VALUES (3, '2020-11-11', 100, 9); 
INSERT INTO rozliczenia.godziny VALUES (4, '2020-05-03', 199, 1); 
INSERT INTO rozliczenia.godziny VALUES (5, '2020-03-21', 164, 6); 
INSERT INTO rozliczenia.godziny VALUES (6, '2021-03-22', 183, 10); 
INSERT INTO rozliczenia.godziny VALUES (7, '2020-03-03', 191, 2); 
INSERT INTO rozliczenia.godziny VALUES (8, '2020-09-08', 84, 3); 
INSERT INTO rozliczenia.godziny VALUES (9, '2021-03-08' , 100, 5); 
INSERT INTO rozliczenia.godziny VALUES (10, '2020-12-03', 156, 8);

INSERT INTO rozliczenia.premie VALUES (1, 'nadgodziny', 300);
INSERT INTO rozliczenia.premie VALUES (2, 'œwi¹teczna', 200);
INSERT INTO rozliczenia.premie VALUES (3, 'nocna', 150);
INSERT INTO rozliczenia.premie VALUES (4, 'nocna', 150);
INSERT INTO rozliczenia.premie VALUES (5, 'œwi¹teczna', 200);
INSERT INTO rozliczenia.premie VALUES (6, 'œwi¹teczna', 200);
INSERT INTO rozliczenia.premie VALUES (7, null, null);
INSERT INTO rozliczenia.premie VALUES (8, null, null);
INSERT INTO rozliczenia.premie VALUES (9, 'œwi¹teczna', 200);
INSERT INTO rozliczenia.premie VALUES (10, 'nadgodziny', 100);

INSERT INTO rozliczenia.pensje VALUES (1, 'kierownik', 5000, 1);
INSERT INTO rozliczenia.pensje VALUES (2, 'kierownik produkcji', 4000, 2);
INSERT INTO rozliczenia.pensje VALUES (3, 'sprzedawca', 2500, 3);
INSERT INTO rozliczenia.pensje VALUES (4, 'sprzedawca', 2400, 4);
INSERT INTO rozliczenia.pensje VALUES (5, 'asystent kierownika', 2000, 5);
INSERT INTO rozliczenia.pensje VALUES (6, 'asystent kierownika', 3000, 6);
INSERT INTO rozliczenia.pensje VALUES (7, 'sta¿ysta', 1600, 7);
INSERT INTO rozliczenia.pensje VALUES (8, 'sta¿ysta', 1600, 8);
INSERT INTO rozliczenia.pensje VALUES (9, 'sprzedwaca', 3000, 9);
INSERT INTO rozliczenia.pensje VALUES (10, 'sprzedawca', 2100, 10);


--5. wyœwietlanie rekordów
SELECT nazwisko, adres FROM rozliczenia.pracownicy;

--6. Napisz zapytanie, które przekonwertuje datê w tabeli godziny tak, aby wyœwietlana by³a informacja jaki to dzieñ tygodnia i jaki miesi¹c
SELECT DATEPART(WEEKDAY, _data) AS 'Dzieñ tygodnia', DATEPART(MONTH, _data) AS 'Miesi¹c' FROM rozliczenia.godziny;

--7. Aktualizacja wartoœci tabeli
EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN'; 
ALTER TABLE rozliczenia.pensje ADD kwota_netto MONEY;
UPDATE rozliczenia.pensje SET kwota_netto=kwota_brutto*0.83;

SELECT kwota_brutto, kwota_netto, stanowisko FROM rozliczenia.pensje;
