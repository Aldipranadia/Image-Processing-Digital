function varargout = Pengolahan_gambar(varargin)
% PENGOLAHAN_GAMBAR MATLAB code for Pengolahan_gambar.fig
%      PENGOLAHAN_GAMBAR, by itself, creates a new PENGOLAHAN_GAMBAR or raises the existing
%      singleton*.
%
%      H = PENGOLAHAN_GAMBAR returns the handle to a new PENGOLAHAN_GAMBAR or the handle to
%      the existing singleton*.
%
%      PENGOLAHAN_GAMBAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PENGOLAHAN_GAMBAR.M with the given input arguments.
%
%      PENGOLAHAN_GAMBAR('Property','Value',...) creates a new PENGOLAHAN_GAMBAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Pengolahan_gambar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Pengolahan_gambar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Pengolahan_gambar

% Last Modified by GUIDE v2.5 17-Mar-2018 18:09:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Pengolahan_gambar_OpeningFcn, ...
                   'gui_OutputFcn',  @Pengolahan_gambar_OutputFcn, ...
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


% --- Executes just before Pengolahan_gambar is made visible.
function Pengolahan_gambar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Pengolahan_gambar (see VARARGIN)

% Choose default command line output for Pengolahan_gambar
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Pengolahan_gambar wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Pengolahan_gambar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
global gambar;
global nama_file nama_path;
function pushbutton1_Callback(hObject, eventdata, handles)
[nama_file,nama_path] = uigetfile({'*.jpg';'*.bmp';'*.png';'*.tif';},...
    'Buka Gambar');
if ~isequal (nama_file,0)
    handles.data1 = imread(fullfile(nama_path,nama_file));
    gambar = handles.data1;
    guidata(hObject,handles);
    axes(handles.axes1);
    imshow(gambar);
    title('Gambar Asli');
else
    return
end
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global gambar;
global nama_file nama_path;
gambar = handles.data1;
z = crop(gambar);
axes(handles.axes1);
imshow(gambar);
title('Gambar Asli');
axes(handles.axes2);
imshow(z);
title('Cropping Image');
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gambar;
global nama_file nama_path;
gambar = handles.data1;
z = flip_vertical(gambar);
axes(handles.axes1);
imshow(gambar);
title('Gambar Asli');
axes(handles.axes2);
imshow(z);
title('Flip vertical');


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gambar;
global nama_file nama_path;
gambar = handles.data1;
z = flip_horizontal(gambar);
axes(handles.axes1);
imshow(gambar);
title('Gambar Asli');
axes(handles.axes2);
imshow(z);
title('Flip horizontal');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gambar;
global nama_file nama_path;
gambar = handles.data1;
z = grayscale(gambar);
axes(handles.axes1);
imshow(gambar);
title('Gambar Asli');
axes(handles.axes2);
imshow(z);
title('Grayscale');


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gambar;
global nama_file nama_path;
gambar = handles.data1;
z = rotate(gambar);
axes(handles.axes1);
imshow(gambar);
title('Gambar Asli');
axes(handles.axes2);
imshow(z);
title('Rotate');
