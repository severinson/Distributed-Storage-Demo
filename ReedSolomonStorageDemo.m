% Distributed Storage Demo - An application of Reed-Solomon Codes
%
% GUI USAGE: Put this file in your Matlab path and run ReedSolomonStorageDemo() from the
% command interpreter.
% Author: Albin Severinson (albin@severinson.org)
% Date: 24/07/2016
%
% LIBRARY USAGE: 
% Put this file in your Matlab path.
% 1. Call initStorage()
% 2. Call setCodeParameters(m,t) to set code parameters.
% 3. Store the input data in storage.input.
% 4. Call encodeData() to encode.
% 5. Set the storage.erasureMask to indicate erasures. The erasureMask has to
% be length n. A value of 1 in the mask indicates that the corresponding
% node has been erased.
% 6. Call decodeData() to decode. The decoded data is stored in
% storage.decoded.
% 
% See main() and drawUI()for an examples.
%
% TODO:
% More extensive input validation.

function [] = ReedSolomonStorageDemo()
clear;close;clc;

disp('Starting distributed storage demo.');

initStorage();

% Draw UI
disp('Drawing UI...');
drawUI();
disp('DONE');

end

% Draw UI and assign button callback functions
function [] = drawUI()
global storage;

% ----- UI Parameters -----
windowWidth = 1000; 
windowHeight = 1000;
spacerWidth = 25;
rowHeight = 20;
columnWidth = 80;
textHeight = 20;
% -------------------------

% Create figure
f = figure('Position', [100 100 windowWidth windowHeight]);
indexX = spacerWidth;
indexY = windowHeight;

% Input headline
elementWidth = windowWidth - 2*spacerWidth;
elementHeight = textHeight;
indexY = indexY - spacerWidth - elementHeight;
inputText = uicontrol('Style','text','String','Input','HorizontalAlignment','left','FontWeight','bold','Position',[indexX indexY elementWidth elementHeight]);

% Randomize input button
indexY = indexY - spacerWidth;
elementWidth = 200;
elementHeight = rowHeight;
inputButton = uicontrol('Style', 'pushbutton', 'String', 'Randomize Input',...
    'Position', [indexX indexY elementWidth elementHeight]);

% Input data table
elementWidth = windowWidth-2*spacerWidth;
elementHeight = 3*rowHeight;
indexY = indexY - spacerWidth - elementHeight;
inputTable = uitable('Parent', f,'RowName',[],'Position', [indexX indexY elementWidth elementHeight], 'Data', storage.input);

% Set input button callback
inputButton.Callback = {@inputCB,inputTable};

% Encode headline
elementWidth = windowWidth-2*spacerWidth;
elementHeight = textHeight;
indexY = indexY - spacerWidth - elementHeight;
encodingText = uicontrol('Style','text','String','Encoding','HorizontalAlignment','left','FontWeight','bold','Position',[indexX indexY elementWidth elementHeight]);

% Code parameters edit
elementWidth = 50;
elementHeight = rowHeight;
indexY = indexY - spacerWidth - elementHeight;
codeTextM = uicontrol('Style','text','String','m = ','HorizontalAlignment','left','FontWeight','bold','Position',[indexX indexY elementWidth elementHeight]);

indexX = indexX + elementWidth;
elementWidth = 50;
codeEditM = uicontrol('Style','edit','String',num2str(storage.m),'Position',[indexX indexY elementWidth elementHeight]);

elementWidth = 50;
elementHeight = rowHeight;
indexX = indexX + 2*spacerWidth + elementWidth;
codeTextT = uicontrol('Style','text','String','t = ','HorizontalAlignment','left','FontWeight','bold','Position',[indexX indexY elementWidth elementHeight]);

indexX = indexX + elementWidth;
elementWidth = 50;
codeEditT = uicontrol('Style','edit','String',num2str(storage.t),'Position',[indexX indexY elementWidth elementHeight]);

elementWidth = windowWidth - 2*spacerWidth;
elementHeight = 3*rowHeight;
indexX = spacerWidth;
indexY = indexY - spacerWidth - elementHeight;
codeTable = uitable('Parent', f,'RowName',[],'ColumnName',{'Codeword length [n]:', 'Message length [k]:', 'Distance [d]:'}, ...
    'Position', [indexX indexY elementWidth elementHeight], 'Data', [storage.n storage.k storage.d]);

% Code edit callback
codeEditT.Callback = {@codeCBT,codeTable};
codeEditM.Callback = {@codeCBM,codeTable};

% Encode button
elementWidth = 200;
elementHeight = rowHeight;
indexY = indexY - spacerWidth - elementHeight;
encodeButton = uicontrol('Style', 'pushbutton', 'String', 'Encode',...
    'Position', [indexX indexY elementWidth elementHeight]);

% Node erase text
elementWidth = windowWidth - 2*spacerWidth;
elementHeight = rowHeight;
indexY = indexY - spacerWidth - elementHeight;
encodedText = uicontrol('Style','text','String','Every row is one storage node. Click on a row to toggle erasing the node.','HorizontalAlignment','left','FontWeight','bold','Position',[indexX indexY elementWidth elementHeight]);

% Encoded data table
elementWidth = windowWidth - 2*spacerWidth;
elementHeight = 15*rowHeight;
indexY = indexY - spacerWidth - elementHeight;
encodedTable = uitable('Parent', f, 'Position', [indexX indexY elementWidth elementHeight]);
encodedTable.CellSelectionCallback = {@encodedTableCB,encodedTable};

% Encode button callback
encodeButton.Callback = {@encodeCB,encodedTable};

% Decoding headline
elementWidth = windowWidth-2*spacerWidth;
elementHeight = textHeight;
indexX = spacerWidth;
indexY = indexY - spacerWidth - elementHeight;
decodingText = uicontrol('Style','text','String','Decoding','HorizontalAlignment','left','FontWeight','bold','Position',[indexX indexY elementWidth elementHeight]);

% Decode button
elementWidth = 200;
elementHeight = rowHeight;
indexY = indexY - spacerWidth - elementHeight;
decodeButton = uicontrol('Style', 'pushbutton', 'String', 'Decode',...
    'Position', [indexX indexY elementWidth elementHeight]);

% Decoded data table
elementWidth = windowWidth-2*spacerWidth;
elementHeight = 3*rowHeight;
indexY = indexY - spacerWidth - elementHeight;
decodedTable = uitable('Parent', f,'RowName',[],'Position', [indexX indexY elementWidth elementHeight]);

% Encode button callback
decodeButton.Callback = {@decodeCB,decodedTable};

end

%%%%%%%%%%%%%%%%%%%%% API %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% If you're using functions from any other section than this one you're
% probably doing something wrong :)

% Initialize the storage struct
function [] = initStorage()
% Global struct for storing currently used data and parameters
global storage;

numBytes = 1000;

storage = struct('input',0,'inputGF',0, ...
    'encoded',0, ...
    'decoded',0, ...
    'm',0,'n',0,'t',0,'k',0,'d',0, ...
    'erasureMask',0, ...
    'padding',0);

% Default code parameters
storage.m = 8;
storage.n = 2^storage.m - 1;
storage.t = 4;
storage.k = 2^storage.m - 1 - 2*storage.t;
storage.d = 2*storage.t + 1;

% Initialize data
storage.input = randbytes(1,numBytes);

end

% Encode the data stored in storage.input and store it in storage.encoded
% using the parameters in the storage struct.
function [] = encodeData()
global storage;
disp(['Encoding data with parameters m=' num2str(storage.m) ' n=' num2str(storage.n) ' t=' num2str(storage.t) ' k=' num2str(storage.k) ' d=' num2str(storage.d)]);
enc = comm.RSEncoder(storage.n,storage.k);
input = bytes2symbols(storage.input,storage.m);
if mod(length(input),storage.k) ~= 0
    storage.padding = storage.k - mod(length(input),storage.k);
    input = [input zeros(1,storage.padding)];
   disp(['Input length not a multiple of k. Appending ' num2str(storage.padding) ' zeros to input.']);
end
storage.encoded = step(enc,input');
storage.encoded = reshape(storage.encoded,storage.n,numel(storage.encoded)/storage.n);
storage.erasureMask = zeros(storage.n,1);

disp('Data encoded successfully!');
end

% Decode the data stored in storage.encoded and store it in storage.decoded
% using the parameters in the storage struct.
function [] = decodeData()
global storage;
input = reshape(storage.encoded,numel(storage.encoded),1);

erasureMask = reshape(repmat(storage.erasureMask,1,size(storage.encoded,2)),numel(storage.encoded),1);
dec = comm.RSDecoder(storage.n,storage.k,'ErasuresInputPort',true);

output = step(dec,input,erasureMask)';
output = output(1:end-storage.padding);
output = symbols2bytes(output,storage.m);
storage.decoded = output;

disp('Data decoded successfully!');
end

% Set and validate code parameters
function [] = setCodeParameters(m,t)
global storage;

if m ~= 2 && m ~= 4 && m ~= 8
    error('m must be 2, 4 or 8 (limit from implementation: code can handle any integer m>=2)');
end
storage.m = m;
storage.n = 2^storage.m - 1;

% Make sure t has a guaranteed safe value
storage.t = 1;
storage.k = 2^storage.m - 1 - 2*storage.t;
storage.d = 2*storage.t + 1;

if isempty(t) || isnan(t)
    error(['t must be an integer 0<t<2^(' num2str(storage.m) '-1)!']);
elseif mod(t,1) ~= 0
    error(['t must be an integer 0<t<2^(' num2str(storage.m) '-1)!']);    
elseif t < 1 || t >= 2^(storage.m-1)
    error(['t must be an integer 0<t<2^(' num2str(storage.m) '-1)!']);    
end

% If the checks passed, update to user-supplied value
storage.t = t;
storage.k = 2^storage.m - 1 - 2*storage.t;
storage.d = 2*storage.t + 1;

disp('Code parameters set!');
end

%%%%%%%%%%%%%%%%%%%%% CALLBACK FUNCTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = inputCB(source,callbackdata,table)
    global storage;
    storage.input = randbytes(size(storage.input,1),size(storage.input,2));
    table.Data = storage.input;
end

function [] = codeCBT(source,callbackdata,table)
global storage;
t = str2double(source.String);
setCodeParameters(storage.m,t);
table.Data = [storage.n storage.k storage.d];
end

function [] = codeCBM(source,callbackdata,table)
global storage;
m = str2double(source.String);
setCodeParameters(m,storage.t);
table.Data = [storage.n storage.k storage.d];
end

function [] = encodeCB(source,callbackdata,table)
    global storage;
    encodeData();
    
    % Convert into cell matrix
    table.Data = reshape(cellstr(num2str(reshape(storage.encoded,numel(storage.encoded),1))),size(storage.encoded));
end

function [] = encodedTableCB(source,callbackdata,table)
global storage;

% Return if the selected index is empty
if isempty(callbackdata.Indices)
    return;
end

selectedRow = callbackdata.Indices(1);
storage.erasureMask(selectedRow) = storage.erasureMask(selectedRow) ==~ 1;
data = table.Data;

if storage.erasureMask(selectedRow) == 1
    for columnIndex = 1:size(storage.encoded,2)
        data{selectedRow,columnIndex} = strcat('<html><span style="color: #FF0000; font-weight: bold;">', ...
            num2str(storage.encoded(selectedRow,columnIndex)), ...
            '</span></html>');
    end
else
    for columnIndex = 1:size(storage.encoded,2)
        data{selectedRow,columnIndex} = num2str(storage.encoded(selectedRow,columnIndex));
    end
end


table.Data = data;
end

function [] = decodeCB(source,callbackdata,table)
    global storage;
    decodeData();
    table.Data = storage.decoded;
end

%%%%%%%%%%%%%%%%%%%%% CODING FUNCTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Don't use these directly. Only use the API functions.

% Convert a matrix of bytes to symbols over GF(2^m)
function [symbols] = bytes2symbols(bytes,m)

% Make sure the input is a byte array
input = uint8(bytes);


% Input validation
if m ~= 2 && m ~= 4 && m ~= 8
   error('m must be 2, 4 or 8 (limit from implementation: code can handle any integer m>=2)'); 
end

% If m is 8 we don't need to do anything more
if m == 8
    symbols = input;
    return;
end

% Code works on arrays
input = reshape(input,numel(input),1);

% Allocate an array of Galois field symbols
numBytes = length(input);
symbolsPerByte = 8 / m;
output = zeros(numBytes*symbolsPerByte,1);

for byteIndex = 1:numBytes
    byte = input(byteIndex);
    for symbolIndex = 1:symbolsPerByte
        symbol = uint8(0);
        
        % Add up the bits for the current symbol
        for bitIndex = 1:m
            symbol = symbol + 2^(bitIndex-1) * bitget(byte,(symbolIndex-1)*m+bitIndex);
        end        
        output((byteIndex-1)*symbolsPerByte+symbolIndex) = symbol;
    end
end

% Reshape into matrix with the same number of rows as input
symbols = reshape(output,size(bytes,1),numel(output)/size(bytes,1));

disp(['Input converted to fit in GF(2^' num2str(m) '. #input=' num2str(numel(input)) ' #output=' num2str(numel(output))]);
end

% Convert a matrix of symbols over GF(2^m) to bytes
function [bytes] = symbols2bytes(symbols,m)

% Input validation
if m ~= 2 && m ~= 4 && m ~= 8
   error('m must be 2, 4 or 8 (limit from implementation: code can handle any integer m>=2)');    
end

% Make sure the input is a byte array
input = uint8(symbols);

% If m is 8 we don't need to do anything more
if m == 8
    bytes = input;
    return;
end

% Code works on arrays
input = reshape(input,numel(input),1);

% Allocate an array of bytes
numSymbols = length(input);
bitsPerSymbol = m;
symbolsPerByte = 8 / m;
numBytes = numSymbols/symbolsPerByte;
output = zeros(numBytes,1);
output = uint8(output);

for byteIndex = 1:numBytes
    byte = uint8(0);
    for symbolIndex = 1:symbolsPerByte
       symbol = input((byteIndex-1)*symbolsPerByte+symbolIndex);
       symbol = uint8(symbol);
       symbol = bitshift(symbol,(symbolIndex-1)*bitsPerSymbol);
       byte = byte + symbol;
    end
    output(byteIndex) = byte;
end

% Reshape into matrix with the same number of rows as input
bytes = reshape(output,size(symbols,1),numel(output)/size(symbols,1));

disp(['Input converted back to bytes. #input=' num2str(numel(input)) ' #output=' num2str(numel(output))]);
end

% Randomly generated bytes
function bytes = randbytes(rows,cols)
bytes = uint8(rand(rows,cols)*2^8);
end