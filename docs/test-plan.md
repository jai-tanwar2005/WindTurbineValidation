# Test Plan

## Objective

Check that `controller_step` calculates a valid update for expected inputs and rejects invalid inputs with documented error identifiers.

## Test cases

| Case | Input / action | Expected result |
| --- | --- | --- |
| Normal response | `controller_step(12, 5, 0.2)` | Returns `6.4` within floating-point tolerance |
| Full response | `controller_step(12, 5, 1)` | Returns `12` |
| Zero response rate | `controller_step(12, 5, 0)` | Throws `controller_step:InvalidRate` |
| NaN input | `controller_step(NaN, 5, 0.2)` | Throws `controller_step:InvalidInput` |
| Rate above one | `controller_step(12, 5, 1.1)` | Throws `controller_step:InvalidRate` |
| Infinite input | `controller_step(12, Inf, 0.2)` | Throws `controller_step:InvalidInput` |

## How to execute

Run in MATLAB from the repository folder:

```matlab
results = runtests('test_controller_step.m');
table(results)
```

A successful run should report every test as passed. Run `generate_test_report` to write the results to `test_report.csv`.

## Limitations

These are unit tests for a simplified mathematical function. They do not validate physical turbine behavior, real-time performance, hardware integration, or safety requirements.
