-- Write your own SQL object definition here, and it'll be included in your package.
INSERT INTO t_zabiegi (
  nazwa,
  cena,
  fk_id_typu
)
VALUES
('masaz_klasyczny', 500, 0),
('masaz_relaksacyjny', 500, 0),
('masaz_goracymi_kamieniami', 600, 0),
('masaz_tkanek_glebokich', 600, 0),
('masaz_shiatsu', 600, 0),
('masaz_tajski', 600, 0),
('masaz_ciazowy', 500, 0),
('masaz_sportowy', 500, 0),
('masaz_czekolada', 700, 0),
('refleksologia', 300, 0),
('radioferencja_mikroiglowa', 500, 1),
('mizoterapia_mikroiglowa', 500, 1),
('oczyszczanie_wodorowe', 500, 1),
('mikrodermabrzja', 500, 1),
('manicure_hybrydowy', 200, 2),
('pedicure_hybrydowy', 200, 3),
('fish_pedicure', 200, 3);