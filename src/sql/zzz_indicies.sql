CREATE INDEX "allstarfull_team_ID" ON "allstarfull" ("team_ID");

CREATE INDEX "appearances_playerID" ON "appearances" ("playerID");
CREATE INDEX "appearances_team_ID" ON "appearances" ("team_ID");
CREATE UNIQUE INDEX "appearances_yearID" ON "appearances" ("yearID", "teamID", "playerID");

CREATE UNIQUE INDEX "batting_playerID" ON "batting" ("playerID", "yearID", "stint");
CREATE INDEX "batting_team_ID" ON "batting" ("team_ID");

CREATE INDEX "battingpost_playerID" ON "battingpost" ("playerID");
CREATE INDEX "battingpost_team_ID" ON "battingpost" ("team_ID");
CREATE UNIQUE INDEX "battingpost_yearID" ON "battingpost" ("yearID", "round", "playerID");

CREATE INDEX "collegeplaying_playerID" ON "collegeplaying" ("playerID");
CREATE INDEX "collegeplaying_schoolID" ON "collegeplaying" ("schoolID");

CREATE UNIQUE INDEX "fielding_playerID" ON "fielding" ("playerID", "yearID", "stint", "POS");
CREATE INDEX "fielding_team_ID" ON "fielding" ("team_ID");

CREATE UNIQUE INDEX "fieldingof_playerID" ON "fieldingof" ("playerID", "yearID", "stint");
CREATE UNIQUE INDEX "fieldingofsplit_playerID" ON "fieldingofsplit" ("playerID", "yearID", "stint", "POS");
CREATE INDEX "fieldingofsplit_team_ID" ON "fieldingofsplit" ("team_ID");

CREATE UNIQUE INDEX "fieldingpost_playerID" ON "fieldingpost" ("playerID", "yearID", "round", "POS");
CREATE INDEX "fieldingpost_team_ID" ON "fieldingpost" ("team_ID");

CREATE UNIQUE INDEX "halloffame_playerID" ON "halloffame" ("playerID", "yearid", "votedBy");

CREATE INDEX "homegames_park_ID" ON "homegames" ("park_ID");
CREATE INDEX "homegames_team_ID" ON "homegames" ("team_ID");

CREATE INDEX "managers_playerID" ON "managers" ("playerID");
CREATE INDEX "managers_team_ID" ON "managers" ("team_ID");
CREATE UNIQUE INDEX "managers_yearID" ON "managers" ("yearID", "teamID", "inseason");

CREATE UNIQUE INDEX "managershalf_playerID" ON "managershalf" ("playerID", "yearID", "teamID", "half");
CREATE INDEX "managershalf_team_ID" ON "managershalf" ("team_ID");

CREATE UNIQUE INDEX "pitching_playerID" ON "pitching" ("playerID", "yearID", "stint");
CREATE INDEX "pitching_team_ID" ON "pitching" ("team_ID");

CREATE UNIQUE INDEX "pitchingpost_playerID" ON "pitchingpost" ("playerID", "yearID", "round");
CREATE INDEX "pitchingpost_team_ID" ON "pitchingpost" ("team_ID");

CREATE INDEX "salaries_playerID" ON "salaries" ("playerID");
CREATE INDEX "salaries_team_ID" ON "salaries" ("team_ID");

CREATE INDEX "seriespost_team_IDloser" ON "seriespost" ("team_IDloser");
CREATE INDEX "seriespost_team_IDwinner" ON "seriespost" ("team_IDwinner");
CREATE UNIQUE INDEX "seriespost_yearID" ON "seriespost" ("yearID", "round");

CREATE INDEX "teams_div_ID" ON "teams" ("div_ID");
CREATE INDEX "teams_franchID" ON "teams" ("franchID");

CREATE INDEX "teamshalf_div_ID" ON "teamshalf" ("div_ID");
CREATE INDEX "teamshalf_team_ID" ON "teamshalf" ("team_ID");
