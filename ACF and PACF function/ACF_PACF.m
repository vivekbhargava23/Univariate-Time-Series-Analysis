function [Rho_h,Pie_hh] = ACF_PACF(Y,h_count)
%ACF_PACF Summary of this function goes here
%{
 Function Description
% The function takes two inputs - 
 - Y as Tx1 Vector of time series value
 - h_count which is the lag value

The function returns following Outputs - 
 - Rho_h - (hx1) vector - these are the autocorrelation values for lag h
 - Pie_hh - (1x1) scalar coefficient - gives the partial autocorrelation which is h'th' coefficient for
 lag h (Using the regression framework)
%}


%Writing autocorrelation
[T1,k1] = size(Y);
mu_Y = mean(Y);
Gamma_0 = mean((Y - mu_Y).^2);

h_range = 1:h_count;
sum1 = 0;

for h = 1:h_count
    
    a = Y(h+1:T1,1)-mu_Y;
    b = Y(1:T1-h)-mu_Y;
    Rho_h(h,:) = (a' * b)/(T1 * Gamma_0); % ACF
    

end


for h = 1:h_count
    
    for j = 1:h_count
        if h==j
           R(h,j) = 1;
           
        else
            R(h,j) = Rho_h(abs(h-j));
            
        end
        
    end
    
end



Pie_h = inv(R) * Rho_h;
Pie_hh = Pie_h(h);

%Rho_h = [ones(1,1),Rho_h']' %Rho_h with lag h=0 

end

