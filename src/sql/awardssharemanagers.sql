CREATE TABLE "awardssharemanagers" (
    "ID" INTEGER NOT NULL,
    "awardID" VARCHAR(25) NOT NULL,
    "yearID" SMALLINT NOT NULL,
    "lgID" CHARACTER(2) NOT NULL,
    "playerID" VARCHAR(10) NOT NULL,
    "pointsWon" SMALLINT NULL,
    "pointsMax" SMALLINT NULL,
    "votesFirst" SMALLINT NULL,
    PRIMARY KEY ("ID"),
    FOREIGN KEY("playerID") REFERENCES "people" ("playerID") ON UPDATE NO ACTION ON DELETE NO ACTION
);