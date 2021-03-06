CREATE TABLE "allstarfull" (
    "ID" INTEGER NOT NULL,
    "playerID" VARCHAR(9) NOT NULL,
    "yearID" SMALLINT NULL,
    "gameNum" SMALLINT NOT NULL,
    "gameID" VARCHAR(12) NULL,
    "teamID" CHARACTER(3) NULL,
    "team_ID" INTEGER NULL,
    "lgID" CHARACTER(2) NULL,
    "GP" SMALLINT NULL,
    "startingPos" SMALLINT NULL,
    PRIMARY KEY ("ID"),
    FOREIGN KEY("team_ID") REFERENCES "teams" ("ID") ON UPDATE NO ACTION ON DELETE NO ACTION
);