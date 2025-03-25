-- Write your own SQL object definition here, and it'll be included in your package.
USE spa;
INSERT INTO dbo.t_lokale (
  nazwa,
  miasto,
  ulica,
  numer_domu,
  kod_pocztowy
)
VALUES
('Biuro', 'Gdańsk', 'ul. Krótki Targ', '27', '80450'),
('Złoty Kwiat', 'Kraków', 'ul. Floriańska', '15', '31019'),
('Relaks', 'Warszawa', 'Al. Jerozolimskie', '100', '00807'),
('Morska Bryza', 'Gdańsk', 'ul. Długi Targ', '44', '80830');