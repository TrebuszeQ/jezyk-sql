-- Write your own SQL object definition here, and it'll be included in your package.
INSERT INTO t_lokale (
  miasto,
  ulica,
  numer_domu,
  kod_pocztowy,
  nazwa
)
VALUES
('Biuro', 'Gdańsk', 'ul. Krótki Targ', '27', '80-450'),
('Złoty Kwiat', 'Kraków', 'ul. Floriańska', '15', '31-019'),
('Relaks', 'Warszawa', 'Al. Jerozolimskie', '100', '00-807'),
('Morska Bryza', 'Gdańsk', 'ul. Długi Targ', '44', '80-830');