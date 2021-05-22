-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/I7zD7j
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "dept_id" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_id"
     )
);

CREATE TABLE "dept_manager" (
    "id" serial   NOT NULL,
    "dept_id" varchar   NOT NULL,
    "emp_id" int   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "employees" (
    "emp_id" int   NOT NULL,
    "emp_title" varchar   NOT NULL,
    "emp_birth" date   NOT NULL,
    "f_name" varchar   NOT NULL,
    "l_name" varchar   NOT NULL,
    "sex" varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "dept_employee" (
    "id" serial   NOT NULL,
    "emp_id" int   NOT NULL,
    "dept_id" varchar   NOT NULL,
    CONSTRAINT "pk_dept_employee" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "salaries" (
    "id" serial   NOT NULL,
    "emp_id" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_id" FOREIGN KEY("dept_id")
REFERENCES "Departments" ("dept_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_employee_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_employee_dept_id" FOREIGN KEY("dept_id")
REFERENCES "Departments" ("dept_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

