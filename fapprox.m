clc; clear;
%variable declaration
global x0 a x
syms x0 a x
%
% function: f(x) = sqrt(x)
%
%f = sqrt(x);
f = str2sym(input('f(x) = ? ... ','s'));
display('f(x) = '),pretty(f)
P_N = 0;
% degree, N
N = 2
for i = 0:N
    P_N = P_N + D(f,i);
end
display('Taylor Approximation of f about a at x0 '),pretty(P_N)
a_ = str2num(input('a? ... ','s'));
x0_ = str2num(input('x0? ... ','s'));
%a_ = 100;x0_ = 98; 
disp(['when (a, x0) = (',num2str([a_, x0_]),') is'])
double(subs(P_N,[a, x0],[a_,x0_]))

function g = D(f,n)
global x0 a x
g = 1/factorial(n)*subs(diff(f,x,n),x,a)*(x0-a)^n;
return
end
