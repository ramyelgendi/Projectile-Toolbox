function z = simpson1_3(y,T)

[firstIndex,lastIndex]=size(y);
z = zeros(size(y));
z(firstIndex)=0;

for current_i=firstIndex:lastIndex-1
    sum_even = 0;
    sum_odd = 0;
    templastIndex = current_i+1;
    for i=firstIndex+1:templastIndex-1 % Do simpson's 1/3 from first index to current index
        if (mod(i,2))
            sum_odd = sum_odd + y(i);
        else
            sum_even = sum_even + y(i);
        end
    end
    z(current_i+1) = ((T(current_i+1)-T(current_i))/3) * ( y(firstIndex)+y(templastIndex)+4*sum_even+2*sum_odd ); % store calculated answer in a matrix
end



end
