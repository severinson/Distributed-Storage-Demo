function indexVector = toIndexVector(bitmask)
%toIndexVector Convert a bitmask to a vector of indices.

% Verify that bitmask only has values 0 and 1
if sum(bitmask == 0) + sum(bitmask == 1) ~= length(bitmask)
   error('Bit mask must have only 0 and 1 values.');
end

indexVector = zeros(1,sum(bitmask));
index = 1;
for i = 1:length(bitmask)    
   if bitmask(i) == 1
      indexVector(index) = i;
      index = index + 1;
   end
end

end

