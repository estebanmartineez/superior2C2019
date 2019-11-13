classdef Operaciones
    %Clase para operaciones basicas y avanzadas
    %referencia a NumeroComplejo
    
    %resultado es otro numero complejo.
    
    properties
        
    end
    
    methods

       function result=suma(thisoperaciones, numeroComplejo, otroNumeroComplejo)
                   %suma de numeros complejos
        real= numeroComplejo.FormBinomica_real + otroNumeroComplejo.FormBinomica_real;
        img = numeroComplejo.FormBinomica_img + otroNumeroComplejo.FormBinomica_img;
        str=strcat('(',(num2str(real) ),',', num2str(img), ')');
        result=NumeroComplejo(str);
       end

        function result=resta(thisoperaciones, numeroComplejo, otroNumeroComplejo)
                      %resta de numeros complejos
        real= numeroComplejo.FormBinomica_real - otroNumeroComplejo.FormBinomica_real;
        img = numeroComplejo.FormBinomica_img - otroNumeroComplejo.FormBinomica_img;
        str=strcat('(',(num2str(real) ),',', num2str(img), ')');
        result=NumeroComplejo(str);
       end

        function result=multiplicacion(thisoperaciones, numeroComplejo, otroNumeroComplejo)
                %multiplicacion de numeros complejos
        modulo = numeroComplejo.FormPolar_ro * otroNumeroComplejo.FormPolar_ro;
        angulo = numeroComplejo.FormPolar_fi + otroNumeroComplejo.FormPolar_fi;
        while angulo<0
               angulo=angulo+2*pi; 
            end
        while angulo>2*pi
               angulo=angulo-2*pi; 
            end
        str=strcat('[',(num2str(modulo) ),';', num2str(angulo), ']');
        result=NumeroComplejo(str);
        end
        function result=division(thisoperaciones, numeroComplejo, otroNumeroComplejo)
            %cociente o division de numeros complejos, el cociente lo
            %realiza desde la forma polar
            modulo = numeroComplejo.FormPolar_ro /  otroNumeroComplejo.FormPolar_ro;
            angulo = numeroComplejo.FormPolar_fi - otroNumeroComplejo.FormPolar_fi;
            while angulo<0
               angulo=angulo+2*pi; 
            end
            while angulo>2*pi
               angulo=angulo-2*pi; 
            end
            str=strcat('[',(num2str(modulo) ),';', num2str(angulo), ']');
            result=NumeroComplejo(str);
        end
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

         function result=potencia(thisoperaciones, numeroComplejo, n)
            %potencia
            modulo = numeroComplejo.FormPolar_ro ^  n;
            angulo = numeroComplejo.FormPolar_fi *n;

            str=strcat('[',(num2str(modulo) ),';', num2str(angulo), ']');
            result=NumeroComplejo(str);
         end

        
         function result=raiz(thisoperaciones, numeroComplejo, n)
            %radicacion numero natural       
            modulo = nthroot(numeroComplejo.FormPolar_ro,  n);
            k=0;
            i=1;
            %result(n)=result;%convierto a result un array de n ceros, asi despues cada elemento dela array lo completo con la raiz
            while k<n
                
            angulo = (numeroComplejo.FormPolar_fi +2*k*pi)/n;
            str=strcat('[',(num2str(modulo) ),';', num2str(angulo), ']');
            result(i)= NumeroComplejo(str);
            k=k+1;
            i=i+1;
            end

         end
         
         function [result,pri]=raiz_primitiva(thisoperaciones, numeroComplejo, n)
            %radicacion numero natural   
            i=1;
               for k=0:n-1
                mcd=gcd(n,k);
                if mcd==1
                   pri(i)=k;
                   i=i+1;
                end
               end
            
            
               op=Operaciones;
               res=raiz(op,numeroComplejo,n);
               cant_pri=size(pri,2);
               for i=1:cant_pri
                 raizprim=pri(i);
                 result(i)=res(raizprim);
               end
            end

         
         
        
    end
    
end

