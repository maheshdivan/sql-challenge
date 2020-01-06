-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/2fslPB
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Logical ERD
CREATE TABLE "departments" (
    "dept_id" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_id"
     )
);

CREATE TABLE "dept_employee" (
    "emp_no" INTEGER   NOT NULL,
    "dept_id" varchar   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_id" VARCHAR   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL
);

CREATE TABLE "employee" (
    "emp_no" INTEGER   NOT NULL,
    "birth_date" Date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "gender" char   NOT NULL,
    "hire_date" Date   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" integer   NOT NULL,
    "salary" bigint   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" integer   NOT NULL,
    "title" varchar   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL
);

ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_employee_dept_id" FOREIGN KEY("dept_id")
REFERENCES "departments" ("dept_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_id" FOREIGN KEY("dept_id")
REFERENCES "departments" ("dept_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

