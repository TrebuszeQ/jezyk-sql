-- Write your own SQL object definition here, and it'll be included in your package.
USE spa;
INSERT INTO t_rezerwacje_lokacje (
    fk_nazwa_lokacji,
    czas,
    poczatek_rezerwacji,
    cena,
    imie,
    nazwisko,
    numer_telefonu
)
VALUES
('laznia_turecka_1', 2, '2024-09-16 10:00:00', 140.00, 'Jan', 'Kowalski', '123456789'),
('laznia_turecka_2', 1, '2024-09-16 15:30:00', 70.00, 'Anna', 'Nowak', '987654321'),
('laznia_turecka_3', 3, '2024-09-16 18:00:00', 210.00, 'Piotr', 'Wiśniewski', '555123789'),
('sauna_finska_1', 1, '2024-09-16 09:00:00', 70.00, 'Ewa', 'Dąbrowska', '600100200'),
('sauna_finska_2', 2, '2024-09-16 14:00:00', 140.00, 'Andrzej', 'Lewandowski', '700800900'),
('sauna_finska_3', 3, '2024-09-16 11:00:00', 210.00, 'Karolina', 'Wójcik', '400500600'),
('sauna_finska_4', 1, '2024-09-16 16:00:00', 70.00, 'Marek', 'Zieliński', '111222333'),
('sauna_finska_5', 2, '2024-09-16 10:30:00', 140.00, 'Katarzyna', 'Szymańska', '444555666'),
('sauna_finska_6', 3, '2024-09-16 19:00:00', 210.00, 'Tomasz', 'Woźniak', '777888999'),
('sauna_mokra_1', 1, '2024-09-16 12:00:00', 70.00, 'Magdalena', 'Kowalczyk', '999000111'),
('sauna_mokra_2', 2, '2024-09-16 09:30:00', 140.00, 'Adam', 'Baran', '222333444'),
('sauna_mokra_3', 3, '2024-09-16 17:30:00', 210.00, 'Natalia', 'Nowicka', '555666777'),
('sauna_mokra_4', 1, '2024-09-16 14:00:00', 70.00, 'Grzegorz', 'Wróbel', '888999000'),
('sauna_mokra_5', 2, '2024-09-16 11:00:00', 140.00, 'Patrycja', 'Pawlak', '333444555'),
('sauna_parowa_1', 3, '2024-09-16 20:00:00', 210.00, 'Damian', 'Michalski', '666777888'),
('sauna_parowa_2', 1, '2024-09-16 08:00:00', 70.00, 'Kinga', 'Grabowska', '000111222'),
('sauna_parowa_3', 2, '2024-09-16 15:00:00', 140.00, 'Szymon', 'Kaczmarek', '123987456'),
('sauna_parowa_4', 3, '2024-09-16 10:00:00', 210.00, 'Alicja', 'Rutkowska', '456123789'),
('sauna_parowa_5', 1, '2024-09-16 18:30:00', 70.00, 'Filip', 'Jankowski', '789456123'),
('sauna_podczerwona_1', 2, '2024-09-16 13:00:00', 140.00, 'Wiktoria', 'Mazur', '987123654'),
('jacuzzi_1', 3, '2024-09-16 09:00:00', 120.00, 'Hubert', 'Borkowski', '654789321'),
('jacuzzi_2', 1, '2024-09-16 17:00:00', 40.00, 'Julia', 'Sikora', '321987654'),
('jacuzzi_3', 2, '2024-09-16 11:30:00', 80.00, 'Oskar', 'Adamczyk', '741852963'),
('jacuzzi_4', 3, '2024-09-16 19:30:00', 120.00, 'Zuzanna', 'Czarnecka', '963258741'),
('jacuzzi_5', 1, '2024-09-16 14:30:00', 40.00, 'Jakub', 'Dudek', '147258369'),
('teznia_solankowa_1', 2, '2024-09-16 08:30:00', 60.00, 'Maja', 'Zając', '369852147'),
('teznia_solankowa_2', 3, '2024-09-16 16:30:00', 90.00, 'Krystian', 'Pawłowski', '951753852'),
('teznia_solankowa_3', 1, '2024-09-17 10:00:00', 30.00, 'Amelia', 'Krawczyk', '852963741'),
('teznia_solankowa_4', 2, '2024-09-17 18:00:00', 60.00, 'Kacper', 'Stępień', '753159864'),
('kriokomora_1', 3, '2024-09-17 12:30:00', 300.00, 'Aleksandra', 'Jabłońska', '654258971'),
('kriokomora_2', 1, '2024-09-17 09:00:00', 100.00, 'Patryk', 'Malinowski', '555777111'),
('kriokomora_3', 2, '2024-09-17 17:00:00', 200.00, 'Emilia', 'Romanowska', '444888222'),
('laznia_turecka_1', 1, '2024-09-17 11:00:00', 70.00, 'Bożena', 'Lisowska', '741258963'),
('laznia_turecka_2', 1, '2024-09-17 16:00:00', 70.00, 'Dariusz', 'Kaczmarek', '963147852'),
('laznia_turecka_3', 1, '2024-09-17 09:30:00', 70.00, 'Renata', 'Rutkowski', '258963147'),
('sauna_finska_1', 1, '2024-09-17 14:30:00', 70.00, 'Czesław', 'Jankowski', '589632147'),
('sauna_finska_2', 1, '2024-09-17 19:00:00', 70.00, 'Elżbieta', 'Mazur', '814759632'),
('sauna_finska_3', 1, '2024-09-17 12:00:00', 70.00, 'Henryk', 'Borkowski', '369528417'),
('sauna_finska_4', 1, '2024-09-17 17:30:00', 70.00, 'Irena', 'Sikorska', '692851743'),
('sauna_finska_5', 1, '2024-09-17 10:30:00', 70.00, 'Janusz', 'Adamczak', '925184673'),
('sauna_finska_6', 1, '2024-09-17 15:30:00', 70.00, 'Grażyna', 'Czarnecki', '158479362'),
('sauna_mokra_1', 1, '2024-09-17 20:00:00', 70.00, 'Kazimierz', 'Dudek', '481753962'),
('sauna_mokra_2', 1, '2024-09-17 08:30:00', 70.00, 'Lidia', 'Zając', '714962853'),
('sauna_mokra_3', 1, '2024-09-17 13:30:00', 70.00, 'Mirosław', 'Pawłowska', '963258147'),
('sauna_mokra_4', 1, '2024-09-17 18:00:00', 70.00, 'Nina', 'Krawczyk', '258963471'),
('sauna_mokra_5', 1, '2024-09-17 11:30:00', 70.00, 'Olgierd', 'Stępień', '581479263'),
('sauna_parowa_1', 1, '2024-09-18 16:30:00', 70.00, 'Paulina', 'Jabłoński', '817459362'),
('sauna_parowa_2', 1, '2024-09-18 09:00:00', 70.00, 'Robert', 'Malinowska', '369852714'),
('sauna_parowa_3', 1, '2024-09-18 14:00:00', 70.00, 'Sylwia', 'Romanowski', '692581473'),
('sauna_parowa_4', 1, '2024-09-18 19:30:00', 70.00, 'Tadeusz', 'Górecka', '925817364'),
('sauna_parowa_5', 1, '2024-09-18 12:30:00', 70.00, 'Urszula', 'Rutkowski', '158749632'),
('sauna_podczerwona_1', 1, '2024-09-18 17:00:00', 70.00, 'Wacław', 'Michalak', '481963257'),
('jacuzzi_1', 2, '2024-09-18 10:00:00', 80.00, 'Kornelia', 'Lis', '741852963'),
('jacuzzi_2', 1, '2024-09-18 15:00:00', 40.00, 'Ludwik', 'Sadowski', '963741852'),
('jacuzzi_3', 3, '2024-09-18 19:30:00', 120.00, 'Marianna', 'Kowal', '258963147'),
('jacuzzi_4', 1, '2024-09-18 12:00:00', 40.00, 'Nikodem', 'Wiśniewska', '589632741'),
('jacuzzi_5', 2, '2024-09-18 17:30:00', 80.00, 'Otylia', 'Duda', '814759632'),
('teznia_solankowa_1', 3, '2024-09-18 10:30:00', 90.00, 'Patryk', 'Kamiński', '369528417'),
('teznia_solankowa_2', 1, '2024-09-18 15:30:00', 30.00, 'Regina', 'Lewandowska', '692851743'),
('teznia_solankowa_3', 2, '2024-09-18 20:00:00', 60.00, 'Seweryn', 'Zielińska', '925184673'),
('teznia_solankowa_4', 1, '2024-09-18 08:30:00', 30.00, 'Teresa', 'Wojciechowska', '158479362'),
('kriokomora_1', 3, '2024-09-18 13:30:00', 300.00, 'Walenty', 'Nowakowski', '481753962'),
('kriokomora_2', 1, '2024-09-18 18:00:00', 100.00, 'Wiktoria', 'Piotrowska', '714962853'),
('kriokomora_3', 2, '2024-09-18 11:30:00', 200.00, 'Xawery', 'Kowalczyk', '963258147'),
('laznia_turecka_1', 1, '2024-09-18 16:30:00', 70.00, 'Ywona', 'Szymański', '258963471'),
('sauna_finska_1', 3, '2024-09-18 09:00:00', 210.00, 'Zygmunt', 'Woźniak', '581479263'),
('sauna_mokra_1', 2, '2024-09-18 14:00:00', 140.00, 'Amelia', 'Dąbrowski', '817459362'),
('sauna_parowa_1', 1, '2024-09-18 19:30:00', 70.00, 'Bruno', 'Jankowska', '369852714'),
('sauna_podczerwona_1', 3, '2024-09-18 12:30:00', 210.00, 'Celina', 'Mazur', '692581473'),
('jacuzzi_1', 2, '2024-09-18 17:00:00', 80.00, 'Daniel', 'Borkowski', '925817364'),
('teznia_solankowa_1', 1, '2024-09-18 10:30:00', 30.00, 'Emilia', 'Sikorska', '158749632'),
('kriokomora_1', 3, '2024-09-18 15:30:00', 300.00, 'Fabian', 'Adamczak', '481963257'),
('laznia_turecka_2', 2, '2024-09-18 18:00:00', 140.00, 'Gertruda', 'Czarnecki', '714852963'),
('sauna_finska_2', 1, '2024-09-18 11:30:00', 70.00, 'Hubert', 'Dudek', '963147852'),
('sauna_mokra_2', 3, '2024-09-18 16:30:00', 210.00, 'Izabela', 'Zając', '258796314'),
('sauna_parowa_2', 2, '2024-09-18 09:00:00', 140.00, 'Jerzy', 'Pawłowska', '589632147'),
('sauna_podczerwona_1', 1, '2024-09-18 14:00:00', 70.00, 'Krystyna', 'Krawczyk', '814759632'),
('jacuzzi_2', 3, '2024-09-18 19:30:00', 120.00, 'Lech', 'Stępień', '369528417'),
('teznia_solankowa_2', 2, '2024-09-18 12:30:00', 60.00, 'Magdalena', 'Jabłoński', '692851743'),
('kriokomora_2', 1, '2024-09-18 17:00:00', 100.00, 'Norbert', 'Malinowska', '925184673'),
('laznia_turecka_3', 3, '2024-09-18 10:30:00', 210.00, 'Oliwia', 'Romanowski', '158479362'),
('sauna_finska_3', 2, '2024-09-18 15:30:00', 140.00, 'Piotr', 'Górecka', '481753962'),
('sauna_mokra_3', 1, '2024-09-18 20:00:00', 70.00, 'Renata', 'Rutkowski', '714962853'),
('sauna_parowa_3', 3, '2024-09-18 08:30:00', 210.00, 'Stanisław', 'Michalak', '963258147'),
('sauna_podczerwona_1', 2, '2024-09-18 13:30:00', 140.00, 'Teresa', 'Lis', '258963471'),
('jacuzzi_3', 1, '2024-09-18 18:00:00', 40.00, 'Urszula', 'Sadowski', '581479263'),
('teznia_solankowa_3', 3, '2024-09-18 11:30:00', 90.00, 'Wacław', 'Kowal', '817459362'),
('kriokomora_3', 2, '2024-09-18 16:30:00', 200.00, 'Wiktoria', 'Wiśniewska', '369852714'),
('laznia_turecka_1', 1, '2024-09-18 09:00:00', 70.00, 'Xawery', 'Duda', '692581473'),
('sauna_finska_1', 3, '2024-09-18 14:00:00', 210.00, 'Ywona', 'Kamiński', '925817364'),
('sauna_mokra_1', 2, '2024-09-18 19:30:00', 140.00, 'Zygmunt', 'Lewandowska', '158749632'),
('sauna_parowa_1', 1, '2024-09-18 12:30:00', 70.00, 'Amelia', 'Zielińska', '481963257');