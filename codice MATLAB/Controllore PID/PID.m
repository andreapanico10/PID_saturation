function varargout = PID(varargin)
% PID MATLAB code for PID.fig
%      PID, by itself, creates a new PID or raises the existing
%      singleton*.
%
%      H = PID returns the handle to a new PID or the handle to
%      the existing singleton*.
%
%      PID('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PID.M with the given input arguments.
%
%      PID('Property','Value',...) creates a new PID or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PID_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PID_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PID

% Last Modified by GUIDE v2.5 06-Aug-2020 18:46:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PID_OpeningFcn, ...
                   'gui_OutputFcn',  @PID_OutputFcn, ...
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


% --- Executes just before PID is made visible.
function PID_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PID (see VARARGIN)

% Choose default command line output for PID
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PID wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PID_OutputFcn(hObject, eventdata, handles) 
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

ki = str2double(get(handles.Ki,'String'));
kp = str2double(get(handles.Kp,'String'));
kd = str2double(get(handles.Kd,'String'));

R=pid(kp,ki,kd);
G=H*R;

L=feedback(G,1);
figure(4)
impulse(L),grid;


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

ki = str2double(get(handles.Ki,'String'));
kp = str2double(get(handles.Kp,'String'));
kd = str2double(get(handles.Kd,'String'));

R=pid(kp,ki,kd);
G=H*R;

L=feedback(G,1);
figure(2);
step(L),grid;


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

ki = str2double(get(handles.Ki,'String'));
kp = str2double(get(handles.Kp,'String'));
kd = str2double(get(handles.Kd,'String'));

R=pid(kp,ki,kd);
G=H*R;

L=feedback(G,1);

t=[0:0.01:20];
u=sin(t);
figure(3);
lsim(L,u,t);

function Kp_Callback(hObject, eventdata, handles)
% hObject    handle to Kp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Kp as text
%        str2double(get(hObject,'String')) returns contents of Kp as a double


% --- Executes during object creation, after setting all properties.
function Kp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Kp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ki_Callback(hObject, eventdata, handles)
% hObject    handle to Ki (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ki as text
%        str2double(get(hObject,'String')) returns contents of Ki as a double


% --- Executes during object creation, after setting all properties.
function Ki_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ki (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Kd_Callback(hObject, eventdata, handles)
% hObject    handle to Kd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Kd as text
%        str2double(get(hObject,'String')) returns contents of Kd as a double


% --- Executes during object creation, after setting all properties.
function Kd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Kd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PID.
function PID_Callback(hObject, eventdata, handles)
% hObject    handle to PID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

num = cell2mat( textscan( get(handles.numeratore,'string'), '%f' ) );
den = cell2mat( textscan( get(handles.denominatore,'string'), '%f' ) );
num=num';
den=den';
H = tf(num,den);

ki = str2double(get(handles.Ki,'String'));
kp = str2double(get(handles.Kp,'String'));
kd = str2double(get(handles.Kd,'String'));

R=pid(kp,ki,kd);
figure,bode(H),grid;
hold on
G=H*R;
bode(G,'r');

g = evalc('G');
set(handles.transferfunction,'String',g);


% --- Executes on button press in retroazione.
function retroazione_Callback(hObject, eventdata, handles)
% hObject    handle to retroazione (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num = cell2mat( textscan( get(handles.numeratore,'string'), '%f' ) );
den = cell2mat( textscan( get(handles.denominatore,'string'), '%f' ) );
num=num';
den=den';
H = tf(num,den);

ki = str2double(get(handles.Ki,'String'));
kp = str2double(get(handles.Kp,'String'));
kd = str2double(get(handles.Kd,'String'));

R=pid(kp,ki,kd);
G=H*R;

L=feedback(G,1);
m=evalc('L');
set(handles.transferfunction,'String',m);