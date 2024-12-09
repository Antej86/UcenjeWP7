insert into Organizacija
(naziv, datum_kreacije, ime_foundera, drzava) values
('UFC', '1993-11-12', 'Art Davie', 'United States');

insert into Organizacija(naziv, datum_kreacije, ime_foundera, drzava) values
('ONE Championship', '2011-01-01', 'Chatri Sityodtong', 'Singapore'),

('Belator', '2008-07-11', 'Bjorn Rebney', 'United States'),

('K1', '1993-05-03', 'Kazuyoshi	Ishii', 'Japan');

insert into Klub
(naziv, osnovan, predsjednik, drzava, organizacija)  values
('American Top Team', '2001-03-03', 'Dan Lambert', 'United States',1),
('Evolve MMA', '2008-12-07', 'Chatri Sityodtong', 'Singapore',2),
('Jackson Wink MMA Academy', '2006-07-01', 'Greg Jackson','United States',3),
('Team K1', '1993-05-03', 'Kazuyoshi Ishii', 'Japan',4);

Insert into Borac
(ime,prezime,datum_rođenja,vještina,rekord,klub)