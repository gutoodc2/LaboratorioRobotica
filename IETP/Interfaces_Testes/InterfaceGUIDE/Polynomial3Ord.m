    function varargout = Polynomial3Ord(varargin)
    % POLYNOMIAL3ORD MATLAB code for Polynomial3Ord.fig
    %      POLYNOMIAL3ORD, by itself, creates a new POLYNOMIAL3ORD or raises the existing
    %      singleton*.
    %
    %      H = POLYNOMIAL3ORD returns the handle to a new POLYNOMIAL3ORD or the handle to
    %      the existing singleton*.
    %
    %      POLYNOMIAL3ORD('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in POLYNOMIAL3ORD.M with the given input arguments.
    %
    %      POLYNOMIAL3ORD('Property','Value',...) creates a new POLYNOMIAL3ORD or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before Polynomial3Ord_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to Polynomial3Ord_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help Polynomial3Ord

    % Last Modified by GUIDE v2.5 26-Aug-2019 10:18:01

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
        'gui_Singleton',  gui_Singleton, ...
        'gui_OpeningFcn', @Polynomial3Ord_OpeningFcn, ...
        'gui_OutputFcn',  @Polynomial3Ord_OutputFcn, ...
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


    % --- Executes just before Polynomial3Ord is made visible.
    function Polynomial3Ord_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to Polynomial3Ord (see VARARGIN)

    % Choose default command line output for Polynomial3Ord
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes Polynomial3Ord wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    starting = [0,0,0];
    set(handles.tbMove3ORD,'data',starting);

    % --- Outputs from this function are returned to the command line.
    function varargout = Polynomial3Ord_OutputFcn(hObject, eventdata, handles)
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Get default command line output from handles structure
    varargout{1} = handles.output;


    % --- Executes on button press in pushbutton4.
    function pushbutton3_Callback(hObject, eventdata, handles)
    % hObject    handle to pushbutton4 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)



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



    function edit3_Callback(hObject, eventdata, handles)
    % hObject    handle to edit3 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of edit3 as text
    %        str2double(get(hObject,'String')) returns contents of edit3 as a double


    % --- Executes during object creation, after setting all properties.
    function edit3_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit3 (see GCBO)
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
    
    q0  = str2double(get(handles.edPosInicial, 'String'));
    qf  = str2double(get(handles.edPosFinal, 'String'));;
    qd0 = 0; 
    qdf = 0; 
    tf  = str2double(get(handles.edTempo, 'String'));
    
    q=0; qd=0;  qdd=0;

    % Coeficientes, segundo as equações (7.6) ----------------------
    A = [1      tf      tf^2    tf^3;       %velocidade inicial
         1      0       0          0;       %posição inicial
         0      1      2*tf   3*tf^2;       %velocidade final
         0      1       0          0];      %posição final
    %---------------------------------------------------------------     
    C = inv(A) * [qf  q0  qdf  qd0]';
    c0 = C(1); c1 = C(2); c2 = C(3); c3 = C(4); 

    for t = 0.01:0.01:tf;

        q = [q, c0+(c1*t)+(c2*t^2)+(c3*t^3)];
        qd = [qd, c1+(2*c2*t)+(3*c3*t^2)];
        qdd = [qdd, 2*c2+(6*c3*t)];

    end

    % Plots
    t = [0: 0.01: tf];
    plot(handles.PlotPol3ORD,t,q,t,qd,t,qdd);

    % Inserindo na tabela
    oldData = get(handles.tbMove3ORD,'Data');
    newData = [oldData;q0,qf,tf];
    set(handles.tbMove3ORD,'data',newData);
    
    % --- Executes on button press in pushbutton1.
    function pushbutton1_Callback(hObject, eventdata, handles)
    % hObject    handle to pushbutton1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
Main();
