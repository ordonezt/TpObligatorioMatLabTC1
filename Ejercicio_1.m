%
%   Description: Generador de funcion triangular
%
%   Author: 
%   
%   Date: 27/09/2018
%
%   Comment:	- Signal:	La se�al generada
%				- Vme:		El valor medio de la se�al
%				- Vrms:		El valor eficaz de la se�al
%				- T:		Periodo
%				- D:		Ubicacion del m�ximo
%				- Vpp:		Valor pico a pico
%				- DC:		Nivel de continua
%				- Ts:		Tiempo entre muestras
%				- Grafica un solo periodo
%
%   Tests run: 

function [ Signal, Vme, Vrms ] = Ejercicio_1 ( T, D, Vpp, DC, Ts )

%Creo un vector de tiempos
t = 0 : Ts : T-Ts;

%Longitud de la se�al
L = length(t);

%Ubicacion del m�ximo
iMax = L*D;

%Creo la rampa de subida
SignalUpper = -1 : 2/iMax : 1;   % DeltaY/DeltaX

%Creo la rampa de bajada
SignalLower = 1 : -2/((L-iMax)) : -1;   % -DeltaY/DeltaX

%Concateno ambas secciones de la se�al
Signal = horzcat( SignalUpper , SignalLower(2:end-1) );

%Multiplico por el valor pico y sumo la continua
Signal =(Vpp/2)*Signal + DC;%Se�al lista

%Valor medio: Promedio
Vme = mean(Signal);         %Valor medio listo

%Valor eficaz: Valor cuadratico medio
Vrms = rms(Signal);         %Valor eficaz medio
end

