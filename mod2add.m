function C = mod2add(A,B)
%mod2add Module 2 bitwise addition

C = uint8(0);
for i = 1:8
    bit = mod(bitget(A,i) + bitget(B,i),2);
    if bit == 1
        C = bitset(C,i);
    end
end

end

