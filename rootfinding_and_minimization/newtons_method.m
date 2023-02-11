%% This document will serve as a visualization of the steps to regular newton
clc;
clear all;

xi = linspace(-2, 1.5, 1000);               %plotting vector

f = @(x) x.^4 + x.^3 - x.^2 - x;            %our function (random polynomial)
f_vec = xi.^4 + xi.^3 - xi.^2 - xi;         %vector form of same function
     
df = @(x) 4.*x.^3 + 3.*x.^2 - 2.*x - 1;     %hand derived true derivative
df_vec = 4.*xi.^3 + 3.*xi.^2 - 2.*xi - 1;   %hand derived vector form of function

figure(1);
plot(xi, f_vec)
title('newtons method for root finding')
grid on
hold on


xi = [1.3, -1.6, -0.1];             %initial guesses to test
xr = [0, 0, 0];                     %for storing roots
df(xi(1))

tol = 1e-4;                         %convergence tolerance
err = [10, 10, 10];                 %initial error to start loop

max_iter = 100;
iter = 1;

xr = xi;                            %init firgst guess
x_hist = xr;                        %store first guess

while err > tol
    xrold = xr;
    xr = xr - f(xr)./df(xr);        %newton's step
    
    
    err(iter, :) = abs((xr - xrold)/xr) * 100;      %check error

    iter = iter + 1;
    x_hist(iter, :) = xr;           %store history
    
end

%% Plotting stuff
% 
% for i = 1:length(x_hist)
%    
%         
%     
%     plot(x_hist(i,1), f(x_hist(i,1)), 'x', LineWidth= 1.1, Color='r')
%     plot(x_hist(i,2), f(x_hist(i,2)), 'x', LineWidth= 1.1,Color='#9e2bfc')
%     plot(x_hist(i,3), f(x_hist(i,3)), 'x', LineWidth= 1.1,Color='#02cc2e')
%     if i == 1, text(x_hist(i, :), f(x_hist(i,:)) + 0.3, '  first guess'), end
%     if err(i, 1) < tol, text(x_hist(i, 1), f(x_hist(i,1)) - 0.3, ' convergence'), end
%     if err(i, 2) < tol, text(x_hist(i, 2), f(x_hist(i,2)) - 0.3, ' convergence'), end
%     if err(i, 3) < tol, text(x_hist(i, 3), f(x_hist(i,3)) - 0.3, ' convergence'), end
%     w = waitforbuttonpress;
% end
