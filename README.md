# Einstein–Æther Mathematica notebooks

This repository collects **Mathematica notebooks** and **Wolfram Language (`.wl`) utilities** developed during my PhD work on **Einstein–Æther (Lorentz-violating) gravity**, including symbolic derivations, coordinate/metric constructions, and consistency/EOM checks.

## Repository structure

- `notebooks/`  
  Clean, GitHub-friendly notebooks (outputs removed) intended for browsing and rerunning.

- `src/`  
  Reusable Wolfram Language modules shared across notebooks (project initialization, EOM checks, helper routines).

- `scripts/`  
  Command-line entry points for headless execution with `wolframscript`.

- `tools/`  
  Utilities for maintenance (e.g., stripping notebook outputs before committing).

## Suggested starting point

Open:
- `notebooks/CheckEOM_clean.nb`

It provides an end-to-end example workflow (definitions → tensor manipulations → checks).

## Running headlessly (optional)

If you have `wolframscript`:
```bash
wolframscript -file scripts/run.wls --task checkEOM
