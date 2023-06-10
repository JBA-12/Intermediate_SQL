--DDL statements to create table TEAMS   (done)
CREATE TABLE teams (
      team CHAR(3) NOT NULL,
  location VARCHAR(20) NOT NULL,
  name VARCHAR(20),
  leag CHAR(1) NOT NULL,
  PRIMARY KEY (team, leag));

--DDL statements to create table COACHES_CAREER   (done)
CREATE TABLE coaches_career (
coachid VARCHAR(7) NOT NULL,
firstname VARCHAR(15),
lastname VARCHAR(15),
season_win INT,
season_loss INT,
playoff_win INT,
playoff_loss INT,
PRIMARY KEY (coachid));

--DDL statements to create table COACHES_SEASON   (done)
CREATE TABLE coaches_season (
  coachid  VARCHAR(7) NOT NULL,
  year INT,
  yr_order INT,
  firstname VARCHAR(15),
  lastname VARCHAR(15),
  season_win INT,
  season_loss INT,
  playoff_win INT,
  playoff_loss INT,
  team CHAR(3),
  PRIMARY KEY (year, coachid, team)
  FOREIGN KEY (team) references teams,
  FOREIGN KEY (coachid, firstname, lastname) references coaches_career);

--DDL statements to create table PLAYERS   (done)
CREATE TABLE players(
ilkid VARCHAR(9) NOT NULL,
firstname VARCHAR(15),
 lastname VARCHAR(15),
position CHAR(1) NOT NULL,
firstseason INT NOT NULL,
lastseason INT NOT NULL,
h_feet INT NOT NULL,
h_inches INT NOT NULL,
weight INT NOT NULL,
college VARCHAR(30),
birthdate CHAR(20),
PRIMARY KEY (ilkid));

--DDL statements to create table PLAYER_PLAYOFFS   (done)
CREATE TABLE player_playoffs(
ilkid VARCHAR(9),
year INT(4),
firstname VARCHAR(15),
lastname VARCHAR(15),
team CHAR(3),
leag CHAR(1),
gp INT,
minutes INT,
pts INT,
dreb INT,
oreb INT,
reb INT,
asts INT,
stl INT,
blk INT,
turnover INT,
pf INT,
fga INT,
fgm INT,
fta INT,
ftm INT,
tpa INT,
tpm INT,
PRIMARY KEY (ilkid, year, leag, pts),
FOREIGN KEY (team, leag) references teams,
FOREIGN KEY (ilkid, firstname, lastname) references players);

--DDL statements to create table PLAYER_PLAYOFFS_CAREER (done)
CREATE TABLE player_playoffs_career(
ilkid VARCHAR(9),
firstname VARCHAR(15),
lastname VARCHAR(15),
leag CHAR(1),
gp INT,
minutes INT,
pts INT,
dreb INT,
oreb INT,
reb INT,
asts INT,
stl INT,
blk INT,
turnover INT,
pf INT,
fga INT,
fgm INT,
fta INT,
ftm INT,
tpa INT,
tpm INT,
PRIMARY KEY (ilkid, pts),
FOREIGN KEY (ilkid, firstname, lastname) references players_playoffs);


--DDL statements to create table PLAYER_REGULAR_SEASON  (done)
CREATE TABLE player_regular_season(
ilkid VARCHAR(9),
year INT(4),
firstname VARCHAR(15),
lastname VARCHAR(15),
team CHAR(3),
leag CHAR(1),
gp INT,
minutes INT,
pts INT,
dreb INT,
oreb INT,
reb INT,
asts INT,
stl INT,
blk INT,
turnover INT,
pf INT,
fga INT,
fgm INT,
fta INT,
ftm INT,
tpa INT,
tpm INT,
PRIMARY KEY (ilkid, year, team, pts));


--DDL statements to create table PLAYER_REGULAR_SEASON_CAREER (done)
CREATE TABLE player_regular_season_career(
ilkid VARCHAR(9),
firstname VARCHAR(15),
lastname VARCHAR(15),
leag CHAR(1),
gp INT,
minutes INT,
pts INT,
dreb INT,
oreb INT,
reb INT,
asts INT,
stl INT,
blk INT,
turnover INT,
pf INT,
fga INT,
fgm INT,
fta INT,
ftm INT,
tpa INT,
tpm INT,
PRIMARY KEY (ilkid, pts),
FOREIGN KEY (ilkid, firstname, lastname) references players_regular_season);