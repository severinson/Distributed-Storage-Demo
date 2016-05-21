function C = gfNarray(A,N)
%gfNarray - Convert a byte array to an array of symbols over the Galois
%field gf(2^N).
% A     Array of uint8.
% N     Size of the array.

% Make sure the input is a byte array
A = uint8(A);

% Input validation
if N ~= 1 && N ~= 2 && N ~= 4 && N ~= 8
   error('N must be 1, 2, 4 or 8'); 
end

% Allocate an array of Galois field symbols
numBytes = length(A);
symbolsPerByte = 8 / N;
C = zeros(numBytes*symbolsPerByte,1);
C = gf(C,N);

for byteIndex = 1:numBytes
    byte = A(byteIndex);
    for symbolIndex = 1:symbolsPerByte
        symbol = uint8(0);
        
        % Add up the bits for the current symbol
        for bitIndex = 1:N
            symbol = symbol + 2^(bitIndex-1) * bitget(byte,(symbolIndex-1)*N+bitIndex);
        end
        symbol = gf(symbol,N);
        C((byteIndex-1)*symbolsPerByte+symbolIndex) = symbol;
    end
end
end

