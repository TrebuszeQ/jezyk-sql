-- Write your own SQL object definition here, and it'll be included in your package.
CREATE TRIGGER TR_rezerwacje_cena
ON t_rezerwacje_lokacje
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE t_rezerwacje_lokacje
    SET CENA = FLOOR(a.czas * b.cena_za_godzine)
    FROM inserted a
    JOIN t_lokacje b
        ON a.fk_nazwa_lokacji = b.nazwa
        WHERE t_rezerwacje_cena.id = a.id;
END;