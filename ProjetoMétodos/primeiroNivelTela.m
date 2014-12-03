function varargout = primeiroNivelTela(varargin)
%PRIMEIRONIVELTELA M-file for primeiroNivelTela.fig
%      PRIMEIRONIVELTELA, by itself, creates a new PRIMEIRONIVELTELA or raises the existing
%      singleton*.
%
%      H = PRIMEIRONIVELTELA returns the handle to a new PRIMEIRONIVELTELA or the handle to
%      the existing singleton*.
%
%      PRIMEIRONIVELTELA('Property','Value',...) creates a new PRIMEIRONIVELTELA using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to primeiroNivelTela_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      PRIMEIRONIVELTELA('CALLBACK') and PRIMEIRONIVELTELA('CALLBACK',hObject,...) call the
%      local function named CALLBACK in PRIMEIRONIVELTELA.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help primeiroNivelTela

% Last Modified by GUIDE v2.5 02-Dec-2014 22:56:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @primeiroNivelTela_OpeningFcn, ...
                   'gui_OutputFcn',  @primeiroNivelTela_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before primeiroNivelTela is made visible.
function primeiroNivelTela_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

global A b Agauss bgauss
A = [2 3 ; 5 -6]
b = [-5; 28]
[Agauss,bgauss] = eliminacao_gauss(A,b)

set(handles.show_matriz,'String',num2str(A));


% Choose default command line output for primeiroNivelTela
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global CURRENT_LEVEL;
global NUMBER_OF_SHOTS;
global MATRIZ;

set(handles.show_matriz,'String',num2str(MATRIZ));
set(handles.shots,'String',num2str(NUMBER_OF_SHOTS));

% This creates the 'background' axes
panhandle = handles.uipanel9;
panax = axes('Units','normal', 'Position', [0 0 1 1], 'Parent', panhandle);

% Load in a background image and display it using the correct colors
% The image used below, is in the Image Processing Toolbox.  If you do not have %access to this toolbox, you can use another image file instead.
current_lhama = get_lhama(CURRENT_LEVEL);
lhama = imread(current_lhama);
imshow(lhama);

% UIWAIT makes primeiroNivelTela wait for user response (see UIRESUME)
% uiwait(handles.primeiro_nivel);


% --- Outputs from this function are returned to the command line.
function varargout = primeiroNivelTela_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in submit.
function submit_Callback(hObject, eventdata, handles)
% hObject    handle to submit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Agauss
global NUMBER_OF_SHOTS;
values = [0 0; 0 0]
values(1,1) = str2num(get(handles.edit11,'string'));
values(1,2) = str2num(get(handles.edit12,'string'));
values(2,1) = str2num(get(handles.edit21,'string'));
values(2,2) = str2num(get(handles.edit22,'string'));
if( isequal(Agauss, values))
     waitfor(msgbox('Parabéns!! Você acertou!!','GaussGame'));
     close(primeiroNivelTela);
      segundoNivelTela;
     
else
    %Reduces attempts
    msgbox('Ops!! Você errou!!Tente novamente','GaussGame');
    NUMBER_OF_SHOTS = NUMBER_OF_SHOTS -1;
    NUMBER_OF_SHOTS
end


if NUMBER_OF_SHOTS == 0
    
    % end game logic
else
    % subtract or add shots
    set(handles.shots,'String',num2str(NUMBER_OF_SHOTS));
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
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



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function show_matriz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to show_matriz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
%matriz2 = [1 1 ; 2 2]
%value = num2str(matriz2)
