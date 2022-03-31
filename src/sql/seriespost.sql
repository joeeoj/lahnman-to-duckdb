CREATE TABLE "seriespost" (
    "ID" INTEGER NOT NULL,
    "yearID" SMALLINT NOT NULL,
    "round" VARCHAR(5) NOT NULL,
    "teamIDwinner" VARCHAR(3) NULL,
    "lgIDwinner" VARCHAR(2) NULL,
    "team_IDwinner" INTEGER NULL,
    "teamIDloser" VARCHAR(3) NULL,
    "team_IDloser" INTEGER NULL,
    "lgIDloser" VARCHAR(2) NULL,
    "wins" SMALLINT NULL,
    "losses" SMALLINT NULL,
    "ties" SMALLINT NULL,
    PRIMARY KEY ("ID"),
    FOREIGN KEY("team_IDwinner") REFERENCES "teams" ("ID") ON UPDATE NO ACTION ON DELETE NO ACTION,
    FOREIGN KEY("team_IDloser") REFERENCES "teams" ("ID") ON UPDATE NO ACTION ON DELETE NO ACTION
);