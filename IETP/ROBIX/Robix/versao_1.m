function varargout = versao_1(varargin)
% VERSAO_1 MATLAB code for versao_1.fig
%      VERSAO_1, by itself, creates a new VERSAO_1 or raises the existing
%      singleton*.
%
%      H = VERSAO_1 returns the handle to a new VERSAO_1 or the handle to
%      the existing singleton*.
%
%      VERSAO_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VERSAO_1.M with the given input arguments.
%
%      VERSAO_1('Property','Value',...) creates a new VERSAO_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before versao_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to versao_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help versao_1

% Last Modified by GUIDE v2.5 23-Oct-2019 17:58:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @versao_1_OpeningFcn, ...
    'gui_OutputFcn',  @versao_1_OutputFcn, ...
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


% --- Executes just before versao_1 is made visible.
function versao_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to versao_1 (see VARARGIN)

% Choose default command line output for versao_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes versao_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = versao_1_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in texto.
function texto_Callback(hObject, eventdata, handles)
% hObject    handle to texto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns texto contents as cell array
%        contents{get(hObject,'Value')} returns selected item from texto
load('d_5','b','n_t','aux');
n_t=get(hObject,'value');
save('d_5','b','n_t','aux');

% --- Executes during object creation, after setting all properties.
function texto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to texto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
load('d_5','b','n_t','aux');

if aux==1
    set(hObject,'string',b);
    aux=0;
    set(hObject,'value',n_t);
else
    b=[];
end
save('d_5','b','n_t','aux');
% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cinematica_direta.
function cinematica_direta_Callback(hObject, eventdata, handles)
% hObject    handle to cinematica_direta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cin_dir_1;




% --- Executes on button press in cinematica_inversa.
function cinematica_inversa_Callback(hObject, eventdata, handles)
% hObject    handle to cinematica_inversa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
D_h_1;



% --- Executes on button press in geracao_trajetorias.
function geracao_trajetorias_Callback(hObject, eventdata, handles)
% hObject    handle to geracao_trajetorias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ger_traj_1;



function digitar_codigo_Callback(hObject, eventdata, handles)
% hObject    handle to digitar_codigo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of digitar_codigo as text
%        str2double(get(hObject,'String')) returns contents of digitar_codigo as a double


% --- Executes during object creation, after setting all properties.
function digitar_codigo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to digitar_codigo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b_inserir.
function b_inserir_Callback(hObject, eventdata, handles)
% hObject    handle to b_inserir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('d_5','b','n_t','aux');
a=get(handles.digitar_codigo, 'string');
h=size(a);
if h(2)<100
    for i=h(2):100
        a=[a,' '];
    end
end
b=[get(handles.texto,'string');a];
set(handles.texto,'string',b);
o_1=size(b);
n_t=o_1(1);
set(handles.texto,'value',n_t);
save('d_5','b','n_t','aux');






% --------------------------------------------------------------------
function salvar_Callback(hObject, eventdata, handles)
% hObject    handle to salvar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[arq caminho]=uiputfile('*.txt','Salvar Arquivo');
if arq~=0
    a=get(handles.texto,'string');
    file=fopen([caminho,arq],'wt+');
    t=size(a);
    for i=1:t(1)
        fprintf(file,'%s \n',sprintf(a(i,:),'\n'));
    end
    fclose(file);
end


% --- Executes on button press in exc_line.
function exc_line_Callback(hObject, eventdata, handles)
% hObject    handle to exc_line (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Anal_cod;


% --- Executes on button press in exc_cod.
function exc_cod_Callback(hObject, eventdata, handles)
% hObject    handle to exc_cod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('d_2', 'tf_3','vi_3','vf_3','tf_5','vi_5','vf_5','ai_5','af_5','tf_l','w_l','t_t');
load('d_5','b','n_t','aux');
load('d_6','aux2','aux3');
aux2=0;
save('d_6','aux2','aux3');
switch t_t
    case 0
        tf=tf_3;
    case 1
        tf=tf_5;
    case 2
        tf=tf_l;
end

[li,co]=size(b);
for i=n_t:li
    load('d_6','aux2','aux3');
    if aux2==0
    %Anal_cod;
    if n_t<li 
    n_t=n_t+1;
    end
       set(handles.texto,'value',n_t);
    save('d_5','b','n_t','aux');
    pause(tf);
    else
        i=li;
    end
end 
% ------------------------------------------------------------------------
%  ---- Pegando os valores do listbox antes de iniciar o algoritmo de ----
% -------------------------- pontos depassagem ---------------------------
% ------------------------------------------------------------------------

% Numeros de itens no listbox
num = get( handles.texto, 'Value' );
% Laço para preencher os vetores de posições
for j=1:num
    for i=1:6
        if(j==1)
            listboxItems = cellstr( get(handles.texto, 'string') );
            selectedItems = get(handles.texto, 'value');
            selectedItem = char(listboxItems(j));
            teste = strsplit(selectedItem,',');
            % Condição para caso o i seja igual a 1, remover o MOVE
            if(i==1)
                novo = regexprep(teste(i),'MOVE','','ignorecase');
                posicoes_movimento1(i) = novo;
            else
                posicoes_movimento1(i) = teste(i);   % Posições Iniciais
            end
        end
        if(j==2)
            listboxItems = cellstr( get(handles.texto, 'string') );
            selectedItems = get(handles.texto, 'value');
            selectedItem = char(listboxItems(j));
            teste = strsplit(selectedItem,',');
            % Condição para caso o i seja igual a 1, remover o MOVE
            if(i==1)
                novo = regexprep(teste(i),'MOVE','','ignorecase');
                posicoes_movimento2(i) = novo;
            else
                posicoes_movimento2(i) = teste(i);   % Pontos de Passagem
            end
        end
        if(j==3)
            listboxItems = cellstr( get(handles.texto, 'string') );
            selectedItems = get(handles.texto, 'value');
            selectedItem = char(listboxItems(j));
            teste = strsplit(selectedItem,',');
            % Condição para caso o i seja igual a 1, remover o MOVE
            if(i==1)
                novo = regexprep(teste(i),'MOVE','','ignorecase');
                posicoes_movimento3(i) = novo;
            else
                posicoes_movimento3(i) = teste(i);   % Pontos de Passagem
            end
        end
        if(j==4)
            listboxItems = cellstr( get(handles.texto, 'string') );
            selectedItems = get(handles.texto, 'value');
            selectedItem = char(listboxItems(j));
            teste = strsplit(selectedItem,',');
            % Condição para caso o i seja igual a 1, remover o MOVE
            if(i==1)
                novo = regexprep(teste(i),'MOVE','','ignorecase');
                posicoes_movimento4(i) = novo;
            else
                posicoes_movimento4(i) = teste(i);   % Posições Finais
            end      
        end
    end
end

% Iniciando o algoritmo de cálculo dos pontos de passagem

% -----------------
% --- 1º Motor ----
% -----------------

% Ponto Inicial
vi   = 0;
ai   = 0;
posi_1 = ((90-(str2double(posicoes_movimento1(1))))/180)*255;
ti_1 = 0;
tf_1 = tf/3;
% Pontos de Passagem
% Ponto 1
posi_2 = ((90-(str2double(posicoes_movimento2(1))))/180)*255;
ti_2 = 0;
tf_2 = tf/3;
% Ponto 2
posi_3 = ((90-(str2double(posicoes_movimento3(1))))/180)*255;
ti_3 = 0;
tf_3 = tf/3;
% Ponto Final
posf_4 = ((90-(str2double(posicoes_movimento4(1))))/180)*255;
vf     = 0;
af     = 0;

theta_motor1 = [posi_1; vi;ai; posi_2; posi_2; 0; 0; posi_3; posi_3; 0; 0; posf_4; vf; af];

a = [1    0    0      0      0        0   0    0      0      0   0    0      0        0;
    0    1    0      0      0        0   0    0      0      0   0    0      0        0;
    0    0    2      0      0        0   0    0      0      0   0    0      0        0;
    1  tf_1 tf_1^2 tf_1^3 tf_1^4     0   0    0      0      0   0    0      0        0;
    0    0    0      0      0        1   0    0      0      0   0    0      0        0;
    0    1  2*tf_1 3*tf_1^2 4*tf_1^3 0  -1    0      0      0   0    0      0        0;
    0    0    2    6*tf_1 12*tf_1^2  0   0   -2      0      0   0    0      0        0;
    0    0    0      0      0        1 tf_2 tf_2^2 tf_2^3   0   0    0      0        0;
    0    0    0      0      0        0   0    0      0      1   0    0      0        0;
    0    0    0      0      0        0   1  2*tf_2 3*tf_2^2 0  -1    0      0        0;
    0    0    0      0      0        0   0    2    6*tf_2   0   0   -2      0        0;
    0    0    0      0      0        0   0    0      0      1 tf_3 tf_3^2 tf_3^3   tf_3^4;
    0    0    0      0      0        0   0    0      0      0   1  2*tf_3 3*tf_3^2 4*tf_3^3;
    0    0    0      0      0        0   0    0      0      0   0    2    6*tf_3   12*tf_3^2;];

c = inv(a)*theta_motor1;

% Primeiro Segmento
ta_1 = tf_1/100;

for t=0:99
    theta1_motor1(t+1)= c(1)+c(2)*(t*ta_1)+c(3)*((t*ta_1)^2)+c(4)*((t*ta_1)^3)+ (c(5)*(t*ta_1)^4);
    v1_motor1(t+1)= c(2)+2*c(3)*(t*ta_1)+(3*c(4)*(t*ta_1)^2)+(4*c(5)*(ta_1*t)^3);
    a1_motor1(t+1)= 2*c(3)+6*c(4)*(t*ta_1)+(12*c(5)*(t*ta_1)^2);
end

% Segundo Segmento
ta_2 = tf_2/100;

for t=0:99
    theta2_motor1(t+1)= c(6)+c(7)*(t*ta_2)+c(8)*((t*ta_2)^2)+c(9)*((t*ta_2)^3);
    v2_motor1(t+1)= c(7)+2*c(8)*(t*ta_2)+(3*c(9)*(t*ta_2)^2);
    a2_motor1(t+1)= 2*c(8)+6*c(9)*(t*ta_2);
end

% Segundo Segmento
ta_3 = tf_3/100;

for t=0:99
    theta3_motor1(t+1)= c(10)+c(11)*(t*ta_3)+c(12)*((t*ta_3)^2)+c(13)*((t*ta_3)^3)+ (c(14)*(t*ta_3)^4);
    v3_motor1(t+1)= c(11)+2*c(12)*(t*ta_3)+(3*c(13)*(t*ta_3)^2)+(4*c(14)*(ta_3*t)^3);
    a3_motor1(t+1)= 2*c(12)+6*c(13)*(t*ta_3)+(12*c(14)*(t*ta_3)^2);
end

theta_f_motor1 = [theta1_motor1 theta2_motor1 theta3_motor1];
v_f_motor1     = [v1_motor1 v2_motor1 v3_motor1];
a_f_motor1     = [a1_motor1 a2_motor1 a3_motor1];

% -----------------
% --- 2º Motor ----
% -----------------

% Ponto Inicial
vi   = 0;
ai   = 0;
posi_1 = ((90-(str2double(posicoes_movimento1(2))))/180)*255;
ti_1 = 0;
tf_1 = tf/3;
% Pontos de Passagem
% Ponto 1
posi_2 = ((90-(str2double(posicoes_movimento2(2))))/180)*255;
ti_2 = 0;
tf_2 = tf/3;
% Ponto 2
posi_3 = ((90-(str2double(posicoes_movimento3(2))))/180)*255;
ti_3 = 0;
tf_3 = tf/3;
% Ponto Final
posf_4 = ((90-(str2double(posicoes_movimento4(2))))/180)*255;
vf     = 0;
af     = 0;

theta_motor2 = [posi_1; vi;ai; posi_2; posi_2; 0; 0; posi_3; posi_3; 0; 0; posf_4; vf; af];

a = [1    0    0      0      0        0   0    0      0      0   0    0      0        0;
    0    1    0      0      0        0   0    0      0      0   0    0      0        0;
    0    0    2      0      0        0   0    0      0      0   0    0      0        0;
    1  tf_1 tf_1^2 tf_1^3 tf_1^4     0   0    0      0      0   0    0      0        0;
    0    0    0      0      0        1   0    0      0      0   0    0      0        0;
    0    1  2*tf_1 3*tf_1^2 4*tf_1^3 0  -1    0      0      0   0    0      0        0;
    0    0    2    6*tf_1 12*tf_1^2  0   0   -2      0      0   0    0      0        0;
    0    0    0      0      0        1 tf_2 tf_2^2 tf_2^3   0   0    0      0        0;
    0    0    0      0      0        0   0    0      0      1   0    0      0        0;
    0    0    0      0      0        0   1  2*tf_2 3*tf_2^2 0  -1    0      0        0;
    0    0    0      0      0        0   0    2    6*tf_2   0   0   -2      0        0;
    0    0    0      0      0        0   0    0      0      1 tf_3 tf_3^2 tf_3^3   tf_3^4;
    0    0    0      0      0        0   0    0      0      0   1  2*tf_3 3*tf_3^2 4*tf_3^3;
    0    0    0      0      0        0   0    0      0      0   0    2    6*tf_3   12*tf_3^2;];

c = inv(a)*theta_motor2;

% Primeiro Segmento
ta_1 = tf_1/100;

for t=0:99
    theta1_motor2(t+1)= c(1)+c(2)*(t*ta_1)+c(3)*((t*ta_1)^2)+c(4)*((t*ta_1)^3)+ (c(5)*(t*ta_1)^4);
    v1_motor2(t+1)= c(2)+2*c(3)*(t*ta_1)+(3*c(4)*(t*ta_1)^2)+(4*c(5)*(ta_1*t)^3);
    a1_motor2(t+1)= 2*c(3)+6*c(4)*(t*ta_1)+(12*c(5)*(t*ta_1)^2);
end

% Segundo Segmento
ta_2 = tf_2/100;

for t=0:99
    theta2_motor2(t+1)= c(6)+c(7)*(t*ta_2)+c(8)*((t*ta_2)^2)+c(9)*((t*ta_2)^3);
    v2_motor2(t+1)= c(7)+2*c(8)*(t*ta_2)+(3*c(9)*(t*ta_2)^2);
    a2_motor2(t+1)= 2*c(8)+6*c(9)*(t*ta_2);
end

% Segundo Segmento
ta_3 = tf_3/100;

for t=0:99
    theta3_motor2(t+1)= c(10)+c(11)*(t*ta_3)+c(12)*((t*ta_3)^2)+c(13)*((t*ta_3)^3)+ (c(14)*(t*ta_3)^4);
    v3_motor2(t+1)= c(11)+2*c(12)*(t*ta_3)+(3*c(13)*(t*ta_3)^2)+(4*c(14)*(ta_3*t)^3);
    a3_motor2(t+1)= 2*c(12)+6*c(13)*(t*ta_3)+(12*c(14)*(t*ta_3)^2);
end

theta_f_motor2 = [theta1_motor2 theta2_motor2 theta3_motor2];
v_f_motor2     = [v1_motor2 v2_motor2 v3_motor2];
a_f_motor2     = [a1_motor2 a2_motor2 a3_motor2];

% -----------------
% --- 3º Motor ----
% -----------------

% Ponto Inicial
vi   = 0;
ai   = 0;
posi_1 = ((90-(str2double(posicoes_movimento1(3))))/180)*255;
ti_1 = 0;
tf_1 = tf/3;
% Pontos de Passagem
% Ponto 1
posi_2 = ((90-(str2double(posicoes_movimento2(3))))/180)*255;
ti_2 = 0;
tf_2 = tf/3;
% Ponto 2
posi_3 = ((90-(str2double(posicoes_movimento3(3))))/180)*255;
ti_3 = 0;
tf_3 = tf/3;
% Ponto Final
posf_4 = ((90-(str2double(posicoes_movimento4(3))))/180)*255;
vf     = 0;
af     = 0;

theta_motor3 = [posi_1; vi;ai; posi_2; posi_2; 0; 0; posi_3; posi_3; 0; 0; posf_4; vf; af];

a = [1    0    0      0      0        0   0    0      0      0   0    0      0        0;
    0    1    0      0      0        0   0    0      0      0   0    0      0        0;
    0    0    2      0      0        0   0    0      0      0   0    0      0        0;
    1  tf_1 tf_1^2 tf_1^3 tf_1^4     0   0    0      0      0   0    0      0        0;
    0    0    0      0      0        1   0    0      0      0   0    0      0        0;
    0    1  2*tf_1 3*tf_1^2 4*tf_1^3 0  -1    0      0      0   0    0      0        0;
    0    0    2    6*tf_1 12*tf_1^2  0   0   -2      0      0   0    0      0        0;
    0    0    0      0      0        1 tf_2 tf_2^2 tf_2^3   0   0    0      0        0;
    0    0    0      0      0        0   0    0      0      1   0    0      0        0;
    0    0    0      0      0        0   1  2*tf_2 3*tf_2^2 0  -1    0      0        0;
    0    0    0      0      0        0   0    2    6*tf_2   0   0   -2      0        0;
    0    0    0      0      0        0   0    0      0      1 tf_3 tf_3^2 tf_3^3   tf_3^4;
    0    0    0      0      0        0   0    0      0      0   1  2*tf_3 3*tf_3^2 4*tf_3^3;
    0    0    0      0      0        0   0    0      0      0   0    2    6*tf_3   12*tf_3^2;];

c = inv(a)*theta_motor3;

% Primeiro Segmento
ta_1 = tf_1/100;

for t=0:99
    theta1_motor3(t+1)= c(1)+c(2)*(t*ta_1)+c(3)*((t*ta_1)^2)+c(4)*((t*ta_1)^3)+ (c(5)*(t*ta_1)^4);
    v1_motor3(t+1)= c(2)+2*c(3)*(t*ta_1)+(3*c(4)*(t*ta_1)^2)+(4*c(5)*(ta_1*t)^3);
    a1_motor3(t+1)= 2*c(3)+6*c(4)*(t*ta_1)+(12*c(5)*(t*ta_1)^2);
end

% Segundo Segmento
ta_2 = tf_2/100;

for t=0:99
    theta2_motor3(t+1)= c(6)+c(7)*(t*ta_2)+c(8)*((t*ta_2)^2)+c(9)*((t*ta_2)^3);
    v2_motor3(t+1)= c(7)+2*c(8)*(t*ta_2)+(3*c(9)*(t*ta_2)^2);
    a2_motor3(t+1)= 2*c(8)+6*c(9)*(t*ta_2);
end

% Segundo Segmento
ta_3 = tf_3/100;

for t=0:99
    theta3_motor3(t+1)= c(10)+c(11)*(t*ta_3)+c(12)*((t*ta_3)^2)+c(13)*((t*ta_3)^3)+ (c(14)*(t*ta_3)^4);
    v3_motor3(t+1)= c(11)+2*c(12)*(t*ta_3)+(3*c(13)*(t*ta_3)^2)+(4*c(14)*(ta_3*t)^3);
    a3_motor3(t+1)= 2*c(12)+6*c(13)*(t*ta_3)+(12*c(14)*(t*ta_3)^2);
end

theta_f_motor3 = [theta1_motor3 theta2_motor3 theta3_motor3];
v_f_motor3     = [v1_motor3 v2_motor3 v3_motor3];
a_f_motor3     = [a1_motor3 a2_motor3 a3_motor3];

% -----------------
% --- 4º Motor ----
% -----------------

% Ponto Inicial
vi   = 0;
ai   = 0;
posi_1 = ((90-(str2double(posicoes_movimento1(4))))/180)*255;
ti_1 = 0;
tf_1 = tf/3;
% Pontos de Passagem
% Ponto 1
posi_2 = ((90-(str2double(posicoes_movimento2(4))))/180)*255;
ti_2 = 0;
tf_2 = tf/3;
% Ponto 2
posi_3 = ((90-(str2double(posicoes_movimento3(4))))/180)*255;
ti_3 = 0;
tf_3 = tf/3;
% Ponto Final
posf_4 = ((90-(str2double(posicoes_movimento4(4))))/180)*255;
vf     = 0;
af     = 0;

theta_motor4 = [posi_1; vi;ai; posi_2; posi_2; 0; 0; posi_3; posi_3; 0; 0; posf_4; vf; af];

a = [1    0    0      0      0        0   0    0      0      0   0    0      0        0;
    0    1    0      0      0        0   0    0      0      0   0    0      0        0;
    0    0    2      0      0        0   0    0      0      0   0    0      0        0;
    1  tf_1 tf_1^2 tf_1^3 tf_1^4     0   0    0      0      0   0    0      0        0;
    0    0    0      0      0        1   0    0      0      0   0    0      0        0;
    0    1  2*tf_1 3*tf_1^2 4*tf_1^3 0  -1    0      0      0   0    0      0        0;
    0    0    2    6*tf_1 12*tf_1^2  0   0   -2      0      0   0    0      0        0;
    0    0    0      0      0        1 tf_2 tf_2^2 tf_2^3   0   0    0      0        0;
    0    0    0      0      0        0   0    0      0      1   0    0      0        0;
    0    0    0      0      0        0   1  2*tf_2 3*tf_2^2 0  -1    0      0        0;
    0    0    0      0      0        0   0    2    6*tf_2   0   0   -2      0        0;
    0    0    0      0      0        0   0    0      0      1 tf_3 tf_3^2 tf_3^3   tf_3^4;
    0    0    0      0      0        0   0    0      0      0   1  2*tf_3 3*tf_3^2 4*tf_3^3;
    0    0    0      0      0        0   0    0      0      0   0    2    6*tf_3   12*tf_3^2;];

c = inv(a)*theta_motor4;

% Primeiro Segmento
ta_1 = tf_1/100;

for t=0:99
    theta1_motor4(t+1)= c(1)+c(2)*(t*ta_1)+c(3)*((t*ta_1)^2)+c(4)*((t*ta_1)^3)+ (c(5)*(t*ta_1)^4);
    v1_motor4(t+1)= c(2)+2*c(3)*(t*ta_1)+(3*c(4)*(t*ta_1)^2)+(4*c(5)*(ta_1*t)^3);
    a1_motor4(t+1)= 2*c(3)+6*c(4)*(t*ta_1)+(12*c(5)*(t*ta_1)^2);
end

% Segundo Segmento
ta_2 = tf_2/100;

for t=0:99
    theta2_motor4(t+1)= c(6)+c(7)*(t*ta_2)+c(8)*((t*ta_2)^2)+c(9)*((t*ta_2)^3);
    v2_motor4(t+1)= c(7)+2*c(8)*(t*ta_2)+(3*c(9)*(t*ta_2)^2);
    a2_motor4(t+1)= 2*c(8)+6*c(9)*(t*ta_2);
end

% Segundo Segmento
ta_3 = tf_3/100;

for t=0:99
    theta3_motor4(t+1)= c(10)+c(11)*(t*ta_3)+c(12)*((t*ta_3)^2)+c(13)*((t*ta_3)^3)+ (c(14)*(t*ta_3)^4);
    v3_motor4(t+1)= c(11)+2*c(12)*(t*ta_3)+(3*c(13)*(t*ta_3)^2)+(4*c(14)*(ta_3*t)^3);
    a3_motor4(t+1)= 2*c(12)+6*c(13)*(t*ta_3)+(12*c(14)*(t*ta_3)^2);
end

theta_f_motor4 = [theta1_motor4 theta2_motor4 theta3_motor4];
v_f_motor4     = [v1_motor4 v2_motor4 v3_motor4];
a_f_motor4     = [a1_motor4 a2_motor4 a3_motor4];

% -----------------
% --- 5º Motor ----
% -----------------

% Ponto Inicial
vi   = 0;
ai   = 0;
posi_1 = ((90-(str2double(posicoes_movimento1(5))))/180)*255;
ti_1 = 0;
tf_1 = tf/3;
% Pontos de Passagem
% Ponto 1
posi_2 = ((90-(str2double(posicoes_movimento2(5))))/180)*255;
ti_2 = 0;
tf_2 = tf/3;
% Ponto 2
posi_3 = ((90-(str2double(posicoes_movimento3(5))))/180)*255;
ti_3 = 0;
tf_3 = tf/3;
% Ponto Final
posf_4 = ((90-(str2double(posicoes_movimento4(5))))/180)*255;
vf     = 0;
af     = 0;

theta_motor5 = [posi_1; vi;ai; posi_2; posi_2; 0; 0; posi_3; posi_3; 0; 0; posf_4; vf; af];

a = [1    0    0      0      0        0   0    0      0      0   0    0      0        0;
    0    1    0      0      0        0   0    0      0      0   0    0      0        0;
    0    0    2      0      0        0   0    0      0      0   0    0      0        0;
    1  tf_1 tf_1^2 tf_1^3 tf_1^4     0   0    0      0      0   0    0      0        0;
    0    0    0      0      0        1   0    0      0      0   0    0      0        0;
    0    1  2*tf_1 3*tf_1^2 4*tf_1^3 0  -1    0      0      0   0    0      0        0;
    0    0    2    6*tf_1 12*tf_1^2  0   0   -2      0      0   0    0      0        0;
    0    0    0      0      0        1 tf_2 tf_2^2 tf_2^3   0   0    0      0        0;
    0    0    0      0      0        0   0    0      0      1   0    0      0        0;
    0    0    0      0      0        0   1  2*tf_2 3*tf_2^2 0  -1    0      0        0;
    0    0    0      0      0        0   0    2    6*tf_2   0   0   -2      0        0;
    0    0    0      0      0        0   0    0      0      1 tf_3 tf_3^2 tf_3^3   tf_3^4;
    0    0    0      0      0        0   0    0      0      0   1  2*tf_3 3*tf_3^2 4*tf_3^3;
    0    0    0      0      0        0   0    0      0      0   0    2    6*tf_3   12*tf_3^2;];

c = inv(a)*theta_motor5;

% Primeiro Segmento
ta_1 = tf_1/100;

for t=0:99
    theta1_motor5(t+1)= c(1)+c(2)*(t*ta_1)+c(3)*((t*ta_1)^2)+c(4)*((t*ta_1)^3)+ (c(5)*(t*ta_1)^4);
    v1_motor5(t+1)= c(2)+2*c(3)*(t*ta_1)+(3*c(4)*(t*ta_1)^2)+(4*c(5)*(ta_1*t)^3);
    a1_motor5(t+1)= 2*c(3)+6*c(4)*(t*ta_1)+(12*c(5)*(t*ta_1)^2);
end

% Segundo Segmento
ta_2 = tf_2/100;

for t=0:99
    theta2_motor5(t+1)= c(6)+c(7)*(t*ta_2)+c(8)*((t*ta_2)^2)+c(9)*((t*ta_2)^3);
    v2_motor5(t+1)= c(7)+2*c(8)*(t*ta_2)+(3*c(9)*(t*ta_2)^2);
    a2_motor5(t+1)= 2*c(8)+6*c(9)*(t*ta_2);
end

% Segundo Segmento
ta_3 = tf_3/100;

for t=0:99
    theta3_motor5(t+1)= c(10)+c(11)*(t*ta_3)+c(12)*((t*ta_3)^2)+c(13)*((t*ta_3)^3)+ (c(14)*(t*ta_3)^4);
    v3_motor5(t+1)= c(11)+2*c(12)*(t*ta_3)+(3*c(13)*(t*ta_3)^2)+(4*c(14)*(ta_3*t)^3);
    a3_motor5(t+1)= 2*c(12)+6*c(13)*(t*ta_3)+(12*c(14)*(t*ta_3)^2);
end

theta_f_motor5 = [theta1_motor5 theta2_motor5 theta3_motor5];
v_f_motor5     = [v1_motor5 v2_motor5 v3_motor5];
a_f_motor5     = [a1_motor5 a2_motor5 a3_motor5];

% -----------------
% --- 6º Motor ----
% -----------------

% Ponto Inicial
vi   = 0;
ai   = 0;
posi_1 = ((90-(str2double(posicoes_movimento1(6))))/180)*255;
ti_1 = 0;
tf_1 = tf/3;
% Pontos de Passagem
% Ponto 1
posi_2 = ((90-(str2double(posicoes_movimento2(6))))/180)*255;
ti_2 = 0;
tf_2 = tf/3;
% Ponto 2
posi_3 = ((90-(str2double(posicoes_movimento3(6))))/180)*255;
ti_3 = 0;
tf_3 = tf/3;
% Ponto Final
posf_4 = ((90-(str2double(posicoes_movimento4(6))))/180)*255;
vf     = 0;
af     = 0;

theta_motor6 = [posi_1; vi;ai; posi_2; posi_2; 0; 0; posi_3; posi_3; 0; 0; posf_4; vf; af];

a = [1    0    0      0      0        0   0    0      0      0   0    0      0        0;
    0    1    0      0      0        0   0    0      0      0   0    0      0        0;
    0    0    2      0      0        0   0    0      0      0   0    0      0        0;
    1  tf_1 tf_1^2 tf_1^3 tf_1^4     0   0    0      0      0   0    0      0        0;
    0    0    0      0      0        1   0    0      0      0   0    0      0        0;
    0    1  2*tf_1 3*tf_1^2 4*tf_1^3 0  -1    0      0      0   0    0      0        0;
    0    0    2    6*tf_1 12*tf_1^2  0   0   -2      0      0   0    0      0        0;
    0    0    0      0      0        1 tf_2 tf_2^2 tf_2^3   0   0    0      0        0;
    0    0    0      0      0        0   0    0      0      1   0    0      0        0;
    0    0    0      0      0        0   1  2*tf_2 3*tf_2^2 0  -1    0      0        0;
    0    0    0      0      0        0   0    2    6*tf_2   0   0   -2      0        0;
    0    0    0      0      0        0   0    0      0      1 tf_3 tf_3^2 tf_3^3   tf_3^4;
    0    0    0      0      0        0   0    0      0      0   1  2*tf_3 3*tf_3^2 4*tf_3^3;
    0    0    0      0      0        0   0    0      0      0   0    2    6*tf_3   12*tf_3^2;];

c = inv(a)*theta_motor6;

% Primeiro Segmento
ta_1 = tf_1/100;

for t=0:99
    theta1_motor6(t+1)= c(1)+c(2)*(t*ta_1)+c(3)*((t*ta_1)^2)+c(4)*((t*ta_1)^3)+ (c(5)*(t*ta_1)^4);
    v1_motor6(t+1)= c(2)+2*c(3)*(t*ta_1)+(3*c(4)*(t*ta_1)^2)+(4*c(5)*(ta_1*t)^3);
    a1_motor6(t+1)= 2*c(3)+6*c(4)*(t*ta_1)+(12*c(5)*(t*ta_1)^2);
end

% Segundo Segmento
ta_2 = tf_2/100;

for t=0:99
    theta2_motor6(t+1)= c(6)+c(7)*(t*ta_2)+c(8)*((t*ta_2)^2)+c(9)*((t*ta_2)^3);
    v2_motor6(t+1)= c(7)+2*c(8)*(t*ta_2)+(3*c(9)*(t*ta_2)^2);
    a2_motor6(t+1)= 2*c(8)+6*c(9)*(t*ta_2);
end

% Segundo Segmento
ta_3 = tf_3/100;

for t=0:99
    theta3_motor6(t+1)= c(10)+c(11)*(t*ta_3)+c(12)*((t*ta_3)^2)+c(13)*((t*ta_3)^3)+ (c(14)*(t*ta_3)^4);
    v3_motor6(t+1)= c(11)+2*c(12)*(t*ta_3)+(3*c(13)*(t*ta_3)^2)+(4*c(14)*(ta_3*t)^3);
    a3_motor6(t+1)= 2*c(12)+6*c(13)*(t*ta_3)+(12*c(14)*(t*ta_3)^2);
end

theta_f_motor6 = [theta1_motor6 theta2_motor6 theta3_motor6];
v_f_motor6     = [v1_motor6 v2_motor6 v3_motor6];
a_f_motor6     = [a1_motor6 a2_motor6 a3_motor6];

load('d_2', 'tf_3','vi_3','vf_3','tf_5','vi_5','vf_5','ai_5','af_5','tf_l','w_l','t_t');
serialInfo = instrhwinfo('serial');
porta_s= serial(serialInfo.AvailableSerialPorts,'BaudRate',50000);
fopen(porta_s);

modo1 = 1;
fwrite(porta_s,modo1);

switch t_t
    case 0
        fwrite(porta_s,tf_3);
    case 1
        fwrite(porta_s,tf_5);
    case 2
        fwrite(porta_s,tf_l);
end

for i=1:300
    fwrite(porta_s,theta_f_motor1(i));
end
for i=1:300
    fwrite(porta_s,theta_f_motor2(i));
end
for i=1:300
    fwrite(porta_s,theta_f_motor3(i));
end
for i=1:300
    fwrite(porta_s,theta_f_motor4(i));
end
for i=1:300
    fwrite(porta_s,theta_f_motor5(i));
end
for i=1:300
    fwrite(porta_s,theta_f_motor6(i));
end

fclose(porta_s);

% figure(1)
% subplot(2,3,1)
% plot(theta_f_motor1)
% title('motor 1')
% subplot(2,3,2)
% plot(theta_f_motor2)
% title('motor 2')
% subplot(2,3,3)
% plot(theta_f_motor3)
% title('motor 3')
% subplot(2,3,4)
% plot(theta_f_motor4)
% title('motor 4')
% subplot(2,3,5)
% plot(theta_f_motor5)
% title('motor 5')
% subplot(2,3,6)
% plot(theta_f_motor6)
% title('motor 6')

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% --- Executes on button press in parar.
function parar_Callback(hObject, eventdata, handles)
% hObject    handle to parar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('d_6','aux2','aux3');
aux2=1;
save('d_6','aux2','aux3');

% --------------------------------------------------------------------
function abrir_Callback(hObject, eventdata, handles)
% hObject    handle to abrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('d_5','b','n_t','aux');
[arq caminho]=uigetfile('*.txt','Abrir Arquivo');
if arq~=0
    d=[caminho,arq];
    arquivo=fopen(d);
    var=textscan(arquivo,'%s');
    y=size(var{1,1});
    b=[];
    
    for i=1:y(1)
        a=char(var{1}{i});
        bw=size(a);
        if bw(2)<100
            for j=bw(2):100
                a=[a,' '];
            end
        end
        b=[b;a];
    end
    set(handles.texto,'string',b);
    save('d_5','b','n_t','aux');
end
% --------------------------------------------------------------------
function fechar_Callback(hObject, eventdata, handles)
% hObject    handle to fechar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;




% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over texto.
function texto_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to texto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on texto and none of its controls.
function texto_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to texto (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
a=imread('logo.png');
axes(hObject);
imshow(a);

% Hint: place code in OpeningFcn to populate axes1


% --------------------------------------------------------------------
function arq_Callback(hObject, eventdata, handles)
% hObject    handle to arq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in graficos.
function graficos_Callback(hObject, eventdata, handles)
% hObject    handle to graficos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load ('d_6','aux2','aux3');
aux3=get(hObject,'value');
save ('d_6','aux2','aux3');
% Hint: get(hObject,'Value') returns toggle state of graficos


% --- Executes during object creation, after setting all properties.
function graficos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graficos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
load ('d_6','aux2','aux3');
aux3=get(hObject,'value');
save ('d_6','aux2','aux3');


% --- Executes during object deletion, before destroying properties.
function texto_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to texto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('d_2', 'tf_3','vi_3','vf_3','tf_5','vi_5','vf_5','ai_5','af_5','tf_l','w_l','t_t');
load('d_5','b','n_t','aux');
load('d_6','aux2','aux3');
aux2=0;
save('d_6','aux2','aux3');
switch t_t
    case 0
        tf=tf_3;
    case 1
        tf=tf_5;
    case 2
        tf=tf_l;
end

[li,co]=size(b);
for i=n_t:li
    load('d_6','aux2','aux3');
    if aux2==0
    Anal_cod;
    if n_t<li 
    n_t=n_t+1;
    end
       set(handles.texto,'value',n_t);
    save('d_5','b','n_t','aux');
    pause(tf);
    else
        i=li;
    end
end 
