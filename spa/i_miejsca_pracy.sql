-- Write your own SQL object definition here, and it'll be included in your package.
INSERT INTO t_miejsca_pracy(
  miasto,
  ulica,
  numer_domu,
  kod_pocztowy,
  nazwa
)
VALUES
('Gdańsk', 'ul. Krótki Targ', '27', '80-450', 'Biuro'),
('Kraków', 'ul. Floriańska', '15', '31-019', 'Złoty Kwiat'),
('Warszawa', 'Al. Jerozolimskie', '100', '00-807', 'Relaks'),
('Gdańsk', 'ul. Długi Targ', '44', '80-830', 'Morska Bryza');