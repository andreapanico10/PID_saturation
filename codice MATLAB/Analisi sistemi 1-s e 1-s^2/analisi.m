function varargout = analisi(varargin)
% ANALISI MATLAB code for analisi.fig
%      ANALISI, by itself, creates a new ANALISI or raises the existing
%      singleton*.
%
%      H = ANALISI returns the handle to a new ANALISI or the handle to
%      the existing singleton*.
%
%      ANALISI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANALISI.M with the given input arguments.
%
%      ANALISI('Property','Value',...) creates a new ANALISI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before analisi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to analisi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help analisi

% Last Modified by GUIDE v2.5 06-Aug-2020 12:45:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @analisi_OpeningFcn, ...
                   'gui_OutputFcn',  @analisi_OutputFcn, ...
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


% --- Executes just before analisi is made visible.
function analisi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to analisi (see VARARGIN)

% Choose default command line output for analisi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes analisi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = analisi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in P.
function P_Callback(hObject, eventdata, handles)
% hObject    handle to P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of P


% --- Executes on button press in I.
function I_Callback(hObject, eventdata, handles)
% hObject    handle to I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of I


% --- Executes on button press in PI.
function PI_Callback(hObject, eventdata, handles)
% hObject    handle to PI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PI


% --- Executes on button press in PD.
function PD_Callback(hObject, eventdata, handles)
% hObject    handle to PD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PD

% --- Executes on button press in BODE.
function BODE_Callback(hObject, eventdata, handles)
% hObject    handle to BODE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

pos = get(handles.scelta,'SelectedObject');
tipo = get(pos,'String');

kappa = str2double(get(handles.k,'String'));
if strcmp(tipo,'1°ordine k/s')
    num=[kappa]
    den=[1 0];
    H=tf(num,den);
    figure,bode(H,{0.0001,10000}),grid;
    
    h = bodeplot(H,{0.0001,10000}),grid;
    options = getoptions(h);
    options.Title.String = 'Diagrammi di Bode del sistema k/s';
    setoptions(h,options);
    
    
end

if strcmp(tipo,'2°ordine k/s^2')
    num=[ kappa ];
    den=[1 0 0];
    H=tf(num,den);
    figure,bode(H,{0.0001,10000}),grid;   
    
    h = bodeplot(H,{0.0001,10000}),grid;
    options = getoptions(h);
    options.Title.String = 'Diagrammi di Bode del sistema k/s^2';
    setoptions(h,options);
end



function k_Callback(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k as text
%        str2double(get(hObject,'String')) returns contents of k as a double


% --- Executes during object creation, after setting all properties.
function k_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kp_Callback(hObject, eventdata, handles)
% hObject    handle to kp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kp as text
%        str2double(get(hObject,'String')) returns contents of kp as a double


% --- Executes during object creation, after setting all properties.
function kp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ki_Callback(hObject, eventdata, handles)
% hObject    handle to ki (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ki as text
%        str2double(get(hObject,'String')) returns contents of ki as a double


% --- Executes during object creation, after setting all properties.
function ki_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ki (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kd_Callback(hObject, eventdata, handles)
% hObject    handle to kd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kd as text
%        str2double(get(hObject,'String')) returns contents of kd as a double


% --- Executes during object creation, after setting all properties.
function kd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in retroazione.
function retroazione_Callback(hObject, eventdata, handles)
% hObject    handle to retroazione (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pos = get(handles.scelta,'SelectedObject');
tipo = get(pos,'String');

position = get(handles.controllore,'SelectedObject');
control = get(position,'String');

kappa = str2double(get(handles.k,'String'));

ki = str2double(get(handles.ki,'String'));
kp = str2double(get(handles.kp,'String'));
kd = str2double(get(handles.kd,'String'));

if strcmp(tipo,'1°ordine k/s')
    num = [kappa];
    den=[1 0];
    H=tf(num,den);
    %figure,bode(H,{0.0001,10000}),grid;
    
    %h = bodeplot(H,{0.0001,10000}),grid;
    %options = getoptions(h);
    %options.Title.String = 'Diagrammi di Bode del sistema k/s';
    %setoptions(h,options);
    
    
end

if strcmp(tipo,'2°ordine k/s^2')
    num=[ kappa ];
    den=[1 0 0];
    H=tf(num,den);
    %figure,bode(H,{0.0001,10000}),grid;   
    
    h = bodeplot(H,{0.0001,10000}),grid;
    options = getoptions(h);
    options.Title.String = 'Diagrammi di Bode del sistema k/s^2';
    setoptions(h,options);
end

if strcmp(control,'P')
    R=kp;
    G=feedback(H*R,1);
    figure,bode(G,{0.0001,10000}),grid;
    
    h = bodeplot(G,{0.0001,10000}),grid;
    options = getoptions(h);
    options.Title.String = 'Diagrammi di Bode del sistema retroazionoato con sola azione proporzionale P';
    setoptions(h,options);
end

if strcmp(control,'I')
    numer = [ki];
    denom = [1 0];
    R=tf(numer,denom);
   
    G=feedback(H*R,1);
    figure,bode(G,{0.0001,10000}),grid;
    
    h = bodeplot(G,{0.0001,10000}),grid;
    options = getoptions(h);
    options.Title.String = 'Diagrammi di Bode del sistema retroazionoato con sola azione integrativa I';
    setoptions(h,options);
    
end


if strcmp(control,'PI')
    numer = [kp ki];
    denom = [1 0];
    R=tf(numer,denom);
    G=feedback(H*R,1);
    figure,bode(G,{0.0001,10000}),grid;
    
    h = bodeplot(G,{0.0001,10000}),grid;
    options = getoptions(h);
    options.Title.String = 'Diagrammi di Bode del sistema retroazionoato con azione PI';
    setoptions(h,options);
    
    hold on
    bode(H,'r');
end


if strcmp(control,'PD')
    numer = [kd kp];
    denom = [1];
    R=tf(numer,denom);
    G=feedback(H*R,1);
    figure,bode(G,{0.0001,10000}),grid;
    
    h = bodeplot(G,{0.0001,10000}),grid;
    options = getoptions(h);
    options.Title.String = 'Diagrammi di Bode del sistema retroazionoato con azione PD';
    setoptions(h,options);
    
    hold on
    bode(H,'r');
end

if strcmp(control,'D')
    numer = [kd 0];
    denom = [1];
    R=tf(numer,denom);
    G=feedback(H*R);
    figure,bode(G,{0.0001,10000}),grid;
    
    h = bodeplot(G,{0.0001,10000}),grid;
    options = getoptions(h);
    options.Title.String = 'Diagrammi di Bode del sistema retroazionoato con sola azione D';
    setoptions(h,options);
    
    hold on
    bode(H,'r');
end

% --- Executes on button press in Bode2.
function Bode2_Callback(hObject, eventdata, handles)
% hObject    handle to Bode2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pos = get(handles.scelta,'SelectedObject');
tipo = get(pos,'String');

position = get(handles.controllore,'SelectedObject');
control = get(position,'String');

kappa = str2double(get(handles.k,'String'));

ki = str2double(get(handles.ki,'String'));
kp = str2double(get(handles.kp,'String'));
kd = str2double(get(handles.kd,'String'));

if strcmp(tipo,'1°ordine k/s')
    num = [kappa];
    den=[1 0];
    H=tf(num,den);
        
end

if strcmp(tipo,'2°ordine k/s^2')
    num=[ kappa ];
    den=[1 0 0];
    H=tf(num,den);
    %figure,bode(H,{0.0001,10000}),grid;   
    
    h = bodeplot(H,{0.0001,10000}),grid;
    options = getoptions(h);
    options.Title.String = 'Diagrammi di Bode del sistema k/s^2';
    setoptions(h,options);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%copia e incolla la funzione precedente,togliendo feedback
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if strcmp(control,'P')
    R=kp;
    G=(H*R);
    figure,bode(G,{0.0001,10000}),grid;
    
    h = bodeplot(G,{0.0001,10000}),grid;
    options = getoptions(h);
    options.Title.String = 'Diagrammi di Bode del sistema retroazionoato con sola azione proporzionale P';
    setoptions(h,options);
end

if strcmp(control,'I')
    numer = [ki];
    denom = [1 0];
    R=tf(numer,denom);
    G=(H*R);
    figure,bode(G,{0.0001,10000}),grid;
    
    h = bodeplot(G,{0.0001,10000}),grid;
    options = getoptions(h);
    options.Title.String = 'Diagrammi di Bode del sistema retroazionoato con sola azione integrativa I';
    setoptions(h,options);
    
    hold on
    bode(H,'r');
end

if strcmp(control,'PI')
    numer = [kp ki];
    denom = [1 0];
    R=tf(numer,denom);
    G=(H*R);
    figure,bode(G,{0.0001,10000}),grid;
    
    h = bodeplot(G,{0.0001,10000}),grid;
    options = getoptions(h);
    options.Title.String = 'Diagrammi di Bode del sistema retroazionoato con azione PI';
    setoptions(h,options);
    
    hold on
    bode(H,'r');
end

if strcmp(control,'PD')
    numer = [kd kp];
    denom = [1];
    R=tf(numer,denom);
    G=(H*R);
    figure,bode(G,{0.0001,10000}),grid;
    
    h = bodeplot(G,{0.0001,10000}),grid;
    options = getoptions(h);
    options.Title.String = 'Diagrammi di Bode del sistema retroazionoato con azione PD';
    setoptions(h,options);
    
    hold on
    bode(H,'r');
end

if strcmp(control,'D')
    numer = [kd 0];
    denom = [1];
    R=tf(numer,denom);
    G=(H*R);
    figure,bode(G,{0.0001,10000}),grid;
    
    h = bodeplot(G,{0.0001,10000}),grid;
    options = getoptions(h);
    options.Title.String = 'Diagrammi di Bode del sistema retroazionoato con sola azione D';
    setoptions(h,options);
    
    hold on
    bode(H,'r');
end
