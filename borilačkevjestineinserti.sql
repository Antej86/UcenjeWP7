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
(ime, prezime,datum_rođenja ,vještina ,rekord, klub) values

INSERT INTO Borac (ime, prezime, datum_rođenja, vještina, rekord, klub)
VALUES
('Dustin', 'Poirier', '1989-01-19', 'MMA, Boxing, Brazilian Jiu-Jitsu', '29–8 (1 NC)',1),
('Amanda', 'Nunes', '1988-05-30', 'Brazilian Jiu-Jitsu, Boxing, Muay Thai, MMA', '23–5',1),
('Angela', 'Lee', '1996-07-08', 'Brazilian Jiu-Jitsu, MMA, Muay Thai, Wrestling', '11–3',2),
('Eddie', 'Alvarez', '1984-01-11', 'Brazilian Jiu-Jitsu, Boxing, Wrestling', '31–8 (1 NC)',2),
('Patricio', 'Pitbull', '1987-01-07', 'Brazilian Jiu-Jitsu, Boxing, MMA', '34–6',3),
('Holly', 'Holm', '1981-10-17', 'Boxing, Kickboxing, Brazilian Jiu-Jitsu, MMA', '15–6',3),
('Giorgio', 'Petrosyan', '1985-06-10', 'Kickboxing, Muay Thai', '105–3–2',4),
('Andy', 'Souwer', '1981-08-20', 'Kickboxing, Muay Thai', '164–19–1',4);

Insert into Trener (ime, prezime, klub, nacionalnost, iskustvo) values

INSERT INTO Trainers (ime, prezime, klub, nacionalnost, iskustvo)
VALUES
-- American Top Team (ATT)
('Mike', 'Brown', 1, 'USA', 'Former UFC fighter, Head Coach, 20+ years coaching experience'),
('Krzysztof', 'Kryzstof', 1, 'Poland', 'Muay Thai and Boxing Coach, 15+ years experience'),

-- Evolve MMA
('Chatri', 'Sityodtong', 2, 'Thailand', 'Founder of Evolve MMA, Muay Thai and BJJ Coach, 20+ years experience'),
('Sammy', 'Adebayo', 2, 'Singapore', 'BJJ and MMA coach, 10+ years experience'),

-- Jackson Wink MMA Academy
('Greg', 'Jackson', 3, 'USA', 'MMA coach, 25+ years experience, renowned strategist'),
('Mike', 'Winkeljohn', 3, 'USA', 'MMA coach, 20+ years experience, striking specialist'),

-- Team K-1
('Kazuyoshi', 'Ishii', 4, 'Japan', 'Founder of K-1, kickboxing legend, 30+ years experience'),
('Tatsuya', 'Koyama', 4, 'Japan', 'Head Muay Thai Coach, 20+ years experience');
