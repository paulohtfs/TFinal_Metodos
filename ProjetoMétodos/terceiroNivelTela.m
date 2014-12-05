function varargout = terceiroNivelTela(varargin)
% TERCEIRONIVELTELA M-file for terceiroNivelTela.fig
%      TERCEIRONIVELTELA, by itself, creates a new TERCEIRONIVELTELA or raises the existing
%      singleton*.
%
%      H = TERCEIRONIVELTELA returns the handle to a new TERCEIRONIVELTELA or the handle to
%      the existing singleton*.
%
%      TERCEIRONIVELTELA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TERCEIRONIVELTELA.M with the given input arguments.
%
%      TERCEIRONIVELTELA('Property','Value',...) creates a new TERCEIRONIVELTELA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before terceiroNivelTela_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to terceiroNivelTela_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help terceiroNivelTela

% Last Modified by GUIDE v2.5 05-Dec-2014 14:25:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @terceiroNivelTela_OpeningFcn, ...
                   'gui_OutputFcn',  @terceiroNivelTela_OutputFcn, ...
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


% --- Executes just before terceiroNivelTela is made visible.
function terceiroNivelTela_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to terceiroNivelTela (see VARARGIN)

% Choose default command line output for terceiroNivelTela
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global Agauss_second;
global bgauss_second
global Agauss_third;
global Agauss;
global bgauss;
global bgauss_third;
global CURRENT_LEVEL
global NUMBER_OF_SHOTS;
global MATRIZ;
global STAGE;
global B_MATRIZ;

[Agauss,bgauss] = eliminacao_gauss(MATRIZ,B_MATRIZ);
[Agauss_second,bgauss_second] = eliminacao_gauss_second(MATRIZ,B_MATRIZ);
[Agauss_third,bgauss_third] = eliminacao_gauss_third(MATRIZ,B_MATRIZ);
STAGE =1;
% Set informations

if(STAGE == 1)
    set(handles.show_matriz,'String',num2str(MATRIZ));

end    
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


% UIWAIT makes terceiroNivelTela wait for user response (see UIRESUME)
% uiwait(handles.terceiro_nivel);


% --- Outputs from this function are returned to the command line.
function varargout = terceiroNivelTela_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit11_screen3_Callback(hObject, eventdata, handles)
% hObject    handle to edit11_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11_screen3 as text
%        str2double(get(hObject,'String')) returns contents of edit11_screen3 as a double


% --- Executes during object creation, after setting all properties.
function edit11_screen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11_screen3 (see GCBO)
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
global STAGE;
global NUMBER_OF_SHOTS;
global Agauss_second  bgauss_second Agauss_third bgauss_third;
global CURRENT_LEVEL;

values = [0 0 0 0; 0 0 0 0;0 0 0 0];
values(1,1) = str2num(get(handles.edit11_screen3,'string'));
values(1,2) = str2num(get(handles.edit12_screen3,'string'));
values(1,3) = str2num(get(handles.edit13_screen3,'string'));
values(1,4) = str2num(get(handles.edit14_screen3,'string'));

values(2,1) = str2num(get(handles.edit21_screen3,'string'));
values(2,2) = str2num(get(handles.edit22_screen3,'string'));
values(2,3) = str2num(get(handles.edit23_screen3,'string'));
values(2,4) = str2num(get(handles.edit24_screen3,'string'));

values(3,1) = str2num(get(handles.edit31_screen3,'string'));
values(3,2) = str2num(get(handles.edit32_screen3,'string'));
values(3,3) = str2num(get(handles.edit33_screen3,'string'));
values(3,4) = str2num(get(handles.edit34_screen3,'string'));

values(4,1) = str2num(get(handles.edit41_screen3,'string'));
values(4,2) = str2num(get(handles.edit42_screen3,'string'));
values(4,3) = str2num(get(handles.edit43_screen3,'string'));
values(4,4) = str2num(get(handles.edit44_screen3,'string'));

Agauss_second
Agauss
Agauss_third
STAGE
values
CURRENT_LEVEL
if ( STAGE == 1)
    if(isequal(num2str(Agauss_third),num2str( values)))
       % waitfor(msgBox('Acertou a primeira etapa','GaussGame'));
        set(handles.show_matriz,'String',num2str(Agauss_third));
        STAGE = STAGE +1;
        
    else
          if NUMBER_OF_SHOTS == 0 
             close(handles.terceiro_nivel);
             telaLose
         else
            msgbox('Ops!! Você errou!!Tente novamente','GaussGame');
            NUMBER_OF_SHOTS = NUMBER_OF_SHOTS -1;
          end      
    
    end
elseif ( STAGE == 2)
    if( isequal(num2str(Agauss_second),num2str( values)))
         waitfor(msgbox('Parabéns!! Você acertou!!','GaussGame'));
         set(handles.show_matriz,'String',num2str(Agauss_second));
         CURRENT_LEVEL = CURRENT_LEVEL +1;
         NUMBER_OF_SHOTS = NUMBER_OF_SHOTS + 1;
         close(handles.terceiro_nivel);
         
         if CURRENT_LEVEL > 9
         telaWin;
         else
             if CURRENT_LEVEL <= 9
                 mapaNivelDificil
             end
         end
    else     
         if NUMBER_OF_SHOTS == 0 
             
             close(handles.terceiro_nivel);
             telaLose;
         else
            msgbox('Ops!! Você errou!!Tente novamente','GaussGame');
            NUMBER_OF_SHOTS = NUMBER_OF_SHOTS -1;
         end
        
    end
elseif( STAGE == 3)        
    if( isequal(num2str(Agauss),num2str( values)))
         waitfor(msgbox('Parabéns!! Você acertou!!','GaussGame'));
         set(handles.show_matriz,'String',num2str(Agauss_second));
         CURRENT_LEVEL = CURRENT_LEVEL +1;
         NUMBER_OF_SHOTS = NUMBER_OF_SHOTS + 1;
         close(handles.terceiro_nivel);
         
         if CURRENT_LEVEL > 9
         telaWin;
         else
             if CURRENT_LEVEL <= 9
                 mapaNivelDificil
             end
         end
    else     
         if NUMBER_OF_SHOTS == 0 
             
             close(handles.terceiro_nivel);
             telaLose;
         else
            msgbox('Ops!! Você errou!!Tente novamente','GaussGame');
            NUMBER_OF_SHOTS = NUMBER_OF_SHOTS -1;
         end
        
    end
end
set(handles.shots,'String',num2str(NUMBER_OF_SHOTS));
set(handles.etapa,'String',num2str(STAGE));


function edit21_screen3_Callback(hObject, eventdata, handles)
% hObject    handle to edit21_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21_screen3 as text
%        str2double(get(hObject,'String')) returns contents of edit21_screen3 as a double


% --- Executes during object creation, after setting all properties.
function edit21_screen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end








function edit12_screen3_Callback(hObject, eventdata, handles)
% hObject    handle to edit12_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12_screen3 as text
%        str2double(get(hObject,'String')) returns contents of edit12_screen3 as a double


% --- Executes during object creation, after setting all properties.
function edit12_screen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_screen3_Callback(hObject, eventdata, handles)
% hObject    handle to edit13_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13_screen3 as text
%        str2double(get(hObject,'String')) returns contents of edit13_screen3 as a double


% --- Executes during object creation, after setting all properties.
function edit13_screen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit32_screen3_Callback(hObject, eventdata, handles)
% hObject    handle to edit32_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit32_screen3 as text
%        str2double(get(hObject,'String')) returns contents of edit32_screen3 as a double


% --- Executes during object creation, after setting all properties.
function edit32_screen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit32_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit23_screen3_Callback(hObject, eventdata, handles)
% hObject    handle to edit23_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23_screen3 as text
%        str2double(get(hObject,'String')) returns contents of edit23_screen3 as a double


% --- Executes during object creation, after setting all properties.
function edit23_screen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit41_screen3_Callback(hObject, eventdata, handles)
% hObject    handle to edit41_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit41_screen3 as text
%        str2double(get(hObject,'String')) returns contents of edit41_screen3 as a double


% --- Executes during object creation, after setting all properties.
function edit41_screen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit41_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit42_screen3_Callback(hObject, eventdata, handles)
% hObject    handle to edit42_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit42_screen3 as text
%        str2double(get(hObject,'String')) returns contents of edit42_screen3 as a double


% --- Executes during object creation, after setting all properties.
function edit42_screen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit42_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit33_screen3_Callback(hObject, eventdata, handles)
% hObject    handle to edit33_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit33_screen3 as text
%        str2double(get(hObject,'String')) returns contents of edit33_screen3 as a double


% --- Executes during object creation, after setting all properties.
function edit33_screen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit33_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit31_screen3_Callback(hObject, eventdata, handles)
% hObject    handle to edit31_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit31_screen3 as text
%        str2double(get(hObject,'String')) returns contents of edit31_screen3 as a double


% --- Executes during object creation, after setting all properties.
function edit31_screen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit31_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_screen3_Callback(hObject, eventdata, handles)
% hObject    handle to edit22_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22_screen3 as text
%        str2double(get(hObject,'String')) returns contents of edit22_screen3 as a double


% --- Executes during object creation, after setting all properties.
function edit22_screen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit43_screen3_Callback(hObject, eventdata, handles)
% hObject    handle to edit43_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit43_screen3 as text
%        str2double(get(hObject,'String')) returns contents of edit43_screen3 as a double


% --- Executes during object creation, after setting all properties.
function edit43_screen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit43_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_screen3_Callback(hObject, eventdata, handles)
% hObject    handle to edit14_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14_screen3 as text
%        str2double(get(hObject,'String')) returns contents of edit14_screen3 as a double


% --- Executes during object creation, after setting all properties.
function edit14_screen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit24_screen3_Callback(hObject, eventdata, handles)
% hObject    handle to edit24_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24_screen3 as text
%        str2double(get(hObject,'String')) returns contents of edit24_screen3 as a double


% --- Executes during object creation, after setting all properties.
function edit24_screen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit34_screen3_Callback(hObject, eventdata, handles)
% hObject    handle to edit34_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit34_screen3 as text
%        str2double(get(hObject,'String')) returns contents of edit34_screen3 as a double


% --- Executes during object creation, after setting all properties.
function edit34_screen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit34_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit44_screen3_Callback(hObject, eventdata, handles)
% hObject    handle to edit44_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit44_screen3 as text
%        str2double(get(hObject,'String')) returns contents of edit44_screen3 as a double


% --- Executes during object creation, after setting all properties.
function edit44_screen3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit44_screen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


