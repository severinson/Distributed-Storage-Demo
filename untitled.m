function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 05-Jun-2016 01:16:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%set(handles.input_window,'visible','off')

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in input.
function input_Callback(hObject, eventdata, handles)
% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global N
global BYTES
global numBytes
N=8;
axes(handles.input_window);
imdata = imread('test2.jpg');	
imshow(imdata),colormap(gray);%show the original image file
global imsize
imsize=size(imdata);
BYTES=reshape(imdata,imsize(1)*imsize(2)*imsize(3),1);
data_size=size(BYTES);
numBytes = data_size(1)/N;
%BinSer=dec2bin(BYTES,8);	
%BinSer=BinSer';
FileName=['test','.txt'];
fid=fopen(FileName,'w');
fprintf(fid,'%d',BYTES(:));
fclose(fid);


% --- Executes on button press in compare.
function compare_Callback(hObject, eventdata, handles)
% hObject    handle to compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Compare decoded data with the original data
global BYTES
global decBYTES

if sum(abs(BYTES - decBYTES)) ~= 0
    set(handles.result,'string','File Recover Failed') 
else
    set(handles.result,'string','File Recover Successed!') 
end
%remind when the compare process finished
h=msgbox('Compare Finished','remind');
pause(1)
close(h)


% --- Executes on button press in recover_window.
function recover_result_Callback(hObject, eventdata, handles)
% hObject    handle to recover_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global noteMask_bit
global numNodes
N = 8;
% noteMask_bit
num = 0;
% choose the first 8 nodes which still can use as the node mask
for i = 1:numNodes
        nodeMask_choose(i) = noteMask_bit(i)
    if noteMask_bit(i)==1
        num = num+1;
    end
    if num == 8
        break
    end
end
%recover the chosen bit mask back to vector mask
nodeMask_recover = toIndexVector(nodeMask_choose)

% Allocate space for the decoded data
global DATA
decDATA = zeros(size(DATA));
decDATA = gf(decDATA,N);

% Iterate over the encoded blocks and solve a system of linear equations
% for every block.
global numBlocks
global G
global STORAGE
for blockIndex = 1:numBlocks
    block = STORAGE(nodeMask_recover,blockIndex)';
    decDATA(:,blockIndex) = block/G(:,nodeMask_recover);
end

% Compare decoded data with the original data

decDATA = reshape(decDATA,1,N*numBlocks);
global decBYTES
decBYTES = byteNarray(decDATA,N);
global imsize
data_recover=reshape(decBYTES,imsize(1),imsize(2),imsize(3));
axes(handles.output_window);
imshow(data_recover),colormap(gray);%show the original image file
% remind when the recover process finished
h=msgbox('Recover Finished！','remind');
pause(1)
close(h)


function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result as text
%        str2double(get(hObject,'String')) returns contents of result as a double


% --- Executes during object creation, after setting all properties.
function result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function input_window_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'xTick',[]);
set(hObject,'ytick',[]);
set(hObject,'box','on');

% Hint: place code in OpeningFcn to populate input_window


% --- Executes during object deletion, before destroying properties.
function input_window_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to input_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function input_window_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to input_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function output_window_CreateFcn(hObject, eventdata, handles)
% hObject    handle to output_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'xTick',[]);
set(hObject,'ytick',[]);
set(hObject,'box','on');


% Hint: place code in OpeningFcn to populate output_window


% --- Executes during object creation, after setting all properties.
function input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in calculate_node_number.
function calculate_node_number_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_node_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X_use
X_use = [1 1 0]; 
% set(handles.C1, 'BackgroundColor',X_use);
N = 8;
global t
global numNodes
numNodes = 2^t+N;
s = 'handles.C';
 for i = 1:numNodes
   ss = strcat(s,num2str(i));
   set(eval(ss),'BackgroundColor',X_use);
 end
  for i = numNodes+1:44
   ss = strcat(s,num2str(i));
   set(eval(ss),'BackgroundColor',[1 1 1]);
 end
re=num2str(numNodes);
set(handles.nodes,'string',re) 
% Convert the byte array into an array of symbols over the field gf(2^N)
global BYTES
global DATA
DATA = gfNarray(BYTES,N);
% Reshape data into blocks
DATA = reshape(DATA,N,length(DATA)/N);

% Allocate the storage matrix. Every row corresponds to a storage node.
global STORAGE
STORAGE = zeros(numNodes,size(DATA,2));
STORAGE = gf(STORAGE,N);

% Calculate the RS generator matrix
global G
G = RSgenerator(N,t);

% Iterate over the data one block at a time
global numBlocks
numBlocks = size(DATA,2);
for blockIndex = 1:numBlocks
    block = DATA(:,blockIndex)';
    STORAGE(:,blockIndex) =  block*G;
end
x=uint8(STORAGE.x);
% for i=1:numNodes
%     FileName=['block',num2str(i),'.txt'];
%     fid=fopen(FileName,'w');
%     fprintf(fid,'%d',x(i,:));
%     fclose(fid); 
% end
% Decode data using a subset of the nodes.
% The data can be decoded using any N nodes.

global noteMask_bit
nodeMask = 1:numNodes;
noteMask_bit = toBitmask(nodeMask);


function nodes_Callback(hObject, eventdata, handles)
% hObject    handle to nodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodes as text
%        str2double(get(hObject,'String')) returns contents of nodes as a double


% --- Executes during object creation, after setting all properties.
function nodes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in input_t.
function input_t_Callback(hObject, eventdata, handles)
% hObject    handle to input_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t
input_t=str2double(get(handles.t,'String'));
if input_t>0 && input_t<6
    t = input_t;
    handles.input_t=input_t;
    guidata(hObject,handles)
    h=msgbox('Parameter t set successed！','remind');
    pause(1)
    close(h)
else
    if input_t < 1
        msgbox('Parameter t much be positive','remind')
    else
        msgbox('Do not have enough computer to save data','remind')
    end 
end



function t_Callback(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t as text
%        str2double(get(hObject,'String')) returns contents of t as a double


% --- Executes during object creation, after setting all properties.
function t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function input_t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in C1.
function C1_Callback(hObject, eventdata, handles)
% hObject    handle to C1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(1)=0;
noteMask_bit



% --- Executes on button press in C2.
function C2_Callback(hObject, eventdata, handles)
% hObject    handle to C2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(2)=0;
% noteMask_bit




% --- Executes on button press in C3.
function C3_Callback(hObject, eventdata, handles)
% hObject    handle to C3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(3)=0;
% noteMask_bit


% --- Executes on button press in C4.
function C4_Callback(hObject, eventdata, handles)
% hObject    handle to C4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(4)=0;
% noteMask_bit

% --- Executes on button press in C5.
function C5_Callback(hObject, eventdata, handles)
% hObject    handle to C5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(5)=0;
% noteMask_bit

% --- Executes on button press in C6.
function C6_Callback(hObject, eventdata, handles)
% hObject    handle to C6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(6)=0;
% noteMask_bit

% --- Executes on button press in C7.
function C7_Callback(hObject, eventdata, handles)
% hObject    handle to C7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(7)=0;
% noteMask_bit

% --- Executes on button press in C8.
function C8_Callback(hObject, eventdata, handles)
% hObject    handle to C8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(8)=0;
% noteMask_bit


% --- Executes on button press in C9.
function C9_Callback(hObject, eventdata, handles)
% hObject    handle to C9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in C14.
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(9)=0;
% noteMask_bit

% --- Executes on button press in C10.
function C10_Callback(hObject, eventdata, handles)
% hObject    handle to C10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(10)=0;
% noteMask_bit

% --- Executes on button press in C11.
function C11_Callback(hObject, eventdata, handles)
% hObject    handle to C11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(11)=0;
% noteMask_bit

% --- Executes on button press in C12.
function C12_Callback(hObject, eventdata, handles)
% hObject    handle to C12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(12)=0;
% noteMask_bit

% --- Executes on button press in C13.
function C13_Callback(hObject, eventdata, handles)
% hObject    handle to C13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(13)=0;
% noteMask_bit



function C14_Callback(hObject, eventdata, handles)
% hObject    handle to C14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(14)=0;
% noteMask_bit


% --- Executes on button press in C15.
function C15_Callback(hObject, eventdata, handles)
% hObject    handle to C15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(15)=0;
% noteMask_bit


% --- Executes on button press in C16.
function C16_Callback(hObject, eventdata, handles)
% hObject    handle to C16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(16)=0;
% noteMask_b


% --- Executes on button press in C17.
function C17_Callback(hObject, eventdata, handles)
% hObject    handle to C17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(17)=0;
% noteMask_b

% --- Executes on button press in C18.
function C18_Callback(hObject, eventdata, handles)
% hObject    handle to C18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(18)=0;
% noteMask_b


% --- Executes on button press in C19.
function C19_Callback(hObject, eventdata, handles)
% hObject    handle to C19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(19)=0;
% noteMask_b


% --- Executes on button press in C20.
function C20_Callback(hObject, eventdata, handles)
% hObject    handle to C20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(20)=0;
% noteMask_b


% --- Executes on button press in C21.
function C21_Callback(hObject, eventdata, handles)
% hObject    handle to C21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(21)=0;
% noteMask_b


% --- Executes on button press in C22.
function C22_Callback(hObject, eventdata, handles)
% hObject    handle to C22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(22)=0;
% noteMask_b



% --- Executes on button press in C23.
function C23_Callback(hObject, eventdata, handles)
% hObject    handle to C23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(23)=0;
% noteMask_b


% --- Executes on button press in C24.
function C24_Callback(hObject, eventdata, handles)
% hObject    handle to C24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(24)=0;
% noteMask_b


% --- Executes on button press in C25.
function C25_Callback(hObject, eventdata, handles)
% hObject    handle to C25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(25)=0;
% noteMask_b


% --- Executes on button press in C26.
function C26_Callback(hObject, eventdata, handles)
% hObject    handle to C26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(26)=0;
% noteMask_b


% --- Executes on button press in C27.
function C27_Callback(hObject, eventdata, handles)
% hObject    handle to C27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(27)=0;
% noteMask_b


% --- Executes on button press in C28.
function C28_Callback(hObject, eventdata, handles)
% hObject    handle to C28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(28)=0;
% noteMask_b


% --- Executes on button press in C29.
function C29_Callback(hObject, eventdata, handles)
% hObject    handle to C29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(29)=0;
% noteMask_b



% --- Executes on button press in C30.
function C30_Callback(hObject, eventdata, handles)
% hObject    handle to C30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(30)=0;
% noteMask_b


% --- Executes on button press in C31.
function C31_Callback(hObject, eventdata, handles)
% hObject    handle to C31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(31)=0;
% noteMask_b


% --- Executes on button press in C32.
function C32_Callback(hObject, eventdata, handles)
% hObject    handle to C32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(32)=0;
% noteMask_b


% --- Executes on button press in C33.
function C33_Callback(hObject, eventdata, handles)
% hObject    handle to C33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(33)=0;
% noteMask_b




% --- Executes on button press in C34.
function C34_Callback(hObject, eventdata, handles)
% hObject    handle to C34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(34)=0;
% noteMask_b


% --- Executes on button press in C35.
function C35_Callback(hObject, eventdata, handles)
% hObject    handle to C35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(35)=0;
% noteMask_b


% --- Executes on button press in C36.
function C36_Callback(hObject, eventdata, handles)
% hObject    handle to C36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(36)=0;
% noteMask_b


% --- Executes on button press in C37.
function C37_Callback(hObject, eventdata, handles)
% hObject    handle to C37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(37)=0;
% noteMask_b


% --- Executes on button press in C38.
function C38_Callback(hObject, eventdata, handles)
% hObject    handle to C38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(38)=0;
% noteMask_b


% --- Executes on button press in C39.
function C39_Callback(hObject, eventdata, handles)
% hObject    handle to C39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(39)=0;
% noteMask_b


% --- Executes on button press in C40.
function C40_Callback(hObject, eventdata, handles)
% hObject    handle to C40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(40)=0;
% noteMask_b


% --- Executes on button press in C41.
function C41_Callback(hObject, eventdata, handles)
% hObject    handle to C41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(41)=0;
% noteMask_b


% --- Executes on button press in C42.
function C42_Callback(hObject, eventdata, handles)
% hObject    handle to C42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(42)=0;
% noteMask_b


% --- Executes on button press in C43.
function C43_Callback(hObject, eventdata, handles)
% hObject    handle to C43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(43)=0;
% noteMask_b


% --- Executes on button press in C44.
function C44_Callback(hObject, eventdata, handles)
% hObject    handle to C44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[1 0 0]);
global noteMask_bit
noteMask_bit(44)=0;
% noteMask_b
