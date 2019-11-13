classdef NumeroComplejo<handle
    %Clase que define las formas de un numero complejo
    properties
        FormBinomica_real %parte real de la forma Binómica
        FormBinomica_img %parte imaginaria de la forma Binómica
        FormPolar_ro   %equivale al módulo del número complejo de la forma Binómica
        FormPolar_fi   %equivale al ángulo que forma el vector con el semieje positivo
        FormBinomica_string  %forma Binómica completa incluye la i
        FormPolar_string  %forma polar completa ejemplo [5;0.7854] ángulo en radianes
        FormParOrdenado_string    %forma par ordenado, ejemplo (FormBinomica_real;FormBinomica_img)
        Conjugado_string  %Conjugado del número complejo en forma Binómica
        AnguloGrados %el angulo en grados
        TipoInicial=0%tipo inicial que se ingreso
    end
    
    methods
        %validación número complejo
        function tipo=dimeTipoComplejo(thisnumeroComplejo, val)
            tipo=0;  %no es complejo
            %validar que val es complejo
            if(~isempty(regexp(val,'^\((+|-)?\d+(\.\d+)?,(+|-)?\d+(\.\d+)?\)$','match')))
                tipo=1;  %forma par ordenado
            elseif(~isempty(regexp(val,'^\[(+|-)?\d+(\.\d+)?;(+|-)?\d+(\.\d+)?\]$','match')))
                tipo=2; %formapolar
            elseif(~isempty(regexp(val,'^(+|-)?\d+(\.\d+)?[+-]\d+(\.\d+)?j$','match')))
                tipo=3; %forma binomica
            end
            thisnumeroComplejo.TipoInicial = tipo;
        end
        
        %cálculo angulo en radianes
        function ang = getAngulo(thisnumeroComplejo,real, img)
            if(real >0 && img>0)
                ang=atan(img/real);
            end
            if(real <0 && img<0)
                ang=pi + atan(abs(img)/abs(real));
            end
            if(real >0 && img<0)
                ang=2*pi - atan(abs(img)/real);
            end
            if(real <0 && img>0)
                ang=pi - atan(img/abs(real));
            end
            if(real ==0 && img>0)
                ang =pi/2;
            end
            if(real ==0 && img<0)
                ang =3*pi/2;
            end
            if(real >=0 && img==0)
                ang = 0;
            end
            if(real <0 && img==0)
                ang =pi;
            end
            thisnumeroComplejo.FormPolar_fi = ang;
            thisnumeroComplejo.AnguloGrados =round(ang*180/pi);
        end
        
        %cálculo módulo
        function mod = getModulo(thisnumeroComplejo,real, img)
            mod=sqrt(real^2+img^2);
            thisnumeroComplejo.FormPolar_ro = mod;
        end
        
        %convierte Polar a Binomica y asigna el valor a la propiedad de la clase
        function [real,img] = pol2binomica(thisnumeroComplejo, mod,ang)
            real=mod*cos(ang);
            img=mod*sin(ang);
        end
        %pasa (a,b) a la estructura a+bj
        function [bin] = parordenado2binomica(thisnumeroComplejo, real,img)
            %para cuando el numero complejo no quede 1+(-)j y quede directamente 1-j
            if img>=0
                bin=strcat(num2str(real),'+', num2str(img), 'j');
            else
                bin=strcat(num2str(real),'-', num2str(abs(img)), 'j');
            end
            
        end
        
        %realiza el conjugado en formato string
        function [bin] = conjugado(thisnumeroComplejo, real,img)
            if img>=0
                bin=strcat(num2str(real),'-', num2str(img), 'j');
            else
                bin=strcat(num2str(real),'+', num2str(abs(img)), 'j');
            end
        end
        
        %convertir de Binomica a polar
        %solo completa la propiedad de la clase en numero, la parte de
        %string lo realiza en el constructor
        function [mod,ang] = bin2polar(thisnumeroComplejo, real,img )
            mod = getModulo(thisnumeroComplejo,real,img);
            ang=  getAngulo(thisnumeroComplejo,real,img);
        end
        
        %constructor
        function obj=NumeroComplejo(val)
            if nargin==1 && isnumeric(val)==0
                %validar que val es complejo
                dimeTipoComplejo(obj, val);
                %realizar conversiones y asignar atributos
                %forma par ordenado
                if(obj.TipoInicial==1)
                    obj.FormParOrdenado_string= val;
                    firstPart = regexp(val,'(+|-)?\d+(\.\d+)?,','match');
                    secondPart = regexp(val,'(+|-)?\d+(\.\d+)?\)','match');
                    obj.FormBinomica_real = str2double(regexprep( firstPart,',','','ignorecase'));
                    obj.FormBinomica_img = str2double(regexprep(secondPart,'\)','','ignorecase'));
                    %completo las propiedades con las conversiones
                    [mod,ang]=bin2polar(obj,obj.FormBinomica_real,obj.FormBinomica_img);
                    obj.FormPolar_ro = mod;
                    obj.FormPolar_fi = ang;
                    
                    obj.FormPolar_string=strcat('[',(num2str(mod) ),';', num2str(ang), ']');
                    obj.FormBinomica_string=parordenado2binomica(obj,obj.FormBinomica_real,obj.FormBinomica_img);
                    obj.AnguloGrados= round(ang*180/pi);
                    obj.Conjugado_string=conjugado(obj,obj.FormBinomica_real,obj.FormBinomica_img);
                end
                %formapolar
                if(obj.TipoInicial==2)
                    obj.FormPolar_string=val;
                    firstPart = regexp(val,'(+|-)?\d+(\.\d+)?;','match');
                    secondPart = regexp(val,'(+|-)?\d+(\.\d+)?\]','match');
                    obj.FormPolar_ro = str2double(regexprep( firstPart,';','','ignorecase'));
                    obj.FormPolar_fi = str2double(regexprep(secondPart,'\]','','ignorecase'));
                    obj.AnguloGrados= round(obj.FormPolar_fi*180/pi);
                    
                    %completo las propiedades con las conversiones
                    [real_,img]=pol2binomica(obj,obj.FormPolar_ro,obj.FormPolar_fi);
                    obj.FormBinomica_real = real_;
                    obj.FormBinomica_img = img;
                    obj.FormParOrdenado_string=strcat('(',(num2str(real_) ),',', num2str(img), ')');
                    obj.FormBinomica_string=parordenado2binomica(obj,obj.FormBinomica_real,obj.FormBinomica_img);
                    obj.Conjugado_string=conjugado(obj,obj.FormBinomica_real,obj.FormBinomica_img);
                end
                %forma binomica
                if(obj.TipoInicial==3)
                    
                    obj.FormBinomica_string=val;
                    obj.FormBinomica_real = real(str2double(val));
                    obj.FormBinomica_img = imag(str2double(val));
                    
                    %completo las propiedades con las conversiones
                    obj.FormParOrdenado_string=strcat('(',num2str(obj.FormBinomica_real),',', num2str(obj.FormBinomica_img ), ')');
                    [mod,ang]=bin2polar(obj,obj.FormBinomica_real,obj.FormBinomica_img);
                    obj.FormPolar_ro = mod;
                    obj.FormPolar_fi = ang;
                    obj.FormPolar_string=strcat('[',(num2str(mod) ),';', num2str(ang), ']');
                    obj.AnguloGrados= round(ang*180/pi);
                    obj.Conjugado_string= conjugado(obj,obj.FormBinomica_real,obj.FormBinomica_img);
                end
                if(obj.TipoInicial==0)
                    disp('no es un numero complejo');
                end
            else
                disp('no ingreso parametro, o ingreso un parametro que no es string');
            end
        end
    end
end

