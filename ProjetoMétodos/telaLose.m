function varargout = telaLose(varargin)
% TELALOSE M-file for telaLose.fig
%      TELALOSE, by itself, creates a new TELALOSE or raises the existing
%      singleton*.
%
%      H = TELALOSE returns the handle to a new TELALOSE or the handle to
%      the existing singleton*.
%
%      TELALOSE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TELALOSE.M with the given input arguments.
%
%      TELALOSE('Property','Value',...) creates a new TELALOSE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before telaLose_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to telaLose_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help telaLose

% Last Modified by GUIDE v2.5 03-Dec-2014 10:18:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @telaLose_OpeningFcn, ...
                   'gui_OutputFcn',  @telaLose_OutputFcn, ...
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


% --- Executes just before telaLose is made visible.
function telaLose_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to telaLose (see VARARGIN)

% Choose default command line output for telaLose
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This creates the 'background' axes
ha = axes('units','normalized', ...
            'position',[0 0 1 1]);
        
% Move the background axes to the bottom
uistack(ha,'bottom');

% Load in a background image and display it using the correct colors
% The image used below, is in the Image Processing Toolbox.  If you do not have %access to this toolbox, you can use another image file instead.
bg_image = imread('dum_lhama.jpg');
hi = imagesc(bg_image);
colormap gray

% Turn the handlevisibility off so that we don't inadvertently plot into the axes again
% Also, make the axes invisible
set(ha,'handlevisibility','off', ...
            'visible','off');

% UIWAIT makes telaLose wait for user response (see UIRESUME)
% uiwait(handles.tela_lose);


% --- Outputs from this function are returned to the command line.
function varargout = telaLose_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1

mapaNivelFacil
close(handles.tela_lose);


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2




% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.tela_lose);
telaInicial;
