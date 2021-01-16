function varargout = ger_traj_1(varargin)
% GER_TRAJ_1 MATLAB code for ger_traj_1.fig
%      GER_TRAJ_1, by itself, creates a new GER_TRAJ_1 or raises the existing
%      singleton*.
%
%      H = GER_TRAJ_1 returns the handle to a new GER_TRAJ_1 or the handle to
%      the existing singleton*.
%
%      GER_TRAJ_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GER_TRAJ_1.M with the given input arguments.
%
%      GER_TRAJ_1('Property','Value',...) creates a new GER_TRAJ_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ger_traj_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ger_traj_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ger_traj_1

% Last Modified by GUIDE v2.5 29-Sep-2014 18:36:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ger_traj_1_OpeningFcn, ...
                   'gui_OutputFcn',  @ger_traj_1_OutputFcn, ...
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


% --- Executes just before ger_traj_1 is made visible.
function ger_traj_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ger_traj_1 (see VARARGIN)

% Choose default command line output for ger_traj_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ger_traj_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ger_traj_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function tf_3_Callback(hObject, eventdata, handles)
% hObject    handle to tf_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tf_3 as text
%        str2double(get(hObject,'String')) returns contents of tf_3 as a double


% --- Executes during object creation, after setting all properties.
function tf_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tf_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vi_3_Callback(hObject, eventdata, handles)
% hObject    handle to vi_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vi_3 as text
%        str2double(get(hObject,'String')) returns contents of vi_3 as a double


% --- Executes during object creation, after setting all properties.
function vi_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vi_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vf_3_Callback(hObject, eventdata, handles)
% hObject    handle to vf_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vf_3 as text
%        str2double(get(hObject,'String')) returns contents of vf_3 as a double


% --- Executes during object creation, after setting all properties.
function vf_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vf_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tf_5_Callback(hObject, eventdata, handles)
% hObject    handle to tf_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tf_5 as text
%        str2double(get(hObject,'String')) returns contents of tf_5 as a double


% --- Executes during object creation, after setting all properties.
function tf_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tf_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vi_5_Callback(hObject, eventdata, handles)
% hObject    handle to vi_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vi_5 as text
%        str2double(get(hObject,'String')) returns contents of vi_5 as a double


% --- Executes during object creation, after setting all properties.
function vi_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vi_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vf_5_Callback(hObject, eventdata, handles)
% hObject    handle to vf_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vf_5 as text
%        str2double(get(hObject,'String')) returns contents of vf_5 as a double


% --- Executes during object creation, after setting all properties.
function vf_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vf_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ai_5_Callback(hObject, eventdata, handles)
% hObject    handle to ai_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ai_5 as text
%        str2double(get(hObject,'String')) returns contents of ai_5 as a double


% --- Executes during object creation, after setting all properties.
function ai_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ai_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function af_5_Callback(hObject, eventdata, handles)
% hObject    handle to af_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of af_5 as text
%        str2double(get(hObject,'String')) returns contents of af_5 as a double


% --- Executes during object creation, after setting all properties.
function af_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to af_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tf_l_Callback(hObject, eventdata, handles)
% hObject    handle to tf_l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tf_l as text
%        str2double(get(hObject,'String')) returns contents of tf_l as a double


% --- Executes during object creation, after setting all properties.
function tf_l_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tf_l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w_l_Callback(hObject, eventdata, handles)
% hObject    handle to w_l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w_l as text
%        str2double(get(hObject,'String')) returns contents of w_l as a double


% --- Executes during object creation, after setting all properties.
function w_l_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w_l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function p_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in b_concluido.
function b_concluido_Callback(hObject, eventdata, handles)
% hObject    handle to b_concluido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tf_3=str2num(get(handles.tf_3,'string'));
vi_3=str2num(get(handles.vi_3,'string'));
vf_3=str2num(get(handles.vf_3,'string'));
tf_5=str2num(get(handles.tf_5,'string'));
vi_5=str2num(get(handles.vi_5,'string'));
vf_5=str2num(get(handles.vf_5,'string'));
ai_5=str2num(get(handles.ai_5,'string'));
af_5=str2num(get(handles.af_5,'string'));
tf_l=str2num(get(handles.tf_l,'string'));
w_l=str2num(get(handles.w_l,'string'));
if get(handles.p_3,'value')==1
    t_t=0;
end
if get(handles.p_5,'value')==1
    t_t=1;
end
if get(handles.l_p,'value')==1
   t_t=2;
end
save('d_2', 'tf_3','vi_3','vf_3','tf_5','vi_5','vf_5','ai_5','af_5','tf_l','w_l','t_t');
close;




% --- Executes on button press in b_cancelar.
function b_cancelar_Callback(hObject, eventdata, handles)

close;


% hObject    handle to b_cancelar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function p_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB


% --- Executes during object creation, after setting all properties.
function l_p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l_p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes when uipanel1 is resized.
function uipanel1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in b_retornar.
function b_retornar_Callback(hObject, eventdata, handles)
% hObject    handle to b_retornar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('d_2', 'tf_3','vi_3','vf_3','tf_5','vi_5','vf_5','ai_5','af_5','tf_l','w_l','t_t');
set(handles.tf_3,'string', tf_3);
set(handles.vi_3,'string', vi_3);
set(handles.vf_3,'string', vf_3);
set(handles.tf_5,'string', tf_5);
set(handles.vi_5,'string', vi_5);
set(handles.vf_5,'string', vf_5);
set(handles.ai_5,'string', ai_5);
set(handles.af_5,'string', af_5);
set(handles.tf_l,'string', tf_l);
set(handles.w_l,'string', w_l);

if t_t==0
    set(handles.p_3,'value', 1);
end
if t_t==1
    set(handles.p_5,'value',1);
end
if t_t==2
   set(handles.l_p,'value',1);
end
