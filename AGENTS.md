# High-level project description

> Describe your project here

## Research workflows

- Maintain a append-only `LOGBOOK.md` file for each iteration, with the following structure in
  antichronological order:

  ```
  ## <Brief description of the iteration> - YYYY-MM-DD

  <Brief summary of the hypotheses being tested>

  <Description of the methods and implementation>

  <Highlight of the key results>

  <Next steps>
  ```

- Maintain a `RESULTS.md` that compiles the (comparable) results obtained so far. It should be an
  up-to-date version of the key results found in `LOGBOOK.md`.

## Reporting

Reports are written in quarto. All plots should be generated with Python cells (not copied from
elsewhere), ideally from cached results to minimize the generation time. Reporting code should be
re-usable, so favor functions instead of throwaway code.

## Coding Style

- Use `uv` to run scripts
- Use `uv ruff check` to lint the code and `uvx ty check` to type check it.
- Always use `uv ruff format` to format the code according to our guidelines after you are done
  editing a file.
- All functions must have type hints for their arguments and return values
- All functions should have docstings (numpy style), the docstring should be short and simple, avoid
  notes sections and exemples sections in docstrings unless strictly necessary.
- Code should focus on simplicity and clarity, avoid scope creep, avoid implementing non-necessary
  options.
- Polars should be prefered over pandas unless really necessary (e.g., geopandas).
- Project configurations and data paths are defined in `src/package_name/data/config.yaml` and
  `src/package_name/config.py`, data folder paths should not be hardcoded in scripts, rather they
  should be loaded from configurations.
- Tests live in `tests/`, are run with `uv run pytest`, and follow the same style rules as the rest
  of the code (type hints, short numpy-style docstrings).
