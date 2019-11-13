function varargout = Op_basicas(varargin)
% OP_BASICAS MATLAB code for Op_basicas.fig
%      OP_BASICAS, by itself, creates a new OP_BASICAS or raises the existing
%      singleton*.
%
%      H = OP_BASICAS returns the handle to a new OP_BASICAS or the handle to
%      the existing singleton*.
%
%      OP_BASICAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OP_BASICAS.M with the given input arguments.
%
%      OP_BASICAS('Property','Value',...) creates a new OP_BASICAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Op_basicas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Op_basicas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Op_basicas

% Last Modified by GUIDE v2.5 03-May-2019 18:30:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Op_basicas_OpeningFcn, ...
                   'gui_OutputFcn',  @Op_basicas_OutputFcn, ...
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


% --- Executes just before Op_basicas is made visible.
function Op_basicas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Op_basicas (see VARARGIN)

% Choose default command line output for Op_basicas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Op_basicas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Op_basicas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_suma.
function btn_suma_Callback(hObject, eventdata, handles)
% hObject    handle to btn_suma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    a = NumeroComplejo(get(handles.txt_numeroA,'String'));
    b = NumeroComplejo(get(handles.txt_numeroB,'String'));
    if(a.TipoInicial==0 || b.TipoInicial==0)
        set(handles.txt_resultado, 'string', 'Ingreso incorrecto');
    else
        op = Operaciones;
        r=suma(op,a,b);
        set(handles.txt_resultado, 'string', r.FormParOrdenado_string);
    end

% --- Executes on button press in btn_resta.
function btn_resta_Callback(hObject, eventdata, handles)
% hObject    handle to btn_resta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    a = NumeroComplejo(get(handles.txt_numeroA,'String'));
    b = NumeroComplejo(get(handles.txt_numeroB,'String'));
    if(a.TipoInicial==0 || b.TipoInicial==0)
        set(handles.txt_resultado, 'string', 'Ingreso incorrecto');
    else
        op = Operaciones;
        r=resta(op,a,b);
        set(handles.txt_resultado, 'string', r.FormParOrdenado_string);
    end


% --- Executes on button press in btn_division.
function btn_division_Callback(hObject, eventdata, handles)
% hObject    handle to btn_division (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    a = NumeroComplejo(get(handles.txt_numeroA,'String'));
    b = NumeroComplejo(get(handles.txt_numeroB,'String'));
    if(a.TipoInicial==0 || b.TipoInicial==0)
        set(handles.txt_resultado, 'string', 'Ingreso incorrecto');
    else
        op = Operaciones;
        r=division(op,a,b);
        set(handles.txt_resultado, 'string', r.FormPolar_string);
    end


% --- Executes on button press in btn_multiplicacion.
function btn_multiplicacion_Callback(hObject, eventdata, handles)
% hObject    handle to btn_multiplicacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    a = NumeroComplejo(get(handles.txt_numeroA,'String'));
    b = NumeroComplejo(get(handles.txt_numeroB,'String'));
    if(a.TipoInicial==0 || b.TipoInicial==0)
        set(handles.txt_resultado, 'string', 'Ingreso incorrecto');
    else
        op = Operaciones;
        r=multiplicacion(op,a,b);
        set(handles.txt_resultado, 'string', r.FormPolar_string);
    end


% --- Executes on button press in btn_limpiar.
function btn_limpiar_Callback(hObject, eventdata, handles)
% hObject    handle to btn_limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.txt_numeroA,'string',''); 
    set(handles.txt_numeroB,'string','');
    set(handles.txt_resultado,'string','');


% --- Executes on button press in btn_volver.
function btn_volver_Callback(hObject, eventdata, handles)
% hObject    handle to btn_volver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    close(Op_basicas);
    Menu;


function txt_resultado_Callback(hObject, eventdata, handles)
% hObject    handle to txt_resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_resultado as text
%        str2double(get(hObject,'String')) returns contents of txt_resultado as a double


% --- Executes during object creation, after setting all properties.
function txt_resultado_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_numeroB_Callback(hObject, eventdata, handles)
% hObject    handle to txt_numeroB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_numeroB as text
%        str2double(get(hObject,'String')) returns contents of txt_numeroB as a double


% --- Executes during object creation, after setting all properties.
function txt_numeroB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_numeroB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_numeroA_Callback(hObject, eventdata, handles)
% hObject    handle to txt_numeroA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_numeroA as text
%        str2double(get(hObject,'String')) returns contents of txt_numeroA as a double


% --- Executes during object creation, after setting all properties.
function txt_numeroA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_numeroA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
