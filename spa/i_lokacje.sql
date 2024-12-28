-- Write your own SQL object definition here, and it'll be included in your package.
INSERT INTO t_lokacje (
  nazwa,
  opis,
  srednia_temperatura,
  srednia_wilgotnosc,
  maksymalna_ilosc_osob,
  cena_za_godzine,
  fk_id_typy_lokacji
)
VALUES 
('laznia_turecka_1', NULL, 45, 95, 10, 70, 0),
('sauna_finska_1', NULL, 80, 12, 10, 70, 1),
('sauna_finska_2', NULL, 95, 8, 10, 70, 1),
('sauna_finska_3', NULL, 110, 5, 20, 70, 1),
('sauna_mokra_1', NULL, 55, 35, 10, 70, 2),
('sauna_mokra_2', NULL, 65, 20, 10, 70, 2),
('sauna_parowa_1', NULL, 70, 90, 10, 70, 3),
('sauna_parowa_2', NULL, 90, 95, 10, 70, 3),
('sauna_podczerwona_1', NULL, 50, 20, 6, 70, 4),
('jacuzzi_1', NULL, 38, 60, 6, 40, 5),
('jacuzzi_2', NULL, 38, 60, 4, 40, 5),
('teznia_solankowa_1', NULL, 36, 80, 8, 30, 6),
('kriokomora_1', NULL, -110, 60, 8, 100, 7);
