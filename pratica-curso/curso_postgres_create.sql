CREATE TABLE "public.students" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"cpf" varchar(11) NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE,
	CONSTRAINT "students_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.class" (
	"id" serial NOT NULL,
	"code" TEXT NOT NULL UNIQUE,
	CONSTRAINT "class_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.class_students" (
	"id" serial NOT NULL,
	"student_id" integer NOT NULL,
	"class_id" integer NOT NULL,
	"start_date" DATE NOT NULL DEFAULT 'NOW()',
	"end_date" DATE,
	CONSTRAINT "class_students_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.projects" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"module_id" TEXT NOT NULL,
	CONSTRAINT "projects_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.module" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "module_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.students_projects" (
	"id" serial NOT NULL,
	"student_id" integer NOT NULL,
	"project_id" integer NOT NULL,
	"date_for_delivery" TIMESTAMP NOT NULL,
	"rating" TEXT NOT NULL,
	CONSTRAINT "students_projects_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "class_students" ADD CONSTRAINT "class_students_fk0" FOREIGN KEY ("student_id") REFERENCES "students"("id");
ALTER TABLE "class_students" ADD CONSTRAINT "class_students_fk1" FOREIGN KEY ("class_id") REFERENCES "class"("id");

ALTER TABLE "projects" ADD CONSTRAINT "projects_fk0" FOREIGN KEY ("module_id") REFERENCES "module"("id");


ALTER TABLE "students_projects" ADD CONSTRAINT "students_projects_fk0" FOREIGN KEY ("student_id") REFERENCES "students"("id");
ALTER TABLE "students_projects" ADD CONSTRAINT "students_projects_fk1" FOREIGN KEY ("project_id") REFERENCES "projects"("id");







