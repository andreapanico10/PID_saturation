function varargout = bodediagrams(varargin)
% BODEDIAGRAMS MATLAB code for bodediagrams.fig
%      BODEDIAGRAMS, by itself, creates a new BODEDIAGRAMS or raises the existing
%      singleton*.
%
%      H = BODEDIAGRAMS returns the handle to a new BODEDIAGRAMS or the handle to
%      the existing singleton*.
%
%      BODEDIAGRAMS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BODEDIAGRAMS.M with the given input arguments.
%
%      BODEDIAGRAMS('Property','Value',...) creates a new BODEDIAGRAMS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bodediagrams_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bodediagrams_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bodediagrams

% Last Modified by GUIDE v2.5 05-Aug-2020 02:16:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bodediagrams_OpeningFcn, ...
                   'gui_OutputFcn',  @bodediagrams_OutputFcn, ...
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


% --- Executes just before bodediagrams is made visible.
function bodediagrams_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bodediagrams (see VARARGIN)

% Choose default command line output for bodediagrams
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bodediagrams wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bodediagrams_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function numeratore_Callback(hObject, eventdata, handles)
% hObject    handle to numeratore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numeratore as text
%        str2double(get(hObject,'String')) returns contents of numeratore as a double


% --- Executes during object creation, after setting all properties.
function numeratore_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numeratore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function denominatore_Callback(hObject, eventdata, handles)
% hObject    handle to denominatore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of denominatore as text
%        str2double(get(hObject,'String')) returns contents of denominatore as a double


% --- Executes during object creation, after setting all properties.
function denominatore_CreateFcn(hObject, eventdata, handles)
% hObject    handle to denominatore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Bode.
function Bode_Callback(hObject, eventdata, handles)
% hObject    handle to Bode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

num = cell2mat( textscan( get(handles.numeratore,'string'), '%f' ) );
den = cell2mat( textscan( get(handles.denominatore,'string'), '%f' ) );
num=num';
den=den';
H = tf(num,den);
G = evalc('H');
G
set(handles.transferfunction,'String',G);
figure(1);
bode(H),grid ;


% --- Executes on button press in impulso.
function impulso_Callback(hObject, eventdata, handles)
% hObject    handle to impulso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num = cell2mat( textscan( get(handles.numeratore,'string'), '%f' ) );
den = cell2mat( textscan( get(handles.denominatore,'string'), '%f' ) );
num=num';
den=den';
H = tf(num,den);
figure(2);
impulse(H),grid;


% --- Executes on button press in gradino.
function gradino_Callback(hObject, eventdata, handles)
% hObject    handle to gradino (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num = cell2mat( textscan( get(handles.numeratore,'string'), '%f' ) );
den = cell2mat( textscan( get(handles.denominatore,'string'), '%f' ) );
num=num';
den=den';
H = tf(num,den);
figure(2);
step(H),grid;


% --- Executes on button press in fdt.
function fdt_Callback(hObject, eventdata, handles)
% hObject    handle to fdt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num = cell2mat( textscan( get(handles.numeratore,'string'), '%f' ) );
den = cell2mat( textscan( get(handles.denominatore,'string'), '%f' ) );
num=num';
den=den';
H = tf(num,den);
G = evalc('H');
G
set(handles.transferfunction,'String',G);


% --- Executes on button press in sin.
function sin_Callback(hObject, eventdata, handles)
% hObject    handle to sin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num = cell2mat( textscan( get(handles.numeratore,'string'), '%f' ) );
den = cell2mat( textscan( get(handles.denominatore,'string'), '%f' ) );
num=num';
den=den';
H = tf(num,den);
t=[0:0.01:20];
u=sin(t);
figure(3)
lsim(H,u,t);
