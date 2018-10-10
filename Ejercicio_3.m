%
%   Description: Construye una señal triangular de Nmax cantidad de
%   armonicas
%
%   Author: 
%   
%   Date: 27/09/2018
%
%   Comment: 
%
%   Tests run: 

function [ Signal, ao_2, an, bn, Px, Px2, Eta ] = Ejercicio_3(Nmax, Vpp, DC, Ts, N )
%Periodo de la señal
T = Ts*N;
%Frecuencia de la señal
f = 1/T;
%Vector temporal de 3 periodos
t = 0:Ts:3*T-Ts;

%Calculo ao/2 (Valor de continua de la señal)
ao_2 = DC;

%Calculo an:
an = zeros(1,Nmax-1);
for n = 1:Nmax-1
	an(n) = 2*Vpp*( (-1)^n -1)/((pi*n)^2);
end

%Calculo bn: (Vector de ceros por que la señal contiene simetria par ya que
%empieza desde -Vpp/2
bn = zeros(1,Nmax-1);

%Reconstruyo la señal
Cosenos = zeros(1,length(t));
for n = 1:Nmax-1
	Cosenos = Cosenos + an(n)*cos( n*2*pi*f*t );
end

Senos = zeros(1,length(t));
for n = 1:Nmax-1
	Senos = Senos + bn(n)*sin( n*2*pi*f*t );
end

Signal = ao_2 + Cosenos + Senos;

%Potencia de la señal:
%Por definicion:
Px = (ao_2)^2 + (Vpp^2)/12;
%Por Teorema de Parseval:
Px2 = (ao_2)^2 + 0.5*sum( an.^2 + bn.^2 );
%Relacion de las potencias:
Eta = Px2/Px;

%Fin
end

