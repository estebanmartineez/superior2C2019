%test numeros complejos
function algo = TestEDT()

strParordenado = '(5,45)';
strNoComplejo = '(4.4.4;5)';
strPolar = '[-8;5.3]';
strBinomica = '8-4.5j';
strOtroNoComplejo = '78';

fprintf('test de validacion e instancias de numero complejo.\n');
fprintf('Cuando se crean las instancias se asignan parametros\n');
fprintf('Se procede a crear numero complejo con string de entrada:8-4.5j\n');
fprintf('Resultado esperado: se crea la instancia\n');
c=NumeroComplejo(strBinomica)
clear c

fprintf('Se procede a crear numero complejo con string de entrada:(5,45)\n');
fprintf('Resultado esperado: se crea la instancia\n');
c=NumeroComplejo(strParordenado)
clear c

fprintf('Se procede a crear numero complejo con string de entrada:[-8;5.3]\n');
fprintf('Resultado esperado: se crea la instancia\n');
c=NumeroComplejo(strPolar)
clear c

fprintf('Se procede a crear numero complejo con string de entrada:(4.4.4;5)\n');
fprintf('Resultado esperado:da error "no es un numero complejo".\n\n');
c=NumeroComplejo(strNoComplejo)
clear c

fprintf('Se procede a crear numero complejo con string de entrada: 78\n');
fprintf('Resultado esperado:da error "no es un numero complejo".\n\n');
c=NumeroComplejo(strOtroNoComplejo)
clear c

fprintf('Se procede a crear numero complejo con numero de entrada: 50\n');
fprintf('Resultado esperado:da error "no ingreso parametro, o ingreso un parametro que no es string".\n\n');
c=NumeroComplejo(50)
clear c

end

