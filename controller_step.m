
function nextValue = controller_step(target, current, responseRate)
%CONTROLLER_STEP Calculate one simplified control-response step.

inputs = {target, current, responseRate};

for k = 1:numel(inputs)
    x = inputs{k};
    if ~isnumeric(x) || ~isscalar(x) || ~isreal(x) || ~isfinite(x)
        error('controller_step:InvalidInput', ...
            'Inputs must be finite real numeric scalars.');
    end
end

if responseRate <= 0 || responseRate > 1
    error('controller_step:InvalidRate', ...
        'Response rate must be greater than 0 and at most 1.');
end

nextValue = current + responseRate * (target - current);
end
