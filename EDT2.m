function varargout = EDT2(varargin)
% EDT2 MATLAB code for EDT2.fig
%      EDT2, by itself, creates a new EDT2 or raises the existing
%      singleton*.
%
%      H = EDT2 returns the handle to a new EDT2 or the handle to
%      the existing singleton*.
%
%      EDT2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDT2.M with the given input arguments.
%
%      EDT2('Property','Value',...) creates a new EDT2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EDT2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EDT2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EDT2

% Last Modified by GUIDE v2.5 21-Apr-2019 16:19:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EDT2_OpeningFcn, ...
                   'gui_OutputFcn',  @EDT2_OutputFcn, ...
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


% --- Executes just before EDT2 is made visible.
function EDT2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EDT2 (see VARARGIN)

% Choose default command line output for EDT2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EDT2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EDT2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtbox_Callback(hObject, eventdata, handles)
% hObject    handle to txtbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtbox as text
%        str2double(get(hObject,'String')) returns contents of txtbox as a double


% --- Executes during object creation, after setting all properties.
function txtbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in boton.
function boton_Callback(hObject, eventdata, handles)
% hObject    handle to boton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    numero = get(handles.txtbox,'String');
    if (isempty(numero))
        set(handles.texto, 'string', 'campo vacio');
    else
        obj = NumeroComplejo(numero);
        if(obj.TipoInicial==0)
            set(handles.texto, 'string', 'no es un numero complejo');
        else
            set(handles.texto, 'string', [
                'FormBinomica_real = ', num2str(obj.FormBinomica_real), char(10), 'FormBinomica_img = ', num2str(obj.FormBinomica_img), char(10), 'FormPolar_ro = ', num2str(obj.FormPolar_ro), char(10), 'FormPolar_fi = ', num2str(obj.FormPolar_fi), char(10), 'FormBinomica_string = ', obj.FormBinomica_string, char(10), 'FormPolar_string = ', obj.FormPolar_string, char(10), 'FormParOrdenado_string = ', obj.FormParOrdenado_string, char(10), 'Conjugado_string = ', obj.Conjugado_string, char(10), 'AnguloGrados = ', num2str(obj.AnguloGrados), char(10), 'TipoInicial = ', num2str(obj.TipoInicial)
                ]);
        end
    end
    
% --- Executes on button press in btn_volver.
function btn_volver_Callback(hObject, eventdata, handles)
% hObject    handle to btn_volver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    close(EDT2);
    Menu;
