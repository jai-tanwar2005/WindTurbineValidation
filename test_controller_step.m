
function tests = test_controller_step
tests = functiontests(localfunctions);
end

% Test 1: Normal controller response
function testNormalResponse(testCase)
actual = controller_step(12, 5, 0.2);
verifyEqual(testCase, actual, 6.4, 'AbsTol', 1e-10);
end

% Test 2: Full response reaches target
function testFullResponse(testCase)
actual = controller_step(12, 5, 1);
verifyEqual(testCase, actual, 12);
end

% Test 3: Invalid response rate is rejected
function testInvalidRate(testCase)
verifyError(testCase, ...
    @() controller_step(12, 5, 0), ...
    'controller_step:InvalidRate');
end

% Test 4: NaN input is rejected
function testInvalidInput(testCase)
verifyError(testCase, ...
    @() controller_step(NaN, 5, 0.2), ...
    'controller_step:InvalidInput');
end
