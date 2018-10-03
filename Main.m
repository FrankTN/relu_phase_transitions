% Frank te Nijenhuis 2018 
% Plot learning curves (epsilon_g against ?) for different K
K = 2;
M = 2;
alpha = 40;

% alpha = beta*P/(NK)
% beta is the inverse temperature
% P is the number of examples
% N -> infty, making ? continuous 
% K is the number of hidden units in the student
% M is the number of hidden units in the teacher

% f is the free energy, to be minimized
f = @(x) free_energy(x(1),x(2),x(3),alpha,K,M);
x0 = [1,0,0];
x,fval = fminsearch(f,x0);

% We construct initial Q, R and T 
Q_pre = rand(K);
Q = (Q_pre - diag(diag(Q_pre))) + diag(ones([K,1]));
R = rand([K,M]);
T = eye(M);

% Next we obtain the averages
avg_xx = 0;
for i = 1:K
    for j = 1:K
        subvalue = Q(i,j) / 4 + sqrt(1 - Q(i,j) * Q(i,j)) / (2*pi) + Q(i,j) / (2*pi) * asin(Q(i,j));
        avg_xx = avg_xx + subvalue;
    end 
end

avg_xy = 0;
for i = 1:K
    for j = 1:M
        subvalue = R(i,j) / 4 + sqrt(1 - R(i,j) * R(i,j)) / (2*pi) + R(i,j) / (2*pi) * asin(R(i,j));
        avg_xy = avg_xy + subvalue;
    end 
end

avg_yy = 0;
for i = 1:M
    for j = 1:M
        subvalue = T(i,j) / 4 + sqrt(1 - T(i,j) * T(i,j)) / (2*pi) + T(i,j) / (2*pi) * asin(T(i,j));
        avg_yy = avg_yy + subvalue;
    end 
end

e_g = 1/(2*K) * (avg_xx - 2*avg_xy + avg_yy);

% epsilon_g sigmoidal
%e_g_s = @(Q,R) 1/6 + 1/(pi*K) * ; 

g = @(x) max(0,x); 
g_diff = @(x) step(x);

epsilon_g = 1 / (2*K) * (avg_xx - 2 * avg_xy + avg_yy);





R_in = rand();
Q_ii = 0.5;
Q_ik = rand();






