# {Project name}

> One or two sentences on what this project does and why it exists.

## Status

{Early exploration | Active development | Stable | Archived}. {Anything a newcomer should know
before relying on this: what works, what doesn't.}

## Getting started

Requires Python >=3.12 and [`uv`](https://docs.astral.sh/uv/).

```sh
uv sync                 # create the virtualenv and install dependencies
uvx pre-commit install  # install the pre-commit hooks
```

Check the install works:

```sh
uv run python -m {package_name}.hello
```

## Usage

{The shortest command that produces something useful, and the output it prints. Add one example per
entry point.}

```sh
uv run python -m {package_name}.{entry_point} --help
```

## Layout

| Path                       | Contents                                          |
| -------------------------- | ------------------------------------------------- |
| `src/{package_name}/`      | Library code, importable as `{package_name}`.     |
| `src/{package_name}/data/` | `config.yaml` — data paths and project settings.  |
| `tests/`                   | Test suite, run with `uv run pytest`.             |
| `containers/`              | Apptainer definition and entrypoint.              |
| {scripts, notebooks, …}    | {Fill in the folders this project actually adds.} |

Data paths live in `config.yaml` and are read through `config.py` — never hardcode them in scripts.

## Data

{Where the inputs come from, where they live on the lab storage, and how to get them. Say if
anything is restricted or must not be committed.}

## Results

`LOGBOOK.md` records each iteration in antichronological order (hypothesis, method, key results,
next steps). `RESULTS.md` compiles the comparable results across iterations, and is the place to
look first.

{Link the reports here as they are produced.}

## Containers

Build and run the Apptainer image, binding your working directory:

```sh
apptainer build --build-arg PROJECT_NAME={project-name} project.sif containers/apptainer.def
apptainer run --bind /path/to/workdir:/mnt/{project-name} project.sif
```

See the header of `containers/apptainer.def` for the available build arguments.

## Development

`GUIDELINES.md` covers the lab-wide toolchain (`uv`, `ruff`, `ty`, `pre-commit`); `AGENTS.md` covers
the coding style and research workflow, and is what coding agents read. Both apply to this project —
document only the deviations here.

```sh
uv run pytest              # run the tests
uvx pre-commit run --all-files  # run every hook, as CI does
```

`.github/workflows/ci.yml` runs those same two checks on every push.

## Contact

{Maintainer name and how to reach them.}
