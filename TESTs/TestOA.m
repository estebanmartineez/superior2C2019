a = NumeroComplejo('(1,0)')
b=4;
op=Operaciones;

fprintf('Potencia.\n');
res=potencia(op,a,b)

fprintf('Raiz.\n');
res=raiz(op,a,b);
for i=1:b
res(i)
end


fprintf('RaizPrimitiva.\n');
[res,pri]=raiz_primitiva(op,a,b);
pri
j=size(res,2);
for i=1:j
res(i)
end