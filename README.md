# dbt Airbnb Project — Learn by Doing

Welcome to the **dbt Airbnb Project**, a practical, hands-on repository designed to help you learn dbt through real-world examples and active experimentation.

## About this Project

This repo uses Airbnb data to showcase common dbt features and best practices, organized as a step-by-step, learn-by-doing application.

Whether you’re new to dbt or looking to sharpen your skills, this project will guide you through:

- Building **staging**, **dimension**, **fact**, and **mart** models  
- Implementing **incremental models** with smart data filtering  
- Writing and using **macros** for reusable SQL logic  
- Defining **tests** to ensure data quality  
- Creating and linking **documentation** with `{% docs %}` blocks  
- Managing project configuration in `dbt_project.yml`  
- Using dbt’s **docs generation** and **serve** features  

## Project Structure

- `models/` — Organized by domain (`stg_`, `dim_`, `fct_`, `mart_`) with SQL models and YAML schema files  
- `macros/` — Reusable SQL macros to simplify and DRY your code  
- `models/docs/` — Centralized documentation markdown files using dbt `{% docs %}` blocks  
- `seeds/` — Static seed data for lookups or mappings  
- `snapshots/` — Snapshots to track slowly changing dimensions  
- `tests/` — Custom data tests  
- `dbt_project.yml` — Core project configuration  

## How to Use

1. Clone this repository:

   ```bash
   git clone https://github.com/arpan65/dbt-airbnb.git
   cd dbt-airbnb/my_snowflake_project
   ```

2. Set up your `profiles.yml` for your target data warehouse (Snowflake in this case).

3. Install dependencies:

   ```bash
   dbt deps
   ```

4. Run models:

   ```bash
   dbt run
   ```

5. Run tests to check data quality:

   ```bash
   dbt test
   ```

6. Generate and serve docs locally:

   ```bash
   dbt docs generate
   dbt docs serve
   ```

Visit the docs URL (usually `http://localhost:8080`) to explore your data models and documentation interactively.

## Learn by Doing

The project is meant to be explored incrementally:

- Start with simple staging models and progress to marts.  
- Explore the macros in the `macros/` folder to understand reusable patterns.  
- Review the tests to see how dbt can catch data issues.  
- Modify models, add your own tests or docs, and see the results live!

---

## Contribution & Feedback

Feel free to fork this repo, experiment, and open issues or pull requests for improvements or questions.

---

## License

This project is open source under the MIT License.
