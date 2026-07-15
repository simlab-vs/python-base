# Project template

This template should be used for every Python project in the lab. It uses:

- [`uv`](https://docs.astral.sh/uv/) for dependency management.
- [`ruff`](https://docs.astral.sh/ruff/) for code formatting.
- [`ty`](https://docs.astral.sh/ty/) for type checking.
- [`pre-commit`](https://pre-commit.com/) hooks for automated validation.
- [`pytest`](https://docs.pytest.org/) for testing.
- GitHub Actions to run the hooks and the tests on every push.

## Dependency management

We use [`uv`](https://docs.astral.sh/uv/) for dependency management. It is just as full-featured as
`poetry`, but _much faster_. Follow the instructions below to create a new project:

1. Update the name of the project in `pyproject.toml`. This is the distribution name, and it usually
   matches the name of the repository (hyphens are fine here).

2. Rename the folder `src/package_name` to the name of your package, and update the import in
   `tests/test_hello.py` to match. This is a Python module name, so it must use underscores rather
   than hyphens (`my_project`, not `my-project`) — otherwise it cannot be imported.

3. Run `uv sync` from the root of the repo. This will create a virtual environment and install
   needed development dependencies.

4. Add the dependencies you need (and run this same command every time you need a new package):

   ```sh
   uv add polars lightgbm
   ```

5. Take a look at the `uv`'s [Getting started guide](https://docs.astral.sh/uv/getting-started/).

## Pre-commit hooks

Install the pre-commit hooks:

```sh
uvx pre-commit install
```

This will create a `.git/hooks/pre-commit` file that will run the pre-commit hooks every time you
commit. Upon the first commit, the hooks will be installed.

Some hooks output error message that require a manual change (e.g., linting errors). Other hooks
perform automated fixes. Either way, you need to re-run the commit command:

```sh
git commit -m "My message"
```

### Code formatting

Among the pre-commit hooks, you will find one that runs [`ruff`](https://docs.astral.sh/ruff/) on
every Python file. It is also warmly recommended that you set up `ruff` in your IDE (e.g., Visual
Studio Code, PyCharm).

### Typing

We recommend the use of [type hints](https://docs.python.org/3/library/typing.html) of your code.
One of the pre-commit hooks is [`ty`](https://docs.astral.sh/ty/), which will perform type checking
when hints are available. This reduces greatly the risk of bugs and the maintainability of the code.

## Tests

Tests live in `tests/` and are run with [`pytest`](https://docs.pytest.org/):

```sh
uv run pytest
```

Unlike the linters, `pytest` is a dev dependency in `pyproject.toml` rather than a `uvx` tool: it
has to import your package, so it needs the project environment. It is installed by `uv sync`.

`tests/test_hello.py` is a stub covering the example `hello` function. Populate `tests/` as follows:

1. Delete `src/package_name/hello.py` and `tests/test_hello.py` once your own code replaces the
   example.

2. Name test files `test_*.py` and test functions `test_*`, mirroring the layout of your package
   (`src/package_name/foo.py` is tested by `tests/test_foo.py`).

3. Write one test per behaviour you want to keep working, and name it after that behaviour
   (`test_hello_returns_greeting`, not `test_1`). A test that would still pass if the function were
   broken is not worth having.

4. Cover the cases you are tempted to check by hand in a notebook: the empty input, the boundary,
   the error path. Add a test reproducing any bug you fix, so it cannot come back.

5. Keep tests fast and independent of the lab storage. If a test needs data, generate a small
   fixture in the test itself rather than reading from a data path.

The same style rules apply to test code as to the rest: type hints and a short numpy-style docstring
on every test function.

## Continuous integration

`.github/workflows/ci.yml` defines two jobs, which run on every push to `main` and on every pull
request:

- `pre-commit` runs every hook over all files, so CI fails on anything you did not run locally.
- `pytest` runs `uv sync --frozen` and the test suite. `--frozen` fails if `uv.lock` is out of date
  with `pyproject.toml`, so commit the lockfile whenever you add a dependency.

Both jobs pin the Python version through the `PYTHON_VERSION` variable at the top of the workflow.
It should match the version in `containers/apptainer.def`; change it in both places. To reproduce a
CI failure locally:

```sh
uvx pre-commit run --all-files
uv run pytest
```
