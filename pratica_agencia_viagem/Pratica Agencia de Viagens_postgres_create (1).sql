CREATE TABLE "public.Companies" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"acronym" TEXT NOT NULL UNIQUE,
	CONSTRAINT "Companies_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.airports" (
	"id" serial NOT NULL,
	"acronym" TEXT NOT NULL,
	CONSTRAINT "airports_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.flights" (
	"id" serial NOT NULL,
	"acronym" TEXT NOT NULL UNIQUE,
	"companies_id" integer NOT NULL,
	"arrived_id" integer NOT NULL,
	"departure_id" integer NOT NULL,
	CONSTRAINT "flights_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.arriveds" (
	"id" serial NOT NULL,
	"airport_id" serial NOT NULL,
	"arrived_time" TIMESTAMP NOT NULL,
	CONSTRAINT "arriveds_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.departures" (
	"id" serial NOT NULL,
	"airport_id" integer NOT NULL,
	"departures_id" TIMESTAMP NOT NULL,
	CONSTRAINT "departures_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "flights" ADD CONSTRAINT "flights_fk0" FOREIGN KEY ("companies_id") REFERENCES "Companies"("id");
ALTER TABLE "flights" ADD CONSTRAINT "flights_fk1" FOREIGN KEY ("arrived_id") REFERENCES "arriveds"("id");
ALTER TABLE "flights" ADD CONSTRAINT "flights_fk2" FOREIGN KEY ("departure_id") REFERENCES "departures"("id");

ALTER TABLE "arriveds" ADD CONSTRAINT "arriveds_fk0" FOREIGN KEY ("airport_id") REFERENCES "airports"("id");

ALTER TABLE "departures" ADD CONSTRAINT "departures_fk0" FOREIGN KEY ("airport_id") REFERENCES "airports"("id");






