-- Write your own SQL object definition here, and it'll be included in your package.
INSERT INTO t_rezerwacje_zabiegi (
  fk_nazwa_lokalu,
  fk_nazwa_zabiegu,
  czas,
  poczatek_rezerwacji,
  cena,
  imie,
  nazwisko,
  numer_telefonu
)
VALUES 
('Złoty Kwiat', 'masaz_klasyczny', 1, '2024-12-08 10:00:00', 500.00, 'Adam', 'Nowak', '111222333'),
('Relaks', 'masaz_relaksacyjny', 2, '2024-12-08 14:00:00', 500.00, 'Ewa', 'Kowalska', '444555666'),
('Morska Bryza', 'masaz_goracymi_kamieniami', 1, '2024-12-09 11:30:00', 600.00, 'Piotr', 'Wiśniewski', '777888999'),
('Złoty Kwiat', 'masaz_tkanek_glebokich', 2, '2024-12-09 16:00:00', 600.00, 'Anna', 'Dąbrowska', '100200300'),
('Relaks', 'masaz_shiatsu', 1, '2024-12-10 09:00:00', 600.00, 'Jan', 'Lewandowski', '400500600'),
('Morska Bryza', 'masaz_tajski', 2, '2024-12-10 13:30:00', 600.00, 'Maria', 'Wójcik', '700800900'),
('Złoty Kwiat', 'masaz_ciazowy', 1, '2024-12-11 10:30:00', 500.00, 'Barbara', 'Zieliński', '123789456'),
('Relaks', 'masaz_sportowy', 2, '2024-12-11 15:00:00', 500.00, 'Krzysztof', 'Szymańska', '456987123'),
('Morska Bryza', 'masaz_czekolada', 1, '2024-12-12 12:00:00', 700.00, 'Andrzej', 'Woźniak', '789123654'),
('Złoty Kwiat', 'refleksologia', 1, '2024-12-12 17:30:00', 300.00, 'Teresa', 'Kowalczyk', '987456321'),
('Relaks', 'radioferencja_mikroiglowa', 1, '2024-12-13 09:30:00', 500.00, 'Stanisław', 'Baran', '654789231'),
('Morska Bryza', 'mizoterapia_mikroiglowa', 2, '2024-12-13 14:00:00', 500.00, 'Halina', 'Nowicka', '321654987'),
('Złoty Kwiat', 'oczyszczanie_wodorowe', 1, '2024-12-14 11:00:00', 500.00, 'Marek', 'Wróbel', '159753864'),
('Relaks', 'mikrodermabrzja', 1, '2024-12-14 16:30:00', 500.00, 'Danuta', 'Pawlak', '486951732'),
('Morska Bryza', 'manicure_hybrydowy', 1, '2024-12-15 08:00:00', 200.00, 'Wojciech', 'Michalski', '714285369'),
('Złoty Kwiat', 'pedicure_hybrydowy', 1, '2024-12-15 13:00:00', 200.00, 'Grażyna', 'Grabowska', '963852471'),
('Relaks', 'fish_pedicure', 1, '2024-12-16 10:00:00', 200.00, 'Roman', 'Kaczmarek', '258741963'),
('Morska Bryza', 'masaz_klasyczny', 2, '2024-12-16 15:30:00', 500.00, 'Lidia', 'Rutkowska', '587412369'),
('Złoty Kwiat', 'masaz_relaksacyjny', 1, '2024-12-17 12:30:00', 500.00, 'Kazimierz', 'Jankowski', '819637452'),
('Relaks', 'masaz_goracymi_kamieniami', 1, '2024-12-17 17:00:00', 600.00, 'Bożena', 'Mazur', '369528147'),
('Morska Bryza', 'masaz_klasyczny', 1, '2024-12-18 10:00:00', 500.00, 'Grzegorz', 'Wojciechowski', '999111888'),
('Złoty Kwiat', 'masaz_relaksacyjny', 1, '2024-12-18 15:00:00', 500.00, 'Halina', 'Krawczyk', '222777444'),
('Relaks', 'masaz_goracymi_kamieniami', 1, '2024-12-19 11:30:00', 600.00, 'Ireneusz', 'Stępień', '555333999'),
('Morska Bryza', 'masaz_tkanek_glebokich', 1, '2024-12-19 16:00:00', 600.00, 'Jadwiga', 'Jabłońska', '888666222'),
('Złoty Kwiat', 'masaz_shiatsu', 1, '2024-12-20 09:00:00', 600.00, 'Kazimierz', 'Malinowski', '111999555'),
('Relaks', 'masaz_tajski', 1, '2024-12-20 13:30:00', 600.00, 'Lidia', 'Romanowska', '444222888'),
('Morska Bryza', 'masaz_ciazowy', 1, '2024-12-21 10:30:00', 500.00, 'Monika', 'Górecka', '777555111'),
('Złoty Kwiat', 'masaz_sportowy', 1, '2024-12-21 15:00:00', 500.00, 'Norbert', 'Rutkowski', '100888444'),
('Relaks', 'masaz_czekolada', 1, '2024-12-22 12:00:00', 700.00, 'Otylia', 'Michalak', '400111777'),
('Morska Bryza', 'refleksologia', 1, '2024-12-22 17:30:00', 300.00, 'Paweł', 'Lis', '700444111'),
('Złoty Kwiat', 'radioferencja_mikroiglowa', 1, '2024-12-23 09:30:00', 500.00, 'Renata', 'Sadowski', '123555888'),
('Relaks', 'mizoterapia_mikroiglowa', 1, '2024-12-23 14:00:00', 500.00, 'Sylwester', 'Kowal', '456888222'),
('Morska Bryza', 'oczyszczanie_wodorowe', 1, '2024-12-24 11:00:00', 500.00, 'Teresa', 'Wiśniewska', '789222555'),
('Złoty Kwiat', 'mikrodermabrzja', 1, '2024-12-24 16:30:00', 500.00, 'Urszula', 'Duda', '100555999'),
('Relaks', 'manicure_hybrydowy', 1, '2024-12-27 08:00:00', 200.00, 'Wacław', 'Kamiński', '400888333'),
('Morska Bryza', 'pedicure_hybrydowy', 1, '2024-12-27 13:00:00', 200.00, 'Wanda', 'Lewandowska', '700111666'),
('Złoty Kwiat', 'fish_pedicure', 1, '2024-12-28 10:00:00', 200.00, 'Zygmunt', 'Zielińska', '123444999'),
('Relaks', 'masaz_klasyczny', 1, '2024-12-28 15:30:00', 500.00, 'Żaneta', 'Wojciechowska', '456777333'),
('Morska Bryza', 'masaz_relaksacyjny', 1, '2024-12-29 12:30:00', 500.00, 'Adam', 'Nowakowski', '789111666'),
('Złoty Kwiat', 'masaz_ciazowy', 1, '2024-12-29 17:00:00', 500.00, 'Beata', 'Piotrowska', '100444999'),
('Relaks', 'masaz_sportowy', 1, '2024-12-30 10:00:00', 500.00, 'Cezary', 'Kowalczyk', '222555888'),
('Morska Bryza', 'masaz_czekolada', 1, '2024-12-30 15:00:00', 700.00, 'Danuta', 'Szymański', '555888111'),
('Złoty Kwiat', 'refleksologia', 1, '2024-12-31 11:30:00', 300.00, 'Edward', 'Woźniak', '888111444'),
('Relaks', 'radioferencja_mikroiglowa', 1, '2024-12-31 16:00:00', 500.00, 'Felicja', 'Dąbrowski', '111444777'),
('Morska Bryza', 'mizoterapia_mikroiglowa', 1, '2025-01-01 09:00:00', 500.00, 'Grzegorz', 'Jankowski', '444777111'),
('Złoty Kwiat', 'oczyszczanie_wodorowe', 1, '2025-01-01 13:30:00', 500.00, 'Helena', 'Mazur', '777111444'),
('Relaks', 'mikrodermabrzja', 1, '2025-01-02 10:30:00', 500.00, 'Ireneusz', 'Borkowski', '100444777'),
('Morska Bryza', 'manicure_hybrydowy', 1, '2025-01-02 15:00:00', 200.00, 'Jadwiga', 'Sikorska', '400777111'),
('Złoty Kwiat', 'pedicure_hybrydowy', 1, '2025-01-03 12:00:00', 200.00, 'Kazimierz', 'Adamczak', '700111444'),
('Relaks', 'fish_pedicure', 1, '2025-01-03 17:30:00', 200.00, 'Lidia', 'Czarnecki', '123888555'),
('Morska Bryza', 'masaz_klasyczny', 1, '2025-01-04 09:30:00', 500.00, 'Marek', 'Dudek', '456222999'),
('Złoty Kwiat', 'masaz_relaksacyjny', 1, '2025-01-04 14:00:00', 500.00, 'Natalia', 'Zając', '789555333'),
('Relaks', 'masaz_goracymi_kamieniami', 1, '2025-01-05 11:00:00', 600.00, 'Olgierd', 'Pawłowska', '100999666'),
('Morska Bryza', 'masaz_tkanek_glebokich', 1, '2025-01-05 16:30:00', 600.00, 'Paulina', 'Krawczyk', '400333000'),
('Złoty Kwiat', 'masaz_shiatsu', 1, '2025-01-06 08:00:00', 600.00, 'Robert', 'Stępień', '700666333'),
('Relaks', 'masaz_tajski', 1, '2025-01-06 13:00:00', 600.00, 'Sylwia', 'Jabłoński', '123000777'),
('Morska Bryza', 'masaz_ciazowy', 1, '2025-01-07 10:00:00', 500.00, 'Teresa', 'Malinowska', '456333111'),
('Złoty Kwiat', 'masaz_sportowy', 1, '2025-01-07 15:30:00', 500.00, 'Urszula', 'Romanowska', '789666444'),
('Relaks', 'masaz_czekolada', 1, '2025-01-08 12:30:00', 700.00, 'Wacław', 'Górecka', '100111888'),
('Morska Bryza', 'refleksologia', 1, '2025-01-08 17:00:00', 300.00, 'Wiktoria', 'Rutkowski', '400444222'),
('Złoty Kwiat', 'radioferencja_mikroiglowa', 1, '2025-01-09 10:00:00', 500.00, 'Xawery', 'Michalak', '700777555'),
('Relaks', 'mizoterapia_mikroiglowa', 1, '2025-01-09 15:00:00', 500.00, 'Ywona', 'Lis', '123111888'),
('Morska Bryza', 'oczyszczanie_wodorowe', 1, '2025-01-10 11:30:00', 500.00, 'Zygmunt', 'Sadowski', '456444222'),
('Złoty Kwiat', 'mikrodermabrzja', 1, '2025-01-10 16:00:00', 500.00, 'Amelia', 'Kowal', '789777555'),
('Relaks', 'manicure_hybrydowy', 1, '2025-01-11 09:00:00', 200.00, 'Bartosz', 'Wiśniewska', '100000888'),
('Morska Bryza', 'pedicure_hybrydowy', 1, '2025-01-11 13:30:00', 200.00, 'Celina', 'Duda', '400333222'),
('Złoty Kwiat', 'fish_pedicure', 1, '2025-01-12 10:30:00', 200.00, 'Dominik', 'Kamiński', '700666555'),
('Relaks', 'masaz_klasyczny', 1, '2025-01-12 15:00:00', 500.00, 'Eliza', 'Lewandowska', '123999888'),
('Morska Bryza', 'masaz_relaksacyjny', 1, '2025-01-13 12:00:00', 500.00, 'Filip', 'Zielińska', '456222111'),
('Złoty Kwiat', 'masaz_goracymi_kamieniami', 1, '2025-01-13 17:30:00', 600.00, 'Gabriela', 'Wojciechowska', '789555444'),
('Relaks', 'masaz_tkanek_glebokich', 1, '2025-01-14 09:30:00', 600.00, 'Hubert', 'Nowakowski', '100888777'),
('Morska Bryza', 'masaz_shiatsu', 1, '2025-01-14 14:00:00', 600.00, 'Idalia', 'Piotrowska', '400111000'),
('Złoty Kwiat', 'masaz_tajski', 1, '2025-01-15 11:00:00', 600.00, 'Jerzy', 'Kowalczyk', '700444333'),
('Relaks', 'masaz_ciazowy', 1, '2025-01-15 16:30:00', 500.00, 'Kamila', 'Szymański', '123777666'),
('Morska Bryza', 'masaz_sportowy', 1, '2025-01-16 08:00:00', 500.00, 'Leon', 'Woźniak', '456000999'),
('Złoty Kwiat', 'masaz_czekolada', 1, '2025-01-16 13:00:00', 700.00, 'Magdalena', 'Dąbrowski', '789333222'),
('Relaks', 'refleksologia', 1, '2025-01-17 10:00:00', 300.00, 'Norbert', 'Jankowski', '100666555'),
('Morska Bryza', 'radioferencja_mikroiglowa', 1, '2025-01-17 15:30:00', 500.00, 'Oliwia', 'Mazur', '400999888'),
('Złoty Kwiat', 'mizoterapia_mikroiglowa', 1, '2025-01-18 12:30:00', 500.00, 'Patryk', 'Borkowski', '700222111'),
('Relaks', 'oczyszczanie_wodorowe', 1, '2025-01-18 17:00:00', 500.00, 'Renata', 'Sikorska', '123555444'),
('Morska Bryza', 'mikrodermabrzja', 1, '2025-01-19 10:00:00', 500.00, 'Seweryn', 'Adamczak', '456888777'),
('Złoty Kwiat', 'manicure_hybrydowy', 1, '2025-01-19 15:00:00', 200.00, 'Teresa', 'Czarnecki', '789111000'),
('Relaks', 'pedicure_hybrydowy', 1, '2025-01-20 11:30:00', 200.00, 'Urszula', 'Dudek', '100444333'),
('Morska Bryza', 'fish_pedicure', 1, '2025-01-20 16:00:00', 200.00, 'Wacław', 'Lis', '400777666'),
('Złoty Kwiat', 'masaz_klasyczny', 1, '2025-01-21 09:00:00', 500.00, 'Wiktoria', 'Sadowski', '700000999'),
('Relaks', 'masaz_relaksacyjny', 1, '2025-01-21 13:30:00', 500.00, 'Xawery', 'Kowal', '123333666'),
('Morska Bryza', 'masaz_goracymi_kamieniami', 1, '2025-01-22 10:30:00', 600.00, 'Ywona', 'Wiśniewska', '456666000'),
('Złoty Kwiat', 'masaz_tkanek_glebokich', 1, '2025-01-22 15:00:00', 600.00, 'Zygmunt', 'Duda', '789999333'),
('Relaks', 'masaz_shiatsu', 1, '2025-01-23 12:00:00', 600.00, 'Adam', 'Kamiński', '100222555'),
('Morska Bryza', 'masaz_tajski', 1, '2025-01-23 17:30:00', 600.00, 'Beata', 'Lewandowska', '400555888'),
('Złoty Kwiat', 'masaz_ciazowy', 1, '2025-01-24 09:30:00', 500.00, 'Celina', 'Zielińska', '700888222'),
('Relaks', 'masaz_sportowy', 1, '2025-01-24 14:00:00', 500.00, 'Dominik', 'Wojciechowska', '123111555'),
('Morska Bryza', 'masaz_czekolada', 1, '2025-01-25 11:00:00', 700.00, 'Eliza', 'Nowakowski', '456444888'),
('Złoty Kwiat', 'refleksologia', 1, '2025-01-25 16:30:00', 300.00, 'Filip', 'Piotrowska', '789777111'),
('Relaks', 'radioferencja_mikroiglowa', 1, '2025-01-26 08:00:00', 500.00, 'Gabriela', 'Kowalczyk', '100000444'),
('Morska Bryza', 'mizoterapia_mikroiglowa', 1, '2025-01-26 13:00:00', 500.00, 'Hubert', 'Szymański', '400333777'),
('Złoty Kwiat', 'oczyszczanie_wodorowe', 1, '2025-01-27 10:00:00', 500.00, 'Idalia', 'Woźniak', '700666000'),
('Relaks', 'mikrodermabrzja', 1, '2025-01-27 15:30:00', 500.00, 'Jerzy', 'Dąbrowski', '123999333'),
('Morska Bryza', 'manicure_hybrydowy', 1, '2025-01-28 12:30:00', 200.00, 'Kamila', 'Jankowski', '456222666'),
('Złoty Kwiat', 'pedicure_hybrydowy', 1, '2025-01-28 17:00:00', 200.00, 'Leon', 'Mazur', '789555999')