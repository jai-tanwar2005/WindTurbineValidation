
clc;

% Run the automated test suite
results = runtests('test_controller_step.m');

% Create a report table
report = table( ...
    string({results.Name})', ...
    [results.Passed]', ...
    [results.Failed]', ...
    [results.Duration]', ...
    'VariableNames', ...
    {'TestName', 'Passed', 'Failed', 'DurationSeconds'});

% Save the report as a CSV file
writetable(report, 'test_report.csv');

% Display results
disp(report);

% Confirm all tests passed
assert(all([results.Passed]), ...
    'Some tests failed. Check the test results.');

fprintf('Test report saved to test_report.csv\n');
