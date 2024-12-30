-- Write your own SQL object definition here, and it'll be included in your package.
INSERT INTO t_zabiegi (
  nazwa,
  cena,
  fk_id_typu
)
VALUES
('masaz_klasyczny', 500, 1),
('masaz_relaksacyjny', 500, 1),
('masaz_goracymi_kamieniami', 600, 1),
('masaz_tkanek_glebokich', 600, 1),
('masaz_shiatsu', 600, 1),
('masaz_tajski', 600, 1),
('masaz_ciazowy', 500, 1),
('masaz_sportowy', 500, 1),
('masaz_czekolada', 700, 1),
('refleksologia', 300, 1),
('radioferencja_mikroiglowa', 500, 2),
('mizoterapia_mikroiglowa', 500, 2),
('oczyszczanie_wodorowe', 500, 2),
('mikrodermabrzja', 500, 2),
('manicure_hybrydowy', 200, 3),
('pedicure_hybrydowy', 200, 4),
('fish_pedicure', 200, 4);