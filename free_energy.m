function [ epsilon_g, f, s ] = free_energy(R, C, S, alpha, K, M)
%f is the free energy
% The variables are C,R and S
% alpha is the time parameter
% K is a parameter controlling the number of hidden units

% first we calculate the free energy, s
s = (1/2) * log(1 + (K-1)*C - ((R-S) + K*S)^2) + ((K-1)/2) * log(1 - C - (R-S)^2);

% Now we construct the matrices Q, R and T
Q = [1 C; C 1];
R = [R S; S R];
T = [1 0; 0 1];

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
epsilon_g = 1 / (2*K) * (avg_xx - 2 * avg_xy + avg_yy);

f = alpha * (K*epsilon_g) - s;
end

