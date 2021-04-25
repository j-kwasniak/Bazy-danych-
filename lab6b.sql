--CREATE DATABASE firma;

--2. Utw�rz schemat

USE firma;
CREATE SCHEMA ksiegowosc;

--3. Utw�rz tabel�.
DROP TABLE ksiegowosc.wynagrodzenie;
DROP TABLE ksiegowosc.premia;
DROP TABLE ksiegowosc.pensja;
DROP TABLE ksiegowosc.godziny;
DROP TABLE ksiegowosc.pracownicy;


CREATE TABLE ksiegowosc.pracownicy (ID_pracownika integer PRIMARY KEY, imie varchar(25) NOT NULL, nazwisko varchar(40) NOT NULL, telefon VARCHAR(9), adres varchar(60));
CREATE TABLE ksiegowosc.godziny (ID_godziny integer PRIMARY KEY, _data date, liczba_godzin integer, ID_pracownika integer NOT NULL);
CREATE TABLE ksiegowosc.pensja (ID_pensji integer PRIMARY KEY, stanowisko varchar(50), kwota money);
CREATE TABLE ksiegowosc.premia (ID_premii integer PRIMARY KEY, rodzaj varchar(50), kwota money);
CREATE TABLE ksiegowosc.wynagrodzenie (ID_wynagrodzenia integer PRIMARY KEY, data_ date, ID_pracownika integer, ID_godziny integer, ID_pensji integer, ID_premii integer);



--dodanie kluczy obcych

ALTER TABLE ksiegowosc.godziny
ADD FOREIGN KEY (ID_pracownika) REFERENCES ksiegowosc.pracownicy(ID_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (ID_pracownika) REFERENCES ksiegowosc.pracownicy(ID_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (ID_godziny) REFERENCES ksiegowosc.godziny(ID_godziny);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (ID_pensji) REFERENCES ksiegowosc.pensja(ID_pensji);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (ID_premii) REFERENCES ksiegowosc.premia(ID_premii);




--4. Wype�nianie tabeli rekordami
INSERT INTO ksiegowosc.pracownicy VALUES (1, 'Klaudiusz', 'Ka�mierczak', '507431298', null);
INSERT INTO ksiegowosc.pracownicy VALUES (2, 'Aleksander', 'Cie�lak', '501186539', null);
INSERT INTO ksiegowosc.pracownicy VALUES (3, 'Ireneusz', 'Piotrowski', '604867312', null);
INSERT INTO ksiegowosc.pracownicy VALUES (4, 'Julian', 'Szyma�ski', '611367907', null);
INSERT INTO ksiegowosc.pracownicy VALUES (5, 'Rafa�', 'Zieli�ski', '501438298', 'ul. �wi�tkowska 45 34-105 Maciejowice');
INSERT INTO ksiegowosc.pracownicy VALUES (6, 'Milena', 'D�browska', '107438298', null);
INSERT INTO ksiegowosc.pracownicy VALUES (7, 'Maja', 'Z�bek', '503873128', null);
INSERT INTO ksiegowosc.pracownicy VALUES (8, 'Idalia', 'G�recka', '501645002', 'al. Ma�a 38/22 24-100 G�ra Pu�awska');
INSERT INTO ksiegowosc.pracownicy VALUES (9, 'Ewelina', 'Andrzejewska', '107663027', null);
INSERT INTO ksiegowosc.pracownicy VALUES (10, 'Urszula', 'Kucharska', '609993721', null);

EXEC sp_addextendedproperty 
@name = N'Comment_1',
@value =N'To jest tabela z danymi pracownik�w',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE',  @level1name = 'pracownicy';
GO


INSERT INTO ksiegowosc.godziny VALUES (1, '2021-03-30', 146, 1); 
INSERT INTO ksiegowosc.godziny VALUES (2, '2021-03-30', 106, 2); 
INSERT INTO ksiegowosc.godziny VALUES (3, '2021-03-30', 100, 3); 
INSERT INTO ksiegowosc.godziny VALUES (4, '2021-03-30', 199, 4); 
INSERT INTO ksiegowosc.godziny VALUES (5, '2021-03-30', 164, 5); 
INSERT INTO ksiegowosc.godziny VALUES (6, '2021-03-30', 183, 6); 
INSERT INTO ksiegowosc.godziny VALUES (7, '2021-03-30', 191, 7); 
INSERT INTO ksiegowosc.godziny VALUES (8, '2021-03-30', 84, 8); 
INSERT INTO ksiegowosc.godziny VALUES (9, '2021-03-30' , 100, 9); 
INSERT INTO ksiegowosc.godziny VALUES (10, '2021-03-30', 156, 10);

EXEC sp_addextendedproperty 
@name = N'Comment_2',
@value =N'To jest tabela z sumami godzin pracownik�w',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE',  @level1name = 'godziny';
GO


INSERT INTO ksiegowosc.premia VALUES (1, 'nadgodziny', 300);
INSERT INTO ksiegowosc.premia VALUES (2, '�wi�teczna', 200);
INSERT INTO ksiegowosc.premia VALUES (3, 'nocna', 150);
INSERT INTO ksiegowosc.premia VALUES (4, 'nocna', 150);
INSERT INTO ksiegowosc.premia VALUES (5, '�wi�teczna', 200);
INSERT INTO ksiegowosc.premia VALUES (6, '�wi�teczna', 200);
INSERT INTO ksiegowosc.premia VALUES (7, null, null);
INSERT INTO ksiegowosc.premia VALUES (8, null, null);
INSERT INTO ksiegowosc.premia VALUES (9, '�wi�teczna', 200);
INSERT INTO ksiegowosc.premia VALUES (10, 'nadgodziny', 100);

EXEC sp_addextendedproperty 
@name = N'Comment_3',
@value =N'To jest tabela z premiami pracownik�w',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE',  @level1name = 'premia';
GO


INSERT INTO ksiegowosc.pensja VALUES (1, 'kierownik', 5000);
INSERT INTO ksiegowosc.pensja VALUES (2, 'kierownik produkcji', 4000);
INSERT INTO ksiegowosc.pensja VALUES (3, 'sprzedawca', 2500);
INSERT INTO ksiegowosc.pensja VALUES (4, 'sprzedawca', 2400);
INSERT INTO ksiegowosc.pensja VALUES (5, 'asystent kierownika', 2000);
INSERT INTO ksiegowosc.pensja VALUES (6, 'asystent kierownika', 3000);
INSERT INTO ksiegowosc.pensja VALUES (7, 'sta�ysta', 1600);
INSERT INTO ksiegowosc.pensja VALUES (8, 'sta�ysta', 1600);
INSERT INTO ksiegowosc.pensja VALUES (9, 'sprzedwaca', 3000);
INSERT INTO ksiegowosc.pensja VALUES (10, 'sprzedawca', 2100);

EXEC sp_addextendedproperty 
@name = N'Comment_4',
@value =N'To jest tabela z pensjami pracownik�w',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE',  @level1name = 'pensja';
GO



INSERT INTO ksiegowosc.wynagrodzenie VALUES (1, '2021-03-30', 1, 1, 1, 1);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (2, '2021-03-30', 2, 2, 2, 2);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (3, '2021-03-30', 3, 3, 3, 3);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (4, '2021-03-30', 4, 4, 4, 4);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (5, '2021-03-30', 5, 5, 5, 5);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (6, '2021-03-30', 6, 6, 6, 6);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (7, '2021-03-30', 7, 7, 7, 7);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (8, '2021-03-30', 8, 8, 8, 8);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (9, '2021-03-30', 9, 9, 9, 9);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (10, '2021-03-30', 10, 10, 10, 10);

EXEC sp_addextendedproperty 
@name = N'Comment_5',
@value =N'To jest tabela z wynagrodzeniami pracownik�w',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE',  @level1name = 'wynagrodzenie';
GO



--a) Wy�wietl tylko id pracownika oraz jego nazwisko
SELECT ID_pracownika, nazwisko FROM ksiegowosc.pracownicy;

--b) Wy�wietl id pracownik�w, kt�rych p�aca jest wi�ksza ni� 1000
SELECT pracownicy.ID_pracownika, pensja.kwota 
FROM ksiegowosc.pracownicy INNER JOIN(ksiegowosc.pensja INNER JOIN ksiegowosc.wynagrodzenie ON pensja.ID_pensji = wynagrodzenie.ID_pensji) ON pracownicy.ID_pracownika = wynagrodzenie.ID_wynagrodzenia 
WHERE (((pensja.kwota)>1000));

--c) Wy�wietl id pracownik�w nieposiadaj�cych premii,kt�rych p�aca jest wi�ksza ni� 2000.
SELECT pracownicy.ID_pracownika, pensja.kwota, premia.kwota
FROM ksiegowosc.pracownicy INNER JOIN(ksiegowosc.pensja INNER JOIN (ksiegowosc.premia INNER JOIN ksiegowosc.wynagrodzenie ON premia.ID_premii = wynagrodzenie.ID_premii) ON pensja.ID_pensji = wynagrodzenie.ID_pensji) ON pracownicy.ID_pracownika = wynagrodzenie.ID_pracownika 
WHERE (((premia.kwota) is null) AND ((pensja.kwota)>1000));

--d) Wy�wietl pracownik�w, kt�rych pierwsza litera imienia zaczyna si� na liter� �J�.
SELECT * FROM ksiegowosc.pracownicy WHERE pracownicy.imie LIKE 'J%';  

--e) Wy�wietl pracownik�w, kt�rych nazwisko zawiera liter� �n� oraz imi� ko�czy si� na liter� �a�.
SELECT * FROM ksiegowosc.pracownicy WHERE (pracownicy.imie LIKE '%A') AND (pracownicy.nazwisko LIKE '%N%'); 

--f) Wy�wietl imi� i nazwisko pracownik�w oraz liczb� ich nadgodzin, przyjmuj�c, i� standardowy czas pracy to 160 h miesi�cznie.
ALTER TABLE ksiegowosc.godziny ADD nadgodziny INTEGER;
UPDATE ksiegowosc.godziny SET nadgodziny = godziny.liczba_godzin-160;

SELECT * from ksiegowosc.godziny;

SELECT pracownicy.imie, pracownicy.nazwisko, nadgodziny
FROM ksiegowosc.pracownicy INNER JOIN(ksiegowosc.wynagrodzenie INNER JOIN ksiegowosc.godziny ON godziny.ID_godziny = wynagrodzenie.ID_godziny)  ON pracownicy.ID_pracownika = wynagrodzenie.ID_pracownika 
WHERE (((godziny.nadgodziny)>0));


--g) Wy�wietl imi� i nazwisko pracownik�w, kt�rych pensja zawiera si� w przedziale 1500 �3000PLN.
SELECT pracownicy.imie, pracownicy.nazwisko 
FROM ksiegowosc.pracownicy INNER JOIN(ksiegowosc.pensja INNER JOIN ksiegowosc.wynagrodzenie ON pensja.ID_pensji = wynagrodzenie.ID_pensji) ON pracownicy.ID_pracownika = wynagrodzenie.ID_wynagrodzenia 
WHERE (((pensja.kwota)>1500) AND (pensja.kwota)<3000);

--h) Wy�wietl imi� i nazwisko pracownik�w, kt�rzy pracowali w nadgodzinachi nie otrzymali premii.
SELECT pracownicy.imie, pracownicy.nazwisko, godziny.nadgodziny
FROM ksiegowosc.pracownicy INNER JOIN(ksiegowosc.premia INNER JOIN (ksiegowosc.wynagrodzenie INNER JOIN ksiegowosc.godziny ON godziny.ID_godziny = wynagrodzenie.ID_godziny) 
ON premia.ID_premii = wynagrodzenie.ID_premii)  
ON pracownicy.ID_pracownika = wynagrodzenie.ID_pracownika 
WHERE (godziny.nadgodziny>0)
AND (premia.kwota is null);


--i) Uszereguj pracownik�w wed�ug pensji.
SELECT pracownicy.imie, pracownicy.nazwisko, pensja.kwota
FROM ksiegowosc.pracownicy INNER JOIN(ksiegowosc.pensja INNER JOIN (ksiegowosc.wynagrodzenie INNER JOIN ksiegowosc.godziny ON godziny.ID_godziny = wynagrodzenie.ID_godziny) 
ON pensja.ID_pensji = wynagrodzenie.ID_pensji)  
ON pracownicy.ID_pracownika = wynagrodzenie.ID_pracownika 
ORDER BY pensja.kwota;


--j) Uszereguj pracownik�w wed�ug pensji i premii malej�co.
SELECT pracownicy.imie, pracownicy.nazwisko, pensja.kwota, premia.kwota
FROM ksiegowosc.pracownicy INNER JOIN(ksiegowosc.pensja INNER JOIN (ksiegowosc.premia INNER JOIN ksiegowosc.wynagrodzenie ON premia.ID_premii = wynagrodzenie.ID_premii) 
ON pensja.ID_pensji = wynagrodzenie.ID_pensji) 
ON pracownicy.ID_pracownika = wynagrodzenie.ID_pracownika
ORDER BY pensja.kwota DESC, premia.kwota DESC;

--k) Zlicz i pogrupuj pracownik�w wed�ug pola �stanowisko�.
SELECT pensja.stanowisko, count(pensja.stanowisko) as suma
FROM ksiegowosc.pracownicy INNER JOIN(ksiegowosc.pensja INNER JOIN  ksiegowosc.wynagrodzenie  
ON pensja.ID_pensji = wynagrodzenie.ID_pensji) 
ON pracownicy.ID_pracownika = wynagrodzenie.ID_pracownika
GROUP BY pensja.stanowisko;

--l) Policz �redni�, minimaln� i maksymaln� p�ac� dla stanowiska �kierownik� (je�eli takiego nie masz, to przyjmij dowolne inne).
SELECT min(kwota) as minimum, max(kwota) as maximum, avg(kwota) as �rednia
FROM ksiegowosc.pensja 
Group BY pensja.stanowisko
HAVING pensja.stanowisko = 'sprzedawca';

--m) Policz sum� wszystkich wynagrodze�.
SELECT sum(kwota) as suma
FROM ksiegowosc.pensja;

--f) Policz sum� wynagrodze� w ramach danego stanowiska.
SELECT pensja.stanowisko, sum(pensja.kwota) as suma
FROM ksiegowosc.pracownicy 
INNER JOIN(ksiegowosc.pensja 
INNER JOIN  ksiegowosc.wynagrodzenie  
ON pensja.ID_pensji = wynagrodzenie.ID_pensji) 
ON pracownicy.ID_pracownika = wynagrodzenie.ID_pracownika
GROUP BY pensja.stanowisko;

--g) Wyznacz liczb� premii przyznanych dla pracownik�w danego stanowiska.
SELECT pensja.stanowisko, count(premia.ID_premii) as liczba_premii
FROM ksiegowosc.pracownicy 
INNER JOIN(ksiegowosc.pensja 
INNER JOIN (ksiegowosc.premia 
INNER JOIN ksiegowosc.wynagrodzenie 
ON premia.ID_premii = wynagrodzenie.ID_premii) 
ON pensja.ID_pensji = wynagrodzenie.ID_pensji) 
ON pracownicy.ID_pracownika = wynagrodzenie.ID_pracownika
GROUP BY pensja.stanowisko;

--h) Usu� wszystkich pracownik�w maj�cych pensj� mniejsz� ni� 1200 z�.
DELETE ksiegowosc.pracownicy 
FROM ksiegowosc.pracownicy 
INNER JOIN(ksiegowosc.pensja 
INNER JOIN ksiegowosc.wynagrodzenie 
ON pensja.ID_pensji = wynagrodzenie.ID_pensji) 
ON pracownicy.ID_pracownika = wynagrodzenie.ID_wynagrodzenia 
WHERE pensja.kwota<1200;






--______________________________________________________________________________________________________________
--lab6b

--a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodaj�c do niego kierunkowy dla Polski w nawiasie (+48)ALTER TABLE ksiegowosc.pracownicy alter column telefon VARCHAR (20);
update ksiegowosc.pracownicy SET telefon = '(+48)' + telefon;
select * from ksiegowosc.pracownicy;

--b) Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony by� my�lnikami wg wzoru: �555-222-333� 
update ksiegowosc.pracownicy SET telefon = concat(SUBSTRING(telefon,1,8),'-', SUBSTRING(telefon,9,3),'-', SUBSTRING(telefon,12,3));
select * from ksiegowosc.pracownicy;

--c) Wy�wietl dane pracownika, kt�rego nazwisko jest najd�u�sze, u�ywaj�c du�ych liter
select top 1 nazwisko, ID_pracownika, imie, telefon, adres 
from  ksiegowosc.pracownicy
order by len(nazwisko) desc;


--d) Wy�wietl dane pracownik�w i ich pensje zakodowane przy pomocy algorytmu md5 
select HashBytes('MD5', (cast (pensja.kwota as nvarchar(15)))) as pensja_MD5, nazwisko, imie, telefon, adres
from ksiegowosc.pensja
inner join ksiegowosc.wynagrodzenie
inner join ksiegowosc.pracownicy
on wynagrodzenie.ID_pracownika=pracownicy.ID_pracownika
on wynagrodzenie.ID_pensji=pensja.ID_pensji;

--f) Wy�wietl pracownik�w, ich pensje oraz premie. Wykorzystaj z��czenie lewostronne.
select nazwisko, imie, pensja.kwota as pensja, premia.kwota as premia
from ksiegowosc.pracownicy 
left join ksiegowosc.pensja
left join ksiegowosc.premia
left join ksiegowosc.wynagrodzenie
on wynagrodzenie.ID_premii = premia.ID_premii
on wynagrodzenie.ID_pensji=pensja.ID_pensji
on wynagrodzenie.ID_pracownika=pracownicy.ID_pracownika
--g) wygeneruj raport (zapytanie), kt�re zwr�ci w wyniki tre�� wg poni�szego szablonu:
--Pracownik Jan Nowak, w dniu 7.08.2017 otrzyma� pensj� ca�kowit� na kwot� 7540 z�, gdzie 
--wynagrodzenie zasadnicze wynosi�o: 5000 z�, premia: 2000 z�, nadgodziny: 540 z�
SELECT 'Pracownik',pracownicy.imie, 'w dniu', godziny._data,'otrzyma� pensj� ca�kowit� na kwot�:'
, (pensja.kwota + premia.kwota) as wynagrodzenie,
'gdzie wynagrodzenie zasadnicze wynios�o:', 
pensja.kwota,'premia:',premia.kwota, godziny.nadgodziny
FROM ksiegowosc.pracownicy,ksiegowosc.godziny,ksiegowosc.pensja,ksiegowosc.premia,ksiegowosc.wynagrodzenie 
WHERE ksiegowosc.pracownicy.ID_pracownika=ksiegowosc.wynagrodzenie.ID_pracownika 
AND ksiegowosc.wynagrodzenie.ID_pensji=ksiegowosc.pensja.ID_pensji
AND ksiegowosc.premia.ID_premii=ksiegowosc.wynagrodzenie.ID_premii
AND ksiegowosc.godziny.ID_godziny=ksiegowosc.wynagrodzenie.ID_godziny;




