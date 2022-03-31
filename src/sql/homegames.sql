CREATE TABLE "homegames" (
    "ID" INTEGER NOT NULL,
    "yearkey" INTEGER NULL,
    "leaguekey" CHARACTER(2) NULL,
    "teamkey" CHARACTER(3) NULL,
    "team_ID" INTEGER NULL,
    "parkkey" VARCHAR(255) NULL,
    "park_ID" INTEGER NULL,
    "spanfirst" VARCHAR(255) NULL,
    "spanlast" VARCHAR(255) NULL,
    "games" INTEGER NULL,
    "openings" INTEGER NULL,
    "attendance" INTEGER NULL,
    PRIMARY KEY ("ID"),
    FOREIGN KEY("team_ID") REFERENCES "teams" ("ID") ON UPDATE NO ACTION ON DELETE NO ACTION,
    FOREIGN KEY("park_ID") REFERENCES "parks" ("ID") ON UPDATE NO ACTION ON DELETE NO ACTION
);