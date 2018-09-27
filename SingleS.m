% A script simulating the behavior of a single student neuron.

% For a fixed value of beta_tilde
minimum_array = cell(10,1);
i = 1;
for beta_tilde = linspace(0,1,10)
   j = 1;
   f = zeros(100,1);
   min_x = inf;
   min_y = inf;
   % We take 100 values of R between 
   for R = linspace(-.99,.99)
       % The entropy as a function of R, in the case of a single neuron
       S_R = (1/2) * log(1 - R*R);
       % The generalization error as a function of R
       epsilon_R = -2*(R/4 + (sqrt(1 - R*R))/(2*pi) + (R/(2*pi))*asin(R));
       % f(R) is the free energy in the system as a function of R
       f(j) = beta_tilde * epsilon_R - S_R;    
       if f(j) < min_y
          min_y = f(j);
          min_x = j;
       end
       j = j + 1;
   end
   minimum_array{i} = [min_x,min_y]; 
   hold on
   % Plot the function and the minimum
   plot(f);  
   plot(min_x, min_y, 'black*')
   i = i + 1;
end
title('Plot of the free energy, f(R;\beta), \beta \in [0,1]')
xlabel('-.99 < R < .99') % x-axis label
ylabel('f(R;\beta) = \beta \cdot \epsilon_g(R) - s(R)') % y-axis label
x = zeros(length(minimum_array),1);
y = zeros(length(minimum_array),1);
for k = 1:length(minimum_array)
   point = minimum_array{k};
   x(k) = point(1);
   y(k) = point(2); 
end
% plot the minimum values as a result of the 
plot(x,y)
hold off
figure()
title('Plot of the minimum value of the free energy for each \beta')
ylabel('y_{min}')
xlabel('\beta')
plot(linspace(0,1,10),y);

% You could also plot the R-value vs. beta~ in the end, or - actually - the resulting
% epsilon_g vs. beta~ as the "learning curve". 

