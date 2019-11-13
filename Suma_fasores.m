function varargout = Suma_fasores(varargin)
% SUMA_FASORES MATLAB code for Suma_fasores.fig
%      SUMA_FASORES, by itself, creates a new SUMA_FASORES or raises the existing
%      singleton*.
%
%      H = SUMA_FASORES returns the handle to a new SUMA_FASORES or the handle to
%      the existing singleton*.
%
%      SUMA_FASORES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUMA_FASORES.M with the given input arguments.
%
%      SUMA_FASORES('Property','Value',...) creates a new SUMA_FASORES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Suma_fasores_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Suma_fasores_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Suma_fasores

% Last Modified by GUIDE v2.5 29-Apr-2019 18:34:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Suma_fasores_OpeningFcn, ...
                   'gui_OutputFcn',  @Suma_fasores_OutputFcn, ...
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


% --- Executes just before Suma_fasores is made visible.
function Suma_fasores_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Suma_fasores (see VARARGIN)

% Choose default command line output for Suma_fasores
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Suma_fasores wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Suma_fasores_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_volver.
function btn_volver_Callback(hObject, eventdata, handles)
% hObject    handle to btn_volver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(Suma_fasores);
Menu;


function txt_resultado_Callback(hObject, eventdata, handles)
% hObject    handle to txt_resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_resultado as text
%        str2num(get(hObject,'String')) returns contents of txt_resultado as a double


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


% --- Executes on button press in btn_calcular.
function btn_calcular_Callback(hObject, eventdata, handles)
% hObject    handle to btn_calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    tipoFuncionA = 0;
    switch get(get(handles.uibuttongroup2,'SelectedObject'),'Tag')
        case 'cosenoA',  tipoFuncionA = 'cos';
        case 'senoA',  tipoFuncionA = 'sen';
    end

    tipoFuncionB = 0;
    switch get(get(handles.uibuttongroup3,'SelectedObject'),'Tag')
        case 'cosenoB',   tipoFuncionB = 'cos';
        case 'senoB',   tipoFuncionB = 'sen'; 
    end

    % extracción de datos ingresados y validaciones
    frecuenciaA = str2num(get(handles.txt_frecuenciaA,'String'));
    frecuenciaB = str2num(get(handles.txt_frecuenciaB,'String'));
    faseA = str2num(get(handles.txt_faseA,'String'));
    faseB = str2num(get(handles.txt_faseB,'String'));
    amplitudA = str2num(get(handles.txt_amplitudA,'String'));
    amplitudB = str2num(get(handles.txt_amplitudB,'String'));
    
    if (isempty(frecuenciaA) || isempty(frecuenciaB) || isempty(faseA) || isempty(faseB) || isempty(amplitudA) || isempty(amplitudB))
        set(handles.txt_resultado, 'string', 'Completar correctamente los campos');
    else
         % si tienen distinta frecuencia, out
        if (frecuenciaA ~= frecuenciaB)
             set(handles.txt_resultado, 'string', 'Ingresar frecuencias iguales');
        else
            % logica
            % si tienen frecuencia y tipoFuncion iguales
            if (strcmp(tipoFuncionA, tipoFuncionB) && frecuenciaA == frecuenciaB)
                fasorResultanteRe = amplitudA * cos(faseA) + amplitudB * cos(faseB); 
                fasorResultanteIm = amplitudA * sin(faseA) + amplitudB * sin(faseB);
                %cosd trabaja en degree, ver si trabajar en radianes
                %To work in radians, use sin, cos, asin, acos etc.
                %To work in degrees, use sind, cosd, asind, acosd etc.
                %To convert from degrees to radians, multiply by pi/180.
                %To convert from radians to degrees, multiply by 180/pi.
            end

            % si tienen igual frecuencia y distinto tipoFuncion
            % la funcion seno se pasa a coseno y el resultado queda en coseno
            if (~(strcmp(tipoFuncionA, tipoFuncionB)) && frecuenciaA == frecuenciaB)
                if (strcmp(tipoFuncionA, 'sen'))
                    fasorResultanteRe = amplitudA * cos(faseA - pi/2) + amplitudB * cos(faseB); 
                    fasorResultanteIm = amplitudA * sin(faseA - pi/2) + amplitudB * sin(faseB);
                else
                    fasorResultanteRe = amplitudA * cos(faseA) + amplitudB * cos(faseB - pi/2); 
                    fasorResultanteIm = amplitudA * sin(faseA) + amplitudB * sin(faseB - pi/2);
                end
            end
            fasorResultante = complex(fasorResultanteRe, fasorResultanteIm);
            nuevoFasor = abs(fasorResultante);
            nuevoAngulo = angle(fasorResultante);
            
            %Impresion de resultado
            if (nuevoAngulo >= 0)
                set(handles.txt_resultado, 'string', ['= ', num2str(nuevoFasor), ' * ', tipoFuncionA, ' (', num2str(frecuenciaA), 't + ', num2str(nuevoAngulo), ')']);
            else
                set(handles.txt_resultado, 'string', ['= ', num2str(nuevoFasor), ' * ', tipoFuncionA, ' (', num2str(frecuenciaA), 't ', num2str(nuevoAngulo), ')']);
            end
        end
    end
            
% --- Executes on button press in btn_limpiar.
function btn_limpiar_Callback(hObject, eventdata, handles)
% hObject    handle to btn_limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.txt_resultado, 'string', '');
    set(handles.txt_frecuenciaA, 'string', '');
    set(handles.txt_frecuenciaB, 'string', '');
    set(handles.txt_faseA, 'string', '');
    set(handles.txt_faseB, 'string', '');
    set(handles.txt_amplitudA, 'string', '');
    set(handles.txt_amplitudB, 'string', '');

% --- Executes on button press in senoB.
function senoB_Callback(hObject, eventdata, handles)
% hObject    handle to senoB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of senoB


% --- Executes on button press in cosenoB.
function cosenoB_Callback(hObject, eventdata, handles)
% hObject    handle to cosenoB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cosenoB



function txt_frecuenciaB_Callback(hObject, eventdata, handles)
% hObject    handle to txt_frecuenciaB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_frecuenciaB as text
%        str2num(get(hObject,'String')) returns contents of txt_frecuenciaB as a double


% --- Executes during object creation, after setting all properties.
function txt_frecuenciaB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_frecuenciaB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_faseB_Callback(hObject, eventdata, handles)
% hObject    handle to txt_faseB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_faseB as text
%        str2num(get(hObject,'String')) returns contents of txt_faseB as a double


% --- Executes during object creation, after setting all properties.
function txt_faseB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_faseB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_amplitudB_Callback(hObject, eventdata, handles)
% hObject    handle to txt_amplitudB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_amplitudB as text
%        str2num(get(hObject,'String')) returns contents of txt_amplitudB as a double


% --- Executes during object creation, after setting all properties.
function txt_amplitudB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_amplitudB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in senoA.
function senoA_Callback(hObject, eventdata, handles)
% hObject    handle to senoA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of senoA


% --- Executes on button press in cosenoA.
function cosenoA_Callback(hObject, eventdata, handles)
% hObject    handle to cosenoA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cosenoA



function txt_frecuenciaA_Callback(hObject, eventdata, handles)
% hObject    handle to txt_frecuenciaA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_frecuenciaA as text
%        str2num(get(hObject,'String')) returns contents of txt_frecuenciaA as a double


% --- Executes during object creation, after setting all properties.
function txt_frecuenciaA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_frecuenciaA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_faseA_Callback(hObject, eventdata, handles)
% hObject    handle to txt_faseA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_faseA as text
%        str2num(get(hObject,'String')) returns contents of txt_faseA as a double


% --- Executes during object creation, after setting all properties.
function txt_faseA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_faseA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_amplitudA_Callback(hObject, eventdata, handles)
% hObject    handle to txt_amplitudA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_amplitudA as text
%        str2num(get(hObject,'String')) returns contents of txt_amplitudA as a double


% --- Executes during object creation, after setting all properties.
function txt_amplitudA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_amplitudA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
