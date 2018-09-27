% Frank te Nijenhuis 2018 
% Plot learning curves (epsilon_g against ?) for different K


K = 1:15;

% ? = ?P/(NK)
% ? is the inverse temperature
% P is the number of examples
% N -> infty, making ? continuous 
% K is the number of hidden units



g = @(x) max(0,x); 
g_diff = @(x) step(x);


