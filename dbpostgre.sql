DROP TABLE IF EXISTS "task";
DROP TABLE IF EXISTS "schedule";
DROP TABLE IF EXISTS "account";

CREATE TABLE "account" (
	"id" SERIAL PRIMARY KEY,
	"login" VARCHAR(512) UNIQUE,
	"password" VARCHAR(512),
	"role" varchar(512)
);
CREATE TABLE "schedule" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(512) UNIQUE,
	"account_id" INTEGER REFERENCES "account"(id)
);
CREATE TABLE "task" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(512) UNIQUE,
	"status" VARCHAR(512),
	"schedule_id" INTEGER REFERENCES "schedule"(id)
);