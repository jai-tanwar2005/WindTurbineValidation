# Wind Turbine Controller Validation (MATLAB)

A small, testable MATLAB project demonstrating a simplified controller-response model, automated unit tests, simulation plotting, and CSV test reporting.

> **Scope and safety:** This is an educational software-testing project. It is not a physical wind-turbine model, certified controller, or suitable for operating real equipment.

## Project goals

- Implement a small controller-step function with input validation.
- Simulate how an output approaches a target over repeated steps.
- Verify expected behavior and invalid-input handling with automated tests.
- Export test outcomes to a CSV report.
- Practice readable MATLAB code, testing, documentation, and Git version control.

## Repository contents

| File | Purpose |
| --- | --- |
| `controller_step.m` | One validated controller-response step |
| `run_simulation.m` | Runs the example simulation and plots the response |
| `test_controller_step.m` | Automated unit tests for normal and invalid cases |
| `generate_test_report.m` | Runs tests and exports `test_report.csv` |
| `docs/test-plan.md` | Test scope and expected behavior |
| `CONTRIBUTING.md` | Small guide for making changes |
| `LICENSE` | MIT License |

## Requirements

- MATLAB with support for function-based unit tests (`functiontests`, `runtests`, and `verifyEqual`).
- A current folder containing the project files.

The simulation uses `yline`, available in modern MATLAB releases. If your release does not support `yline`, remove that plotting line or replace it with a standard `plot` call.

## Run the simulation

1. Open MATLAB.
2. Set the Current Folder to this repository.
3. Run:

   ```matlab
   run_simulation
   ```

A plot should appear showing the output moving toward the target value.

## Run the automated tests

In the MATLAB Command Window, run:

```matlab
results = runtests('test_controller_step.m');
table(results)
```

To run the test-report script and create `test_report.csv`, run:

```matlab
generate_test_report
```

The report includes test names, pass/fail status, and execution duration. The report is generated locally and can be committed if you want to preserve a particular test run.

## Model overview

The controller uses a simple first-order update:

\[
y_{k+1} = y_k + r(y_{\mathrm{target}} - y_k)
\]

where `r` is the response rate, constrained to `0 < r <= 1`. For a fixed target and valid response rate, the output moves a fraction of the remaining difference on each step.

This intentionally simplified model is useful for practicing software validation; it does not model aerodynamics, drivetrain dynamics, sensors, actuator limits, grid behavior, or safety systems.

## Validation coverage

The unit tests cover:
- A normal response calculation.
- A full response rate that reaches the target in one step.
- Rejection of a zero response rate.
- Rejection of a `NaN` input.
- Rejection of a response rate above one.
- Rejection of an infinite input.

## Example result

For `controller_step(12, 5, 0.2)`, the expected next value is `6.4`.

## Suggested future improvements

- Add tests for negative values, complex numbers, and nonnumeric inputs.
- Add parameterized tests for several targets and response rates.
- Add a convergence check and configurable simulation settings.
- Add a MATLAB-compatible CI workflow after confirming the available MATLAB/GitHub Actions setup.
- Record test results and screenshots in the repository documentation.

## Author and project notes

This repository is intended as a learning portfolio. Update this section with your own name, project date, and any changes you personally make. Be prepared to explain the model, tests, and limitations during an interview.
