function varargout = PredictorLayout(varargin)
% PREDICTORLAYOUT MATLAB code for PredictorLayout.fig
%      PREDICTORLAYOUT, by itself, creates a new PREDICTORLAYOUT or raises the existing
%      singleton*.
%
%      H = PREDICTORLAYOUT returns the handle to a new PREDICTORLAYOUT or the handle to
%      the existing singleton*.
%
%      PREDICTORLAYOUT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PREDICTORLAYOUT.M with the given input arguments.
%
%      PREDICTORLAYOUT('Property','Value',...) creates a new PREDICTORLAYOUT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PredictorLayout_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PredictorLayout_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PredictorLayout

% Last Modified by GUIDE v2.5 23-Nov-2018 22:01:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PredictorLayout_OpeningFcn, ...
                   'gui_OutputFcn',  @PredictorLayout_OutputFcn, ...
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


% --- Executes just before PredictorLayout is made visible.
function PredictorLayout_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PredictorLayout (see VARARGIN)

% Choose default command line output for PredictorLayout
handles.output = hObject;

%Displays the Premier league logo image 
a= imread('BPL Logos.jpg')
axes(handles.axes1)
imshow(a)

%Plays the Premier League Music at the beginning
[y,Fs] = audioread('PremMusicMenu.wav');
sound(y,Fs);


%Can't see table AND ANY TEXT before PREDICT! button is pushed
set(handles.poisson1,'visible','off'); 
set(handles.goalstext,'visible','off');
set(handles.Key1,'visible','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PredictorLayout wait for user response (see UIRESUME)
% uiwait(handles.wholelayout);


% --- Outputs from this function are returned to the command line.
function varargout = PredictorLayout_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure

varargout{1} = handles.output;


% --- Executes on selection change in AwayTeam_PopUp.
function AwayTeam_PopUp_Callback(hObject, eventdata, handles)
% hObject    handle to AwayTeam_PopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns AwayTeam_PopUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from AwayTeam_PopUp


% --- Executes during object creation, after setting all properties.
function AwayTeam_PopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AwayTeam_PopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in HomeTeam_PopUp.
function HomeTeam_PopUp_Callback(hObject, eventdata, handles)
% hObject    handle to HomeTeam_PopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns HomeTeam_PopUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from HomeTeam_PopUp


% --- Executes during object creation, after setting all properties.
function HomeTeam_PopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HomeTeam_PopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Predict_PushButton.
function Predict_PushButton_Callback(hObject, eventdata, handles)
set(handles.poisson1,'visible','on'); 
set(handles.goalstext,'visible','on');
set(handles.Key1,'visible','on');



% hObject    handle to Predict_PushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on wholelayout and none of its controls.
function wholelayout_KeyPressFcn(hObject, eventdata, handles)


% hObject    handle to wholelayout (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in poisson1.
function poisson1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to poisson1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in soundONpush.
function soundONpush_Callback(hObject, eventdata, handles)
% hObject    handle to soundONpush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[y,Fs] = audioread('PremMusicMenu.wav');
sound(y,Fs);



% --- Executes on button press in soundOFF.
function soundOFF_Callback(hObject, eventdata, handles)
% hObject    handle to soundOFF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear sound


% --- Executes on button press in exitpush.
function exitpush_Callback(hObject, eventdata, handles)
% hObject    handle to exitpush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear sound  % Turn off audio
clc; %Clears command Window 
set(handles.wholelayout,'visible','off'); %Closes down window  

  


% --- Executes on button press in resetpush.
function resetpush_Callback(hObject, eventdata, handles)
% hObject    handle to resetpush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.poisson1,'visible','off'); 
set(handles.goalstext,'visible','off');
set(handles.Key1,'visible','off');
