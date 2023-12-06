# SQL Challenge
Challenge project done using (Postgre)SQL as part of a data analytics bootcamp.

## Where to Find Everything
* All challenge work is located in the `employee_sql` folder.
  * Data modeling resources I made as part of the challenge are available within `employee_sql/modeling/`
    * Both light-theme and dark-theme graph `.png` files are available,  
    * The [QuickDBD](https://app.quickdatabasediagrams.com/) code used to generate the diagrams may also be found in this folder.  
  * Schemas may be found under `employee_sql/schemas.sql` 
  * Queries may be found under `employee_sql/analysis.sql`. 
    * I have included 10-row heads of analysis query results in their own `q*.tsv` files corresponding to their question number within  `employee_sql/output table heads/` (replace `*` with the question number).  
(the `.tsv` extension was chosen because tables copied from pgAdmin4 default to tab-separated values)

## Notable Tools Used
Tool | Purpose
-- | --
Git CLI | Should be self-explanatory
VSCode | Organizing files/folders, touching up comments and documentation, paging through `.csv` files
Rainbow CSV | VSCode Plugin; Made `.csv` (and `.tsv`) navigation within VSCode much easier.
QuickDBD | Modeling data relationships prior to table creation.
pgAdmin 4 | PostgreSQL database creation, importing `data/*.csv` files to corresponding tables, executing and developing/debugging SQL queries, collecting table outputs from queries.
ChatGPT 3.5 | Asking relatively simple questions regarding syntax and general methods. Greatly increased my time efficiency working on this challenge. It was recommended by the instructor during class that we use this tool.

## Credit
Any time I asked ChatGPT for help with a query, it has been documented in that query's corresponding comment. My questions to the LLM were all general in nature and I filled in the specifics myself. 
With the caveat that I received assistance as aforementioned, all work here is my own.
