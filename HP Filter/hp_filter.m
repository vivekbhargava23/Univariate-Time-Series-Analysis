function [z_hat,m_hat] = hp_filter(Y,lambda)

[T,k] = size(Y);


derivative_1 = [1,-2,1];
derivative_2 = [-2,5,-4,1];
derivative_3 = [1,-4,6,-4,1];

G(1,:) = [derivative_1,zeros(1,T-3)];
G(2,:) = [derivative_2,zeros(1,T-4)];


G(T-1,T-3:T) = derivative_2;
G(T,T-2:T) = derivative_1;

for t = 3:T-2
    
    G(t,t-2:t+2) = derivative_3;
    
end
A = (lambda * G) + eye(T);
m_hat = inv(A) * Y;
z_hat = Y - m_hat;



end

