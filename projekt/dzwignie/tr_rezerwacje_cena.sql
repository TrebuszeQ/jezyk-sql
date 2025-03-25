-- Write your own SQL object definition here, and it'll be included in your package.
USE spa;
GO

CREATE TRIGGER tr_rezerwacje_cena
ON t_rezerwacje_lokacje
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE a
    SET cena = FLOOR(a.czas * b.cena_za_godzine)
    FROM t_rezerwacje_lokacje a
    INNER JOIN inserted i
        ON a.id = i.id
    INNER JOIN t_lokacje b
        ON a.fk_nazwa_lokacji = b.nazwa;
END;
GO