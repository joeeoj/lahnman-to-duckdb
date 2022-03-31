CREATE TABLE "awardsmanagers" (
    "ID" INTEGER NOT NULL,
    "playerID" VARCHAR(10) NOT NULL,
    "awardID" VARCHAR(75) NOT NULL,
    "yearID" SMALLINT NOT NULL,
    "lgID" CHARACTER(2) NOT NULL,
    "tie" VARCHAR(1) NULL,
    "notes" VARCHAR(100) NULL,
    PRIMARY KEY ("ID"),
    FOREIGN KEY("playerID") REFERENCES "people" ("playerID") ON UPDATE NO ACTION ON DELETE NO ACTION
);