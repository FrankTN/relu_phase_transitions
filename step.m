function y = step(x)
% Step used as derivative for ReLU
y = 0;
if x >= 0
    y = 1;
end