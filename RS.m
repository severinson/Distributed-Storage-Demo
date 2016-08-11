function varargout = RS(varargin)
% RS MATLAB code for RS.fig
%      RS, by itself, creates a new RS or raises the existing
%      singleton*.
%
%      H = RS returns the handle to a new RS or the handle to
%      the existing singleton*.
%
%      RS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RS.M with the given input arguments.
%
%      RS('Property','Value',...) creates a new RS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RS

% Last Modified by GUIDE v2.5 11-Aug-2016 23:05:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RS_OpeningFcn, ...
                   'gui_OutputFcn',  @RS_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before RS is made visible.
function RS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RS (see VARARGIN)

% Choose default command line output for RS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in pushbutton72.
function pushbutton72_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton72 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton73.
function pushbutton73_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton73 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton74.
function pushbutton74_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton74 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton75.
function pushbutton75_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton75 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton76.
function pushbutton76_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton76 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton77.
function pushbutton77_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton77 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton78.
function pushbutton78_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton78 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton79.
function pushbutton79_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton79 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton80.
function pushbutton80_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton80 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton81.
function pushbutton81_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton81 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton82.
function pushbutton82_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton83.
function pushbutton83_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton84.
function pushbutton84_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton84 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton85.
function pushbutton85_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton85 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton86.
function pushbutton86_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton86 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton87.
function pushbutton87_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton88.
function pushbutton88_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton89.
function pushbutton89_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton89 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton90.
function pushbutton90_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton91.
function pushbutton91_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton92.
function pushbutton92_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton93.
function pushbutton93_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton94.
function pushbutton94_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton95.
function pushbutton95_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton95 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton96.
function pushbutton96_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton96 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in InputFile.
function InputFile_Callback(hObject, eventdata, handles)
% Default code parameters
 global m 
% global n 
% global t
% global k
% global d
global numBytes
global imsize
global BYTES_origin
global data_origin
global TABLE1
 m = 4;                   % decided the length of code
% n = 2^m - 1;             % the length of code
% t = 4;                   % decided the Hamming distance
% k = 2^m - 1 - 2*t;       % dimension

%choose the original image file
axes(handles.input_window);
[filename,pathname]=uigetfile({'*.*';'*.pgm';'*.jpg';'*.tif'},...
    'Please choose a file');
B='im';
K = finfo(filename);
set(handles.edit4,'string','Encode');
set(handles.edit12,'string','Padding');
set(handles.edit11,'string','Decode');
set(handles.edit13,'string','Compare');
if strcmp(K,B)
    filepath=[pathname,filename];
    imdata=imread(filepath);
    imdata=imresize(imdata,[80 80]);
    imshow(imdata);
    imsize=size(imdata);
    BYTES_origin=reshape(imdata,1, imsize(1)*imsize(2)*imsize(3));
    data_origin = BYTES_origin;
%     xlswrite('original.xls',BYTES)
%     save BYTES;
    TABLE1 = reshape(BYTES_origin, 80, 80*3);
    set(handles.text11,'string','Original_Data');
    set(handles.uitable6,'Data',TABLE1);
    data_size=size(BYTES_origin);
    numBytes = data_size(1)/8;
    FileName=['test','.txt'];
    fid=fopen(FileName,'w');
    fprintf(fid,'%d',BYTES_origin(:));
    fclose(fid);
    cla(handles.output_window);
else
    msgbox('Please choose an image')   
end


% --- Executes on selection change in parameter_m.
function parameter_m_Callback(hObject, eventdata, handles)
% hObject    handle to parameter_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global m
global mLine
global nColumn
global TABLE1

val = get(hObject ,'value');
switch (val)     
    case 1
        set(handles.uitable3, 'Data', cell(size(get(handles.uitable3,'Data'))));
        set(handles.edit4,'string','Encode');
        set(handles.edit12,'string','Padding');
        set(handles.edit11,'string','Decode');
        set(handles.edit13,'string','Compare');
        set(handles.text11,'string','Original_Data');
        set(handles.uitable6,'Data',TABLE1);
        m = 4;
    case 2
        set(handles.uitable3, 'Data', cell(size(get(handles.uitable3,'Data'))));
        set(handles.edit4,'string','Encode');
        set(handles.edit12,'string','Padding');
        set(handles.edit11,'string','Decode');
        set(handles.edit13,'string','Compare');
        set(handles.text11,'string','Original_Data');
        set(handles.uitable6,'Data',TABLE1);
        m = 8;
end 


% Hints: contents = cellstr(get(hObject,'String')) returns parameter_m contents as cell array
%        contents{get(hObject,'Value')} returns selected item from parameter_m


% --- Executes during object creation, after setting all properties.
function parameter_m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to parameter_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
       

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Calculate_node.
function Calculate_node_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate_node (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n
global m
global k
global t
global TABLE1


h=msgbox('Calculating...','remind');

n = 2^m - 1;             % the length of code
k = 2^m - 1 - 2*t;       % dimension
global a                 % create the node table
a = 1:n;                 % n is odd number
a = [a 0];               % In order to reshape a to m*m use 0 supplement
table_size = 2^(m/2);
a = reshape(a, table_size, table_size);



set(handles.uitable3,'Data',a);
set(handles.uitable6,'Data',TABLE1);
set(handles.text11,'string','Original_Data');
set(handles.edit4,'string','Encode');
set(handles.edit12,'string','Padding');
set(handles.edit11,'string','Decode');
set(handles.edit13,'string','Compare');
cla(handles.output_window);
pause(1)
close(h)






% --- Executes on button press in Encode.
function Encode_Callback(hObject, eventdata, handles)
% hObject    handle to Encode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n
global k
global m
global BYTES_origin
global encoded
global padding
global erasureMask_user    % users destory nodes is achieved by change this mask

h=msgbox('Encoding...','remind');
enc = comm.RSEncoder(n,k);
% BYTES = bytes2symbols(BYTES,m);
input = uint8(BYTES_origin);

    input = reshape(input,numel(input),1);
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
    BYTES = reshape(output,size(BYTES_origin,1),numel(output)/size(BYTES_origin,1));
%     set(handles.edit4,'string',['Input converted to fit in GF(2^' num2str(m) ')' ' #input=' num2str(numel(input)) ' #output=' num2str(numel(output))]) 


if mod(length(BYTES),k) ~= 0
    padding = k - mod(length(BYTES),k);
    BYTES = [BYTES zeros(1,padding)];
    set(handles.edit12,'string',['Input length not a multiple of k.',' Appending ' num2str(padding) ' zeros to input.']) 
else
    padding = 0;
    set(handles.edit12,'string','Input length is a multiple of k');
end
encoded = step(enc,BYTES');
num_input = size(BYTES_origin);
num_output = size(encoded);
encoded = reshape(encoded,n,numel(encoded)/n);
set(handles.edit4,'string',['Input converted to fit in GF(2^' num2str(m) ')' ' #input=' num2str(num_input(2)) ' #output=' num2str(num_output(1))]) 

set(handles.uitable6,'Data',encoded);
set(handles.text11,'string','Encoded_Data');
erasureMask_user = zeros(n,1);

set(handles.edit11,'string','Decode');
set(handles.edit13,'string','Compare');
cla(handles.output_window);
pause(1)
close(h)


% --- Executes on button press in Recover.
function Recover_Callback(hObject, eventdata, handles)
% hObject    handle to Recover (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global encoded
global m
global n
global k
global t
global imsize
global padding
global decoded
global data_recover
global erasureMask_user
global node_destoried

if node_destoried < 2*t +1


h=msgbox('Decoding...','remind');
input = reshape(encoded,numel(encoded),1);
size_node = size(encoded);
size_input = size(input);
num_input = size_input(1) - node_destoried*size_node(2);
erasureMask = reshape(repmat(erasureMask_user,1,size(encoded,2)),numel(encoded),1);
dec = comm.RSDecoder(n,k,'ErasuresInputPort',true);

symbols = step(dec,input,erasureMask)';
symbols = symbols(1:end-padding);
% output = symbols2bytes(output,m);
input = uint8(symbols);

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

decoded = bytes;


 data_recover = decoded(1: 19200);
 num_output = size(data_recover);
 set(handles.edit11,'string',['Input converted back to bytes. #input=' num2str(num_input) ' #output=' num2str(num_output(2))]) 

 decoded_show = reshape(data_recover,80, 80*3);
 set(handles.uitable6,'Data',decoded_show);
set(handles.text11,'string','Decoded_Data');
img_recover=reshape(data_recover,imsize(1),imsize(2),imsize(3));
axes(handles.output_window);
imshow(img_recover),colormap(gray);%show the original image file

set(handles.edit13,'string','Compare');

pause(1)
close(h)
erasureMask_user = zeros(n,1);
else
    h=msgbox('The image can not be recovered','remind');
end


% --- Executes on button press in Compare.
function Compare_Callback(hObject, eventdata, handles)
% hObject    handle to Compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data_origin
global data_recover
if sum(abs(data_origin - data_recover)) ~= 0
    set(handles.edit13,'string','File Recover Failed') 
else
    set(handles.edit13,'string','File Recover Successed!') 
end
%remind when the compare process finished
h=msgbox('Compare Finished','remind');
pause(1)
close(h)


% --- Executes when entered data in editable cell(s) in uitable4.
function uitable4_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable4 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in uitable3.
function uitable3_CellEditCallback(hObject, nodedata, handles)
% hObject    handle to uitable3 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in uitable6.
function uitable6_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable6 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t
global m
global d
global TABLE1
t=str2double(get(handles.edit9,'String'));
border = 2^(m-1);
if (1< t) && ( t < border)
    h=msgbox('Parameter t set successed','remind');
    set(handles.edit4,'string','Encode');
    set(handles.edit12,'string','Padding');
    set(handles.edit11,'string','Decode');
    set(handles.edit13,'string','Compare');
    set(handles.text11,'string','Original_Data');
    set(handles.uitable6,'Data',TABLE1);
pause(1)
close(h)
else
    h=msgbox(['t must be an integer 0<t<2^(' num2str(m) '-1)!'],'remind');
end
d = 2*t + 1;             % Hamming distance



% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function InputFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected cell(s) is changed in uitable3.
function uitable3_CellSelectionCallback(hObject, nodedata, handles)
% hObject    handle to uitable3 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
global mLine
global nColumn
global m
global num_node
global erasureMask_user
global node_destoried
global t
global n

mLine=nodedata.Indices(1,1);
nColumn=nodedata.Indices(1,2);
% mLine=1;
% nColumn=1;
encoded_data = get(handles.uitable6,'Data');
% table_data(mLine,nColumn) = cellfun(@(x) ['<html><table border=0 width=400 bgcolor=#FF0000><TR><TD>' x '</TD></TR> </table></html>'], table_data(mLine,nColumn), 'UniformOutput', false);
% t = uitable3('Data', table_data);
num_node = mLine + 2^(m/2)*(nColumn-1);
if (num_node == 0) || (num_node > n)
    h=msgbox('This node does not contain any data','remind');
else
encoded_data(num_node,:) = 0;
set(handles.uitable6,'Data',encoded_data);

erasureMask_user(num_node) = erasureMask_user(num_node) ==~ 1;
e=find(erasureMask_user==1);
node_destoried= length(e);
if node_destoried > 2*t -1
    h=msgbox('Please stop destory otherwise the data can not recover anymore','remind');
end
end
