CREATE TABLE "TABLE_PR_NUJD" 
(
  "ID"	INTEGER NOT NULL,
  "NAME_PR"	CHAR(255) CHARACTER SET WIN1251 NOT NULL,
  "ADRES"	CHAR(255) CHARACTER SET WIN1251 NOT NULL,
  "RAION"	CHAR(255) CHARACTER SET WIN1251 NOT NULL,
   CONSTRAINT "PK_1" PRIMARY KEY ("ID")
);

CREATE TABLE "TABLE_PR_MUS" 
(
  "ID"	INTEGER NOT NULL,
  "NAME_PR"	CHAR(200) CHARACTER SET WIN1251 NOT NULL,
  "CENA_M3"	FLOAT NOT NULL,
  CONSTRAINT "AK_302" UNIQUE ("NAME_PR"),
  CONSTRAINT "PK_104" PRIMARY KEY ("ID")
);

CREATE TABLE "TABLE_FIO" 
(
  "ID"	INTEGER NOT NULL,
  "KOD_PR"	INTEGER NOT NULL,
  "FIORUC"	CHAR(255) CHARACTER SET WIN1251 NOT NULL,
   CONSTRAINT "AK_300" UNIQUE ("KOD_PR"),
   CONSTRAINT "PK_101" PRIMARY KEY ("ID")
);
ALTER TABLE "TABLE_FIO" ADD CONSTRAINT "FK_201" 
  FOREIGN KEY ("KOD_PR") REFERENCES TABLE_PR_NUJD ("ID");
COMMIT;

CREATE TABLE "TABLE_FACT" 
(
  "ID"	INTEGER NOT NULL,
  "ID1"	INTEGER NOT NULL,
  "GOD"	INTEGER NOT NULL,
  "FLAG"	BOOLEAN DEFAULT false NOT NULL,
  "V"	INTEGER NOT NULL,
   CONSTRAINT "PK_100" PRIMARY KEY ("ID")
);
ALTER TABLE "TABLE_FACT" ADD CONSTRAINT "FK_200" 
  FOREIGN KEY ("ID1") REFERENCES TABLE_PR_NUJD ("ID");
COMMIT;

CREATE TABLE "TABLE_TEC" 
(
  "ID"	INTEGER NOT NULL,
  "ID1"	INTEGER NOT NULL,
  "ID2"	INTEGER NOT NULL,
  "KOL_M3"	INTEGER NOT NULL,
  "CHISLO"	INTEGER NOT NULL,
  "MESAC"	INTEGER NOT NULL,
  "GOD"	INTEGER NOT NULL,
  "KOL_M3_ZAPL"	INTEGER NOT NULL,
   CONSTRAINT "PK_102" PRIMARY KEY ("ID")
);
ALTER TABLE "TABLE_TEC" ADD CONSTRAINT "FK_202" FOREIGN KEY ("ID1")     
  REFERENCES TABLE_PR_MUS ("ID");
ALTER TABLE "TABLE_TEC" ADD CONSTRAINT "FK_203" FOREIGN KEY ("ID2") 
  REFERENCES TABLE_PR_NUJD ("ID");
COMMIT;

CREATE TABLE "TABLE_GOD" 
(   
      "ID"  INTEGER NOT NULL UNIQUE,
      "GOD"  INTEGER NOT NULL UNIQUE
);