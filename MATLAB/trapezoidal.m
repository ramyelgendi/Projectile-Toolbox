function z = trapezoidal(y,T)


[firstIndex,lastIndex]=size(y);

z = zeros(size(y));
z(firstIndex)=0;

for current_i=firstIndex:lastIndex-1
    sum = 0;
    templastIndex = current_i+1;
    for i=firstIndex+1:templastIndex-1
        sum = sum + y(i);
    end
    z(current_i+1) = ((T(current_i+1)-T(current_i))/2) * (y(firstIndex)+y(templastIndex) + 2*sum);
end

end
