CREATE TABLE "halloffame" (
    "ID" INTEGER NOT NULL,
    "playerID" VARCHAR(10) NOT NULL,
    "yearid" SMALLINT NOT NULL,
    "votedBy" VARCHAR(64) NOT NULL,
    "ballots" SMALLINT NULL,
    "needed" SMALLINT NULL,
    "votes" SMALLINT NULL,
    "inducted" VARCHAR(1) NULL,
    "category" VARCHAR(20) NULL,
    "needed_note" VARCHAR(25) NULL,
    PRIMARY KEY ("ID"),
    FOREIGN KEY("playerID") REFERENCES "people" ("playerID") ON UPDATE NO ACTION ON DELETE NO ACTION
);