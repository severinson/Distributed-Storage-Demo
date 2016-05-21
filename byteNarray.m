function C = byteNarray(A,N)
%gfNarray - Convert an array of symbols over the field gf(2^N) to a byte
%array.
% A     Array of GF symbols over the field GF(2^N)
% N     Size of the array.

% Input validation
if N ~= 1 && N ~= 2 && N ~= 4 && N ~= 8
   error('N must be 1, 2, 4 or 8'); 
end

% Allocate an array of bytes
numSymbols = length(A);
bitsPerSymbol = N;
symbolsPerByte = 8 / N;
numBytes = numSymbols/symbolsPerByte;
C = zeros(numBytes,1);
C = uint8(C);

for byteIndex = 1:numBytes
    byte = uint8(0);
    for symbolIndex = 1:symbolsPerByte
       symbol = A((byteIndex-1)*symbolsPerByte+symbolIndex);
       symbol = symbol.x;   % Get the numeric value
       symbol = uint8(symbol);
       symbol = bitshift(symbol,(symbolIndex-1)*bitsPerSymbol);
       byte = byte + symbol;
    end
    C(byteIndex) = byte;
end
end