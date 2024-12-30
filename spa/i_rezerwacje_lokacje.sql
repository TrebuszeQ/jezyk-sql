-- Write your own SQL object definition here, and it'll be included in your package.
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
-- ('laznia_turecka_1', 2, '2024-07-27 10:00:00', 140.00, 'Jan', 'Kowalski', '123456789'),
-- ('sauna_finska_2', 1, '2024-07-27 15:30:00', 70.00, 'Anna', 'Nowak', '987654321'),
-- ('jacuzzi_1', 3, '2024-07-28 18:00:00', 120.00, 'Piotr', 'Wiśniewski', '555123789'),
-- ('kriokomora_1', 1, '2024-07-29 09:00:00', 100.00, 'Ewa', 'Dąbrowska', '600100200'),
-- ('sauna_parowa_1', 2, '2024-07-29 14:00:00', 140.00, 'Andrzej', 'Lewandowski', '700800900'),
-- ('teznia_solankowa_1', 4, '2024-08-01 11:00:00', 120.00, 'Karolina', 'Wójcik', '400500600'),
-- ('sauna_finska_1', 2, '2024-08-02 16:00:00', 140.00, 'Marek', 'Zieliński', '111222333'),
-- ('sauna_mokra_1', 1, '2024-08-03 10:30:00', 70.00, 'Katarzyna', 'Szymańska', '444555666'),
-- ('jacuzzi_2', 2, '2024-08-03 19:00:00', 80.00, 'Tomasz', 'Woźniak', '777888999'),
-- ('sauna_podczerwona_1', 3, '2024-08-04 12:00:00', 210.00, 'Magdalena', 'Kowalczyk', '999000111'),
-- ('laznia_turecka_1', 1, '2024-08-05 09:30:00', 70.00, 'Adam', 'Baran', '222333444'),
-- ('sauna_parowa_2', 2, '2024-08-05 17:30:00', 140.00, 'Natalia', 'Nowicka', '555666777'),
-- ('teznia_solankowa_1', 3, '2024-08-06 14:00:00', 90.00, 'Grzegorz', 'Wróbel', '888999000'),
-- ('kriokomora_1', 1, '2024-08-07 11:00:00', 100.00, 'Patrycja', 'Pawlak', '333444555'),
-- ('sauna_finska_3', 2, '2024-08-07 20:00:00', 140.00, 'Damian', 'Michalski', '666777888'),
-- ('sauna_mokra_2', 1, '2024-08-08 08:00:00', 70.00, 'Kinga', 'Grabowska', '000111222'),
-- ('jacuzzi_1', 3, '2024-08-09 15:00:00', 120.00, 'Szymon', 'Kaczmarek', '123987456'),
-- ('sauna_podczerwona_1', 2, '2024-08-10 10:00:00', 140.00, 'Alicja', 'Rutkowska', '456123789'),
-- ('laznia_turecka_1', 1, '2024-08-10 18:30:00', 70.00, 'Filip', 'Jankowski', '789456123'),
-- ('sauna_parowa_1', 3, '2024-08-11 13:00:00', 210.00, 'Wiktoria', 'Mazur', '987123654'),
-- ('teznia_solankowa_1', 2, '2024-08-12 09:00:00', 60.00, 'Hubert', 'Borkowski', '654789321'),
-- ('kriokomora_1', 1, '2024-08-12 17:00:00', 100.00, 'Julia', 'Sikora', '321987654'),
-- ('sauna_finska_2', 3, '2024-08-13 11:30:00', 210.00, 'Oskar', 'Adamczyk', '741852963'),
-- ('sauna_mokra_1', 2, '2024-08-14 19:30:00', 140.00, 'Zuzanna', 'Czarnecka', '963258741'),
-- ('jacuzzi_2', 1, '2024-08-15 14:30:00', 40.00, 'Jakub', 'Dudek', '147258369'),
-- ('sauna_podczerwona_1', 3, '2024-08-16 08:30:00', 210.00, 'Maja', 'Zając', '369852147'),
-- ('sauna_finska_1', 1, '2024-08-17 16:30:00', 70.00, 'Krystian', 'Pawłowski', '951753852'),
-- ('sauna_mokra_2', 3, '2024-08-18 10:00:00', 210.00, 'Amelia', 'Krawczyk', '852963741'),
-- ('jacuzzi_1', 2, '2024-08-18 18:00:00', 80.00, 'Kacper', 'Stępień', '753159864'),
-- ('sauna_podczerwona_1', 1, '2024-08-19 12:30:00', 70.00, 'Aleksandra', 'Jabłońska', '654258971'),
-- ('laznia_turecka_1', 3, '2024-08-20 09:00:00', 210.00, 'Patryk', 'Malinowski', '555777111'),
-- ('sauna_parowa_2', 1, '2024-08-20 17:00:00', 70.00, 'Emilia', 'Romanowska', '444888222'),
-- ('teznia_solankowa_1', 2, '2024-08-21 14:30:00', 60.00, 'Mateusz', 'Górecki', '333999333'),
-- ('kriokomora_1', 3, '2024-08-22 11:30:00', 300.00, 'Hanna', 'Rutkowski', '222000444'),
-- ('sauna_finska_3', 1, '2024-08-22 20:30:00', 70.00, 'Bartosz', 'Michalak', '111333555'),
-- ('sauna_mokra_1', 2, '2024-08-23 08:30:00', 140.00, 'Laura', 'Lis', '999666777'),
-- ('jacuzzi_2', 3, '2024-08-24 15:30:00', 120.00, 'Wiktor', 'Sadowski', '888555999'),
-- ('sauna_podczerwona_1', 1, '2024-08-25 10:30:00', 70.00, 'Oliwia', 'Kowal', '777444000'),
-- ('laznia_turecka_1', 2, '2024-08-25 19:00:00', 140.00, 'Igor', 'Wiśniewska', '666333111'),
-- ('sauna_parowa_1', 3, '2024-08-26 13:30:00', 210.00, 'Lena', 'Duda', '555222888'),
-- ('teznia_solankowa_1', 1, '2024-08-27 09:30:00', 30.00, 'Marcel', 'Kamiński', '444111999'),
-- ('kriokomora_1', 2, '2024-08-27 17:30:00', 200.00, 'Maria', 'Lewandowska', '333000666'),
-- ('sauna_finska_2', 3, '2024-08-28 12:00:00', 210.00, 'Antoni', 'Zielińska', '222999777'),
-- ('sauna_mokra_2', 1, '2024-08-29 19:30:00', 70.00, 'Zofia', 'Wojciechowska', '111888000'),
-- ('jacuzzi_1', 2, '2024-08-30 15:00:00', 80.00, 'Franciszek', 'Nowakowski', '999777333'),
-- ('sauna_podczerwona_1', 3, '2024-08-31 08:00:00', 210.00, 'Hanna', 'Piotrowska', '888666444'),
-- ('sauna_finska_1', 1, '2024-09-01 17:00:00', 70.00, 'Tymon', 'Kowalczyk', '123789456'),
-- ('sauna_mokra_2', 2, '2024-09-02 11:00:00', 140.00, 'Nadia', 'Szymański', '456987123'),
-- ('jacuzzi_1', 3, '2024-09-02 19:30:00', 120.00, 'Leon', 'Woźniak', '789123654'),
-- ('sauna_podczerwona_1', 1, '2024-09-03 13:00:00', 70.00, 'Pola', 'Dąbrowski', '987456321'),
-- ('laznia_turecka_1', 2, '2024-09-04 10:00:00', 140.00, 'Ignacy', 'Jankowska', '654789231'),
-- ('sauna_parowa_2', 3, '2024-09-04 18:30:00', 210.00, 'Zuzanna', 'Mazur', '321654987'),
-- ('teznia_solankowa_1', 1, '2024-09-05 15:00:00', 30.00, 'Stanisław', 'Borkowski', '159753864'),
-- ('kriokomora_1', 2, '2024-09-06 12:00:00', 200.00, 'Helena', 'Sikorska', '486951732'),
-- ('sauna_finska_3', 3, '2024-09-06 21:00:00', 210.00, 'Borys', 'Adamczak', '714285369'),
-- ('sauna_mokra_1', 1, '2024-09-07 09:00:00', 70.00, 'Liliana', 'Czarnecki', '963852471'),
-- ('jacuzzi_2', 2, '2024-09-08 16:00:00', 80.00, 'Antoni', 'Dudek', '258741963'),
-- ('sauna_podczerwona_1', 3, '2024-09-09 11:00:00', 210.00, 'Marta', 'Zając', '587412369'),
-- ('laznia_turecka_1', 1, '2024-09-09 19:30:00', 70.00, 'Kazimierz', 'Pawłowska', '819637452'),
-- ('sauna_parowa_1', 2, '2024-09-10 14:00:00', 140.00, 'Ida', 'Krawczyk', '369528147'),
-- ('teznia_solankowa_1', 3, '2024-09-11 10:00:00', 90.00, 'Jerzy', 'Stępień', '693258714'),
-- ('kriokomora_1', 1, '2024-09-11 18:00:00', 100.00, 'Lila', 'Jabłoński', '926587314'),
-- ('sauna_finska_2', 2, '2024-09-12 13:30:00', 140.00, 'Witold', 'Malinowska', '259814736'),
-- ('sauna_mokra_2', 3, '2024-09-13 20:00:00', 210.00, 'Agata', 'Romanowski', '582147963'),
-- ('jacuzzi_1', 1, '2024-09-14 16:30:00', 40.00, 'Tadeusz', 'Górecka', '815479623'),
-- ('sauna_podczerwona_1', 2, '2024-09-15 09:30:00', 140.00, 'Klara', 'Rutkowski', '348716952');