CREATE TABLE "awardsshareplayers" (
    "ID" INTEGER NOT NULL,
    "awardID" VARCHAR(25) NOT NULL,
    "yearID" SMALLINT NOT NULL,
    "lgID" CHARACTER(2) NOT NULL,
    "playerID" VARCHAR(9) NOT NULL,
    "pointsWon" DOUBLE NULL,
    "pointsMax" SMALLINT NULL,
    "votesFirst" DOUBLE NULL,
    PRIMARY KEY ("ID"),
    FOREIGN KEY("playerID") REFERENCES "people" ("playerID") ON UPDATE NO ACTION ON DELETE NO ACTION
);