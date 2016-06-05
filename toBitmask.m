function bitmask = toBitmask(indexVector)
%indexToBitmask Convert a vector of indices to a bitmask.

bitmask = zeros(1,max(indexVector));
bitmask(indexVector) = 1;

end