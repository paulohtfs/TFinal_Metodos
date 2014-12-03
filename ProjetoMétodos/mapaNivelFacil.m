function varargout = mapaNivelFacil(varargin)
% MAPANIVELFACIL MATLAB code for mapaNivelFacil.fig
%      MAPANIVELFACIL, by itself, creates a new MAPANIVELFACIL or raises the existing
%      singleton*.
%
%      H = MAPANIVELFACIL returns the handle to a new MAPANIVELFACIL or the handle to
%      the existing singleton*.
%
%      MAPANIVELFACIL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAPANIVELFACIL.M with the given input arguments.
%
%      MAPANIVELFACIL('Property','Value',...) creates a new MAPANIVELFACIL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mapaNivelFacil_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mapaNivelFacil_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mapaNivelFacil

% Last Modified by GUIDE v2.5 02-Dec-2014 23:15:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mapaNivelFacil_OpeningFcn, ...
                   'gui_OutputFcn',  @mapaNivelFacil_OutputFcn, ...
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


% --- Executes just before mapaNivelFacil is made visible.
function mapaNivelFacil_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mapaNivelFacil (see VARARGIN)

% Choose default command line output for mapaNivelFacil
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global CURRENT_LHAMA;
global NUMBER_OF_SHOTS;

set(handles.shots,'String',num2str(NUMBER_OF_SHOTS));

% This creates the 'background' axes
panhandle = handles.premio;
panax = axes('Units','normal', 'Position', [0 0 1 1], 'Parent', panhandle);

% Load in a background image and display it using the correct colors
% The image used below, is in the Image Processing Toolbox.  If you do not have %access to this toolbox, you can use another image file instead.
current_lhama = get_lhama(CURRENT_LHAMA);
lhama = imread(current_lhama);
imshow(lhama);

% UIWAIT makes mapaNivelFacil wait for user response (see UIRESUME)
% uiwait(handles.mapa_facil);


% --- Outputs from this function are returned to the command line.
function varargout = mapaNivelFacil_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MATRIZ;
MATRIZ = [1 1 ; 2 2];
primeiroNivelTela
close(handles.mapa_facil);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MATRIZ;
MATRIZ = [2 2 ; 3 3];
primeiroNivelTela
close(handles.mapa_facil);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MATRIZ;
MATRIZ = [3 3 ; 4 4];
primeiroNivelTela
close(handles.mapa_facil);


% --------------------------------------------------------------------
function uipanel1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
