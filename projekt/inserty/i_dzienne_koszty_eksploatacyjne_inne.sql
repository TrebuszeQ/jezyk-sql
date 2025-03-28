-- Write your own SQL object definition here, and it'll be included in your package.
USE spa;
INSERT INTO t_dzienne_koszty_eksploatacyjne_inne (
    id_faktury,
    fk_nazwa_lokalu,
    koszt,
    data_czas
)
VALUES 
('F0001', 'Biuro', 450.00, '2024-09-16 09:00:00'),
('F0002', 'Złoty Kwiat', 125.50, '2024-09-17 13:30:00'),
('F0003', 'Relaks', 580.75, '2024-09-18 08:15:00'),
('F0004', 'Morska Bryza', 650.00, '2024-09-16 17:45:00'),
('F0005', 'Biuro', 275.20, '2024-09-17 10:00:00'),
('F0006', 'Złoty Kwiat', 399.99, '2024-09-18 15:20:00'),
('F0007', 'Relaks', 50.00, '2024-09-16 07:00:00'),
('F0008', 'Morska Bryza', 110.50, '2024-09-17 18:00:00'),
('F0009', 'Biuro', 500.01, '2024-09-18 11:30:00'),
('F0010', 'Złoty Kwiat', 225.00, '2024-09-16 14:45:00'),
('F0011', 'Relaks', 675.00, '2024-09-17 06:00:00'),
('F0012', 'Morska Bryza', 350.00, '2024-09-18 19:00:00'),
('F0013', 'Biuro', 10.00, '2024-09-16 08:30:00'),
('F0014', 'Złoty Kwiat', 490.00, '2024-09-17 15:00:00'),
('F0015', 'Relaks', 210.00, '2024-09-18 10:45:00'),
('F0016', 'Morska Bryza', 50.00, '2024-09-16 12:00:00'),
('F0017', 'Biuro', 320.00, '2024-09-17 07:30:00'),
('F0018', 'Złoty Kwiat', 680.00, '2024-09-18 16:15:00'),
('F0019', 'Relaks', 90.00, '2024-09-16 20:00:00'),
('F0020', 'Morska Bryza', 420.00, '2024-09-17 09:30:00'),
('F0021', 'Relaks', 333.33, '2024-09-17 12:45:00'),
('F0022', 'Morska Bryza', 199.99, '2024-09-18 07:30:00'),
('F0023', 'Biuro', 555.55, '2024-09-16 16:15:00'),
('F0024', 'Złoty Kwiat', 70.00, '2024-09-17 09:15:00'),
('F0025', 'Relaks', 280.00, '2024-09-18 14:00:00'),
('F0026', 'Morska Bryza', 610.00, '2024-09-16 11:30:00'),
('F0027', 'Biuro', 415.00, '2024-09-17 17:45:00'),
('F0028', 'Złoty Kwiat', 160.00, '2024-09-18 06:45:00'),
('F0029', 'Relaks', 590.00, '2024-09-16 19:00:00'),
('F0030', 'Morska Bryza', 30.00, '2024-09-17 11:00:00'),
('F0031', 'Biuro', 690.00, '2024-09-18 18:30:00'),
('F0032', 'Złoty Kwiat', 240.00, '2024-09-16 06:00:00'),
('F0033', 'Relaks', 130.00, '2024-09-17 15:15:00'),
('F0034', 'Morska Bryza', 470.00, '2024-09-18 09:45:00'),
('F0035', 'Biuro', 700.00, '2024-09-16 13:30:00'),
('F0036', 'Złoty Kwiat', 85.00, '2024-09-17 08:00:00'),
('F0037', 'Relaks', 360.00, '2024-09-18 12:15:00'),
('F0038', 'Morska Bryza', 520.00, '2024-09-16 22:00:00'),
('F0039', 'Biuro', 190.00, '2024-09-17 05:30:00'),
('F0040', 'Złoty Kwiat', 630.00, '2024-09-18 17:00:00');