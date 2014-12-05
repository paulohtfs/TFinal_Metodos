function varargout = telaWin(varargin)
% TELAWIN MATLAB code for telaWin.fig
%      TELAWIN, by itself, creates a new TELAWIN or raises the existing
%      singleton*.
%
%      H = TELAWIN returns the handle to a new TELAWIN or the handle to
%      the existing singleton*.
%
%      TELAWIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TELAWIN.M with the given input arguments.
%
%      TELAWIN('Property','Value',...) creates a new TELAWIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before telaWin_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to telaWin_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help telaWin

% Last Modified by GUIDE v2.5 05-Dec-2014 14:05:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @telaWin_OpeningFcn, ...
                   'gui_OutputFcn',  @telaWin_OutputFcn, ...
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


% --- Executes just before telaWin is made visible.
function telaWin_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to telaWin (see VARARGIN)

% Choose default command line output for telaWin
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
bg_image = imread('telaWin.jpg');
hi = imagesc(bg_image);
colormap gray

% Turn the handlevisibility off so that we don't inadvertently plot into the axes again
% Also, make the axes invisible
set(ha,'handlevisibility','off', ...
            'visible','off');
% UIWAIT makes telaWin wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = telaWin_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
