% A script simulating the behavior of a single student neuron.

% For a fixed value of beta_tilde
beta_tilde = 0;


for beta_tilde = linspace(0,1,10)
   count = 1;
   f = zeros(100,1);
   min_x = inf;
   min_y = inf;
   for R = linspace(-.9,.9)
       % The entropy as a function of R
       S_R = (1/2) * log(1 - R*R);
       % The generalization error as a function of R
       epsilon_R = -2*(R/4 + (sqrt(1 - R*R))/(2*pi) + (R/(2*pi))*asin(R));
       % f(R) is the free energy in the system as a function of R
       f(count) = beta_tilde * epsilon_R - S_R;    
       if f(count) < min_y
          min_y = f(count);
          min_x = count;
       end
       count = count + 1;
   end
   hold on
   plot(f);  
   plot(min_x, min_y, 'black*')
end
hold off

