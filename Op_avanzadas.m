function varargout = Op_avanzadas(varargin)
% OP_AVANZADAS MATLAB code for Op_avanzadas.fig
%      OP_AVANZADAS, by itself, creates a new OP_AVANZADAS or raises the existing
%      singleton*.
%
%      H = OP_AVANZADAS returns the handle to a new OP_AVANZADAS or the handle to
%      the existing singleton*.
%
%      OP_AVANZADAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OP_AVANZADAS.M with the given input arguments.
%
%      OP_AVANZADAS('Property','Value',...) creates a new OP_AVANZADAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Op_avanzadas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Op_avanzadas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Op_avanzadas

% Last Modified by GUIDE v2.5 03-May-2019 21:09:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Op_avanzadas_OpeningFcn, ...
                   'gui_OutputFcn',  @Op_avanzadas_OutputFcn, ...
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


% --- Executes just before Op_avanzadas is made visible.
function Op_avanzadas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Op_avanzadas (see VARARGIN)

% Choose default command line output for Op_avanzadas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Op_avanzadas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Op_avanzadas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in btn_potencia.
function btn_potencia_Callback(hObject, eventdata, handles)
% hObject    handle to btn_potencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
    a = NumeroComplejo(get(handles.txt_numeroA,'String'));
    b = str2num(get(handles.txt_numeroB,'String'));
    if(a.TipoInicial==0)
        set(handles.txt_resultado, 'string', 'Ingreso incorrecto');
    else
        op = Operaciones;
        r=potencia(op,a,b);
        set(handles.txt_resultado, 'string', r.FormPolar_string);
            set(handles.txt_raices,'string','');
    end


% --- Executes on button press in btn_raiz.
function btn_raiz_Callback(hObject, eventdata, handles)
% hObject    handle to btn_raiz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    a = NumeroComplejo(get(handles.txt_numeroA,'String'));
    b = str2num(get(handles.txt_numeroB,'String'));
    if(a.TipoInicial==0)
        set(handles.txt_resultado, 'string', 'Ingreso incorrecto');
    else
        op = Operaciones;
        res = raiz(op,a,b);
        cadena = '';
        for i=1:b
            cadena = [ cadena,' ',res(i).FormPolar_string,];
        end
        set(handles.txt_resultado, 'string', cadena);
            set(handles.txt_raices,'string','');
    end


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


% --- Executes on button press in btn_limpiar.
function btn_limpiar_Callback(hObject, eventdata, handles)
% hObject    handle to btn_limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.txt_numeroA,'string',''); 
    set(handles.txt_numeroB,'string','');
    set(handles.txt_resultado,'string','');
    set(handles.txt_raices,'string','');


% --- Executes on button press in btn_volver.
function btn_volver_Callback(hObject, eventdata, handles)
% hObject    handle to btn_volver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    close(Op_avanzadas);
    Menu;


% --- Executes on button press in btn_raizp.
function btn_raizp_Callback(hObject, eventdata, handles)
% hObject    handle to btn_raizp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
   a = NumeroComplejo(get(handles.txt_numeroA,'String'));
    b = str2num(get(handles.txt_numeroB,'String'));
    if(a.TipoInicial==0)
        set(handles.txt_resultado, 'string', 'Ingreso incorrecto');
    else
        op = Operaciones;
        [res,pri] = raiz_primitiva(op,a,b);
        cadena = '';
        cadena_pri='';
        aux=size(res,2);
        for i=1:aux
            cadena = [ cadena,' ',res(i).FormPolar_string,];
            cadena_pri=[cadena_pri,' ',num2str(pri(i))];
        end
        set(handles.txt_resultado, 'string', cadena);
      
        set(handles.txt_raices, 'string', cadena_pri);
    end




function txt_raices_Callback(hObject, eventdata, handles)
% hObject    handle to txt_raices (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_raices as text
%        str2double(get(hObject,'String')) returns contents of txt_raices as a double


% --- Executes during object creation, after setting all properties.
function txt_raices_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_raices (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
