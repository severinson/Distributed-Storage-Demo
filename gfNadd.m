function C = gfNadd(A,B,N)
%gfNadd n-bit-wise addition of A and B.

if N ~= 1 && N ~= 2 && N ~= 3 && N ~= 4
   error('N must be 1, 2, 3 or 4'); 
end

C = uint8(0);
for symbolIndex = 1:8 / N
    symbolA = uint8(0);
    symbolB = uint8(0);
    for bitIndex = 1:N
        symbolA = symbolA + 2^(bitIndex-1) * bitget(A,(symbolIndex-1)*N+bitIndex);
        symbolB = symbolB + 2^(bitIndex-1) * bitget(B,(symbolIndex-1)*N+bitIndex);
    end
    symbolA = gf(symbolA,N);
    symbolB = gf(symbolB,N);
    symbolC = symbolA + symbolB;
    symbolC = uint8(symbolC.x);  
    
    for bitIndex = 1:N
        bit = bitget(symbolC,bitIndex);
        if bit == 1
            C = bitset(C,(symbolIndex-1)*N+bitIndex);
        end
    end
end
end

