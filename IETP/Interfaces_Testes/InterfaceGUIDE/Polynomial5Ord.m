function varargout = Polynomial5Ord(varargin)
% POLYNOMIAL5ORD MATLAB code for Polynomial5Ord.fig
%      POLYNOMIAL5ORD, by itself, creates a new POLYNOMIAL5ORD or raises the existing
%      singleton*.
%
%      H = POLYNOMIAL5ORD returns the handle to a new POLYNOMIAL5ORD or the handle to
%      the existing singleton*.
%
%      POLYNOMIAL5ORD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POLYNOMIAL5ORD.M with the given input arguments.
%
%      POLYNOMIAL5ORD('Property','Value',...) creates a new POLYNOMIAL5ORD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Polynomial5Ord_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Polynomial5Ord_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Polynomial5Ord

% Last Modified by GUIDE v2.5 26-Aug-2019 10:42:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Polynomial5Ord_OpeningFcn, ...
                   'gui_OutputFcn',  @Polynomial5Ord_OutputFcn, ...
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


% --- Executes just before Polynomial5Ord is made visible.
function Polynomial5Ord_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Polynomial5Ord (see VARARGIN)

% Choose default command line output for Polynomial5Ord
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Polynomial5Ord wait for user response (see UIRESUME)
% uiwait(handles.figure1);
    starting = [0,0,0,0];
    set(handles.tbMove5ORD,'data',starting);

% --- Outputs from this function are returned to the command line.
function varargout = Polynomial5Ord_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
Main();


function edPosInicial_Callback(hObject, eventdata, handles)
% hObject    handle to edPosInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edPosInicial as text
%        str2double(get(hObject,'String')) returns contents of edPosInicial as a double


% --- Executes during object creation, after setting all properties.
function edPosInicial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edPosInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edPosFinal_Callback(hObject, eventdata, handles)
% hObject    handle to edPosFinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edPosFinal as text
%        str2double(get(hObject,'String')) returns contents of edPosFinal as a double


% --- Executes during object creation, after setting all properties.
function edPosFinal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edPosFinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edTempo_Callback(hObject, eventdata, handles)
% hObject    handle to edTempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edTempo as text
%        str2double(get(hObject,'String')) returns contents of edTempo as a double


% --- Executes during object creation, after setting all properties.
function edTempo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edTempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
            q=0; qd=0;  qdd=0;
            
            %Geração de trajetória polinomial de quinta ordem
            q0   = str2double(get(handles.edPosInicial, 'String'));         
            qf   = str2double(get(handles.edPosFinal, 'String'));
            qd0  = 0;     
            qdf  = 0;      
            qdd0 = str2double(get(handles.edAce, 'String'));
            qddf = -str2double(get(handles.edAce, 'String'));
            
            tf = str2double(get(handles.edTempo, 'String'));
            

            A = [    1      0         0         0        0         0; 
                     1     tf     tf^2      tf^3      tf^4      tf^5; 
                     0      1        0         0         0         0; 
                     0      1     2*tf    3*tf^2    4*tf^3    5*tf^4; 
                     0      0       2          0         0         0; 
                     0      0       2       6*tf   12*tf^2   20*tf^3];

            C = inv(A)*[q0,    qf,    qd0,  qdf,     qdd0,  qddf ]';
            
            c0 = C(1); c1 = C(2); c2 = C(3); c3 = C(4); c4 = C(5); c5 = C(6);
            
            for t = 0.01:0.01:tf;
                
                q = [q, c0+(c1*t)+(c2*t^2)+(c3*t^3)+(c4*(t^4))+(c5*(t^5))];
                qd = [qd, c1+(2*c2*t)+(3*c3*t^2)+(4*c4*(t^3))+(5*c5*(t^4))];
                qdd = [qdd, 2*c2+(6*c3*t)+(12*c4*(t^2))+(20*c5*(t^3))];
                
            end
            
            % Plots
            t = [0: 0.01: tf];
            plot(handles.PlotPol5ORD,t,q,t,qd,t,qdd);

            % Inserindo na tabela
            oldData = get(handles.tbMove5ORD,'Data');
            newData = [oldData;q0,qf,tf,qdf];
            set(handles.tbMove5ORD,'data',newData);
            
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edAce_Callback(hObject, eventdata, handles)
% hObject    handle to edAce (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edAce as text
%        str2double(get(hObject,'String')) returns contents of edAce as a double


% --- Executes during object creation, after setting all properties.
function edAce_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edAce (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
