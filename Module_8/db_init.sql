CREATE USER 'pysports_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Liyanna@2903';

-- grant all privileges to the pysports 
GRANT ALL PRIVILEGES ON pysports.* TO'pysports_user'@'localhost';


-- drop tables if they are present
DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS team;


-- create the team table 
CREATE TABLE team (
    team_id     INT             NOT NULL        AUTO_INCREMENT,
    team_name   VARCHAR(75)     NOT NULL,
    mascot      VARCHAR(75)     NOT NULL,
    PRIMARY KEY(team_id)
); 

-- create the player table and set the foreign key
CREATE TABLE player (
    player_id   INT             NOT NULL        AUTO_INCREMENT,
    first_name  VARCHAR(75)     NOT NULL,
    last_name   VARCHAR(75)     NOT NULL,
    team_id     INT             NOT NULL,
    PRIMARY KEY(player_id),
    CONSTRAINT fk_team 
    FOREIGN KEY(team_id)
        REFERENCES team(team_id)
);


-- insert team records
INSERT INTO team(team_name, mascot)
    VALUES('Team Lion', 'Black');

INSERT INTO team(team_name, mascot)
    VALUES('Team Tiger', 'White');


-- insert player records 
INSERT INTO player(first_name, last_name, team_id) 
    VALUES('Jame', 'bon', (SELECT team_id FROM team WHERE team_name = 'Team Lion'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('john', 'nash', (SELECT team_id FROM team WHERE team_name = 'Team Lion'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('Abdel', 'Naj', (SELECT team_id FROM team WHERE team_name = 'Team Lion'));

INSERT INTO player(first_name, last_name, team_id) 
    VALUES('Sara', 'hite', (SELECT team_id FROM team WHERE team_name = 'Team Tiger'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('gmar', 'ching', (SELECT team_id FROM team WHERE team_name = 'Team Tiger'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('Adele', 'Blidde', (SELECT team_id FROM team WHERE team_name = 'Team Tiger'));