function varargout = ParabolicBlend(varargin)
% PARABOLICBLEND MATLAB code for ParabolicBlend.fig
%      PARABOLICBLEND, by itself, creates a new PARABOLICBLEND or raises the existing
%      singleton*.
%
%      H = PARABOLICBLEND returns the handle to a new PARABOLICBLEND or the handle to
%      the existing singleton*.
%
%      PARABOLICBLEND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARABOLICBLEND.M with the given input arguments.
%
%      PARABOLICBLEND('Property','Value',...) creates a new PARABOLICBLEND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ParabolicBlend_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ParabolicBlend_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ParabolicBlend

% Last Modified by GUIDE v2.5 26-Aug-2019 14:32:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @ParabolicBlend_OpeningFcn, ...
    'gui_OutputFcn',  @ParabolicBlend_OutputFcn, ...
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


% --- Executes just before ParabolicBlend is made visible.
function ParabolicBlend_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ParabolicBlend (see VARARGIN)

% Choose default command line output for ParabolicBlend
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ParabolicBlend wait for user response (see UIRESUME)
% uiwait(handles.figure1);
starting = [0,0,0,0];
set(handles.tbMoveBlend,'data',starting);

% --- Outputs from this function are returned to the command line.
function varargout = ParabolicBlend_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edPBPosInicial_Callback(hObject, eventdata, handles)
% hObject    handle to edPBPosInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edPBPosInicial as text
%        str2double(get(hObject,'String')) returns contents of edPBPosInicial as a double


% --- Executes during object creation, after setting all properties.
function edPBPosInicial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edPBPosInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edPBPosFinal_Callback(hObject, eventdata, handles)
% hObject    handle to edPBPosFinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edPBPosFinal as text
%        str2double(get(hObject,'String')) returns contents of edPBPosFinal as a double


% --- Executes during object creation, after setting all properties.
function edPBPosFinal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edPBPosFinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edPBVelocidade_Callback(hObject, eventdata, handles)
% hObject    handle to edPBVelocidade (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edPBVelocidade as text
%        str2double(get(hObject,'String')) returns contents of edPBVelocidade as a double


% --- Executes during object creation, after setting all properties.
function edPBVelocidade_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edPBVelocidade (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edPBTempo_Callback(hObject, eventdata, handles)
% hObject    handle to edPBTempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edPBTempo as text
%        str2double(get(hObject,'String')) returns contents of edPBTempo as a double


% --- Executes during object creation, after setting all properties.
function edPBTempo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edPBTempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PlotPB.
function PlotPB_Callback(hObject, eventdata, handles)
% hObject    handle to PlotPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global q;
global qd;
global qdd;
global s;
global sd;
global sdd;

q = 0; qd = 0; qdd = 0;
s = 0; sd = 0; sdd = 0;


qi = str2double(get(handles.edPBPosInicial, 'String'));
qf = str2double(get(handles.edPBPosFinal, 'String'));
tf = str2double(get(handles.edPBTempo, 'String'));
V  = str2double(get(handles.edPBVelocidade, 'String'));

if V == 0
    
    %Aceleração
    qcdd = 4 *(qf - qi) / ( tf ^ 2)+3;% (4.7)
    tc = tf/2 - (1/2)*sqrt((tf^2*qcdd-4*(qf-qi))/qcdd ); %(4.6)
    
    for t = 0.01:0.01:tf;
        if  t  <= tc,
            q = [q, qi + 1/2*qcdd*t^2];
            qd = [qd, qcdd*t];
            qdd = [qdd, qcdd];
        end
        if  (t > tc) & t <=(tf - tc)
            q = [q,  qi + qcdd*tc *(t - tc/2)];
            qd = [qd, qcdd*tc*(1)];
            qdd = [qdd, 0];
        end
        if (t > (tf - tc)) & (t <= tf)
            q = [q, qf - 1/2 * qcdd *(tf - t)^2];
            qd = [qd, qcdd*(tf-t)];
            qdd = [qdd, -qcdd];
        end
    end
    % Plots
    t = [0: 0.01: tf];
    %axesHandle = findobj('Tag', 'PlotParabolicBlend')
    plot(handles.PlotParabolicBlend,t,q,t,qd,t,qdd);
    
    % Inserindo na tabela
    oldData = get(handles.tbMoveBlend,'Data')
    newData = [oldData;qi,qf,V,tf]
    set(handles.tbMoveBlend,'data',newData);
end

if V ~= 0
    
    tb = (qi - qf + V*tf)/V;
    a = V/tb;
    
    if tb > 0
        
        for  t = 0.01:0.01:tf;
            if t <= tb
                s =[s, qi + a/2*t^2];
                sd =[sd, a*t];
                sdd =[sdd, a];
            elseif t <= (tf-tb)
                s =[s, (qf+qi-V*tf)/2 + V*t];
                sd =[sd, V];
                sdd =[sdd, 0];
            else
                s =[s, qf - a/2*tf^2 + a*tf*t - a/2*t^2];
                sd =[sd, a*tf - a*t];
                sdd =[sdd, -a];
            end
        end
        % Plot
        t = [0: 0.01: tf];
        plot(handles.PlotParabolicBlend,t,s,t,sd,t,sdd);
        % Inserindo na tabela
        oldData = get(handles.tbMoveBlend,'Data')
        newData = [oldData;qi,qf,V,tf]
        set(handles.tbMoveBlend,'data',newData);
        
    else
        f = errordlg('Time and Speed are not compatible ','Value Error');
        t = [0: 0.01: tf];
        s = 0; sd = 0; sdd = 0;
        plot(app.grafico,t, s,t,sd,t,sdd);
    end
end


%data = [cellstr(get(handles.edPBPosInicial, 'String')) , cellstr(get(handles.edPBPosFinal, 'String')), cellstr(get(handles.edPBTempo, 'String')), cellstr(get(handles.edPBVelocidade, 'String'))]
%set(handles.lbPBHistorico, 'String', data); 


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over PlotPB.
function PlotPB_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to PlotPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in lbPBHistorico.
function lbPBHistorico_Callback(hObject, eventdata, handles)
% hObject    handle to lbPBHistorico (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lbPBHistorico contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lbPBHistorico


% --- Executes during object creation, after setting all properties.
function lbPBHistorico_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lbPBHistorico (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uitable2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
Main();


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Interpola.
function Interpola_Callback(hObject, eventdata, handles)

global q;
global qd;
global qdd;
global s;
global sd;
global sdd;

mat_movimentos = get(handles.tbMoveBlend,'Data')
linhas  = size(mat_movimentos,1)

for i = 1:linhas         % Andando nas linhas
    for j = 1:4          % Andando nas colunas   
        qi = mat_movimentos(i,j);
        qf = mat_movimentos(i,j);
        tf = mat_movimentos(i,j);
        V  = mat_movimentos(i,j);
        

    end
end
