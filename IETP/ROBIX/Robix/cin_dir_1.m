function varargout = cin_dir_1(varargin)
% CIN_DIR_1 MATLAB code for cin_dir_1.fig
%      CIN_DIR_1, by itself, creates a new CIN_DIR_1 or raises the existing
%      singleton*.
%
%      H = CIN_DIR_1 returns the handle to a new CIN_DIR_1 or the handle to
%      the existing singleton*.
%
%      CIN_DIR_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CIN_DIR_1.M with the given input arguments.
%
%      CIN_DIR_1('Property','Value',...) creates a new CIN_DIR_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cin_dir_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cin_dir_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cin_dir_1

% Last Modified by GUIDE v2.5 29-Oct-2014 18:13:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cin_dir_1_OpeningFcn, ...
                   'gui_OutputFcn',  @cin_dir_1_OutputFcn, ...
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


% --- Executes just before cin_dir_1 is made visible.
function cin_dir_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cin_dir_1 (see VARARGIN)

% Choose default command line output for cin_dir_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cin_dir_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cin_dir_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function servo_2_Callback(hObject, eventdata, handles)
% hObject    handle to servo_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('d_1','posf','posi','X','Y','Z','x','y','z');

a2=(get(handles.servo_2,'value')*180)-90;
set(handles.t_servo2,'string',a2);
posf=[get(handles.servo_1,'value'),get(handles.servo_2,'value'),get(handles.servo_3,'value'),get(handles.servo_4,'value'),get(handles.servo_5,'value'),get(handles.servo_6,'value')];
save('d_1','posf','posi','X','Y','Z','x','y','z');
c_p;
g_traj;
set(handles.X,'string',X);
set(handles.Y,'string',Y);
set(handles.Z,'string',Z);
% Hints: get(hObject,'Value') returns p
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function servo_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to servo_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
load ('d_1','posi','posf');
set(hObject,'value',posf(2));

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function servo_1_Callback(hObject, eventdata, handles)
% hObject    handle to servo_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('d_1','posf','posi','X','Y','Z','x','y','z');

a1=(get(handles.servo_1,'value')*180)-90;
set(handles.t_servo1,'string',a1);
posf=[get(handles.servo_1,'value'),get(handles.servo_2,'value'),get(handles.servo_3,'value'),get(handles.servo_4,'value'),get(handles.servo_5,'value'),get(handles.servo_6,'value')];
save('d_1','posf','posi','X','Y','Z','x','y','z');
c_p;
g_traj;

set(handles.X,'string',X);
set(handles.Y,'string',Y);
set(handles.Z,'string',Z);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function servo_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to servo_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
load ('d_1','posf');
set(hObject,'value',posf(1));
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function servo_3_Callback(hObject, eventdata, handles)
% hObject    handle to servo_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('d_1','posf','posi','X','Y','Z','x','y','z');
a3=(get(handles.servo_3,'value')*180)-90;
set(handles.t_servo3,'string',a3);
posf=[get(handles.servo_1,'value'),get(handles.servo_2,'value'),get(handles.servo_3,'value'),get(handles.servo_4,'value'),get(handles.servo_5,'value'),get(handles.servo_6,'value')];
save ('d_1','posf','posi','X','Y','Z','x','y','z');
c_p;
g_traj;
set(handles.X,'string',X);
set(handles.Y,'string',Y);
set(handles.Z,'string',Z);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function servo_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to servo_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
load ('d_1','posf');
set(hObject,'value',posf(3));
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function servo_4_Callback(hObject, eventdata, handles)
% hObject    handle to servo_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('d_1','posf','posi','X','Y','Z','x','y','z');
a4=(get(handles.servo_4,'value')*180)-90;
set(handles.t_servo4,'string',a4);
posf=[get(handles.servo_1,'value'),get(handles.servo_2,'value'),get(handles.servo_3,'value'),get(handles.servo_4,'value'),get(handles.servo_5,'value'),get(handles.servo_6,'value')];
save ('d_1','posf','posi','X','Y','Z','x','y','z');
c_p;
g_traj;
set(handles.X,'string',X);
set(handles.Y,'string',Y);
set(handles.Z,'string',Z);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function servo_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to servo_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
load ('d_1','posf');
set(hObject,'value',posf(4));
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function servo_5_Callback(hObject, eventdata, handles)
% hObject    handle to servo_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('d_1','posf','posi','X','Y','Z','x','y','z');
a5=(get(handles.servo_5,'value')*180)-90;
set(handles.t_servo5,'string',a5);
posf=[get(handles.servo_1,'value'),get(handles.servo_2,'value'),get(handles.servo_3,'value'),get(handles.servo_4,'value'),get(handles.servo_5,'value'),get(handles.servo_6,'value')];
save ('d_1','posf','posi','X','Y','Z','x','y','z');
c_p;
g_traj;
set(handles.X,'string',X);
set(handles.Y,'string',Y);
set(handles.Z,'string',Z);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function servo_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to servo_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
load ('d_1','posf');
set(hObject,'value',posf(5));
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function servo_6_Callback(hObject, eventdata, handles)
% hObject    handle to servo_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('d_1','posf','posi','X','Y','Z','x','y','z');
a6=(get(handles.servo_6,'value')*180)-90;
set(handles.t_servo6,'string',a6);
posf=[get(handles.servo_1,'value'),get(handles.servo_2,'value'),get(handles.servo_3,'value'),get(handles.servo_4,'value'),get(handles.servo_5,'value'),get(handles.servo_6,'value')];
save ('d_1','posf','posi','X','Y','Z','x','y','z');
c_p;
g_traj;
set(handles.X,'string',X);
set(handles.Y,'string',Y);
set(handles.Z,'string',Z);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function servo_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to servo_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
load ('d_1','posf');
set(hObject,'value',posf(6));
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function arquivo_Callback(hObject, eventdata, handles)
% hObject    handle to arquivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function propriedades_Callback(hObject, eventdata, handles)
% hObject    handle to propriedades (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function N_d_h_Callback(hObject, eventdata, handles)
% hObject    handle to N_d_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function serial_Callback(hObject, eventdata, handles)
% hObject    handle to serial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function fechar_Callback(~, eventdata, handles)
% hObject    handle to fechar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


% --- Executes on button press in programar.
function programar_Callback(hObject, eventdata, handles)
% hObject    handle to programar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('d_5','b','n_t','aux');

c=',';
d='MOVE';
a_1=num2str((get(handles.servo_1,'value')*180)-90);
a_2=num2str((get(handles.servo_2,'value')*180)-90);
a_3=num2str((get(handles.servo_3,'value')*180)-90);
a_4=num2str((get(handles.servo_4,'value')*180)-90);
a_5=num2str((get(handles.servo_5,'value')*180)-90);
a_6=num2str((get(handles.servo_6,'value')*180)-90);
n=strcat(d,a_1,c,a_2,c,a_3,c,a_4,c,a_5,c,a_6);

h=size(n);
if h(2)<100
    for i=h(2):100
        n=[n,' '];
    end
end
b=[b;n];
aux=1;
o_1=size(b);
n_t=o_1(1);
save('d_5','b','n_t','aux');
close versao_1;
versao_1;

% --------------------------------------------------------------------
function trajetoria_Callback(hObject, eventdata, handles)
% hObject    handle to trajetoria (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function t_servo1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_servo1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
load ('d_1','posf');
set(hObject, 'string', (posf(1)*180)-90);

% --- Executes during object creation, after setting all properties.
function t_servo2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_servo2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
load ('d_1','posf');
set(hObject, 'string', (posf(2)*180)-90);



% --- Executes during object creation, after setting all properties.
function t_servo3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_servo3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
load ('d_1','posf');
set(hObject, 'string', (posf(3)*180)-90);



% --- Executes during object creation, after setting all properties.
function t_servo4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_servo4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
load ('d_1','posf');
set(hObject, 'string', (posf(4)*180)-90);


% --- Executes during object creation, after setting all properties.
function t_servo5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_servo5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
load ('d_1','posf');
set(hObject, 'string', (posf(5)*180)-90);


% --- Executes during object creation, after setting all properties.
function t_servo6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_servo6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
load ('d_1','posf');
set(hObject, 'string', (posf(6)*180)-90);


% --- Executes on button press in zerar.
function zerar_Callback(hObject, eventdata, handles)
load('d_1','posf','posi','X','Y','Z','x','y','z');

posf=[0.5,0.5,0.5,0.5,0.5,0.5];
set(handles.servo_1,'Value',posf(1));
set(handles.t_servo1, 'string', (posf(1)*180)-90);

set(handles.servo_2,'Value',posf(2));
set(handles.t_servo2, 'string', (posf(2)*180)-90);

set(handles.servo_3,'Value',posf(3));
set(handles.t_servo3, 'string', (posf(3)*180)-90);

set(handles.servo_4,'Value',posf(4));
set(handles.t_servo4, 'string', (posf(4)*180)-90);

set(handles.servo_5,'Value',posf(5));
set(handles.t_servo5, 'string', (posf(5)*180)-90);

set(handles.servo_6,'Value',posf(6));
set(handles.t_servo6, 'string', (posf(6)*180)-90);
save('d_1','posf','posi','X','Y','Z','x','y','z');
c_p;
g_traj;
set(handles.X,'string',X);
set(handles.Y,'string',Y);
set(handles.Z,'string',Z);
% hObject    handle to zerar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
c_p;
load('d_1','posf','posi','X','Y','Z','x','y','z');
set(hObject,'string',Y);
% --- Executes during object creation, after setting all properties.
function X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
c_p;
load('d_1','posf','posi','X','Y','Z','x','y','z');
set(hObject,'string',X);

% --- Executes during object creation, after setting all properties.
function Z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
c_p;
load('d_1','posf','posi','X','Y','Z','x','y','z');
set(hObject,'string',Z);