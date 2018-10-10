%
%   Description: Analizador de sistemas
%
%   Author: 
%   
%   Date: 27/09/2018
%
%   Comment: 
%
%   Tests run: 

function Salida = Ejercicio_2( Num , Den )

Salida = Sistema( Num , Den );

[ Esc, te ] = step(Salida.H);
[ Imp, ti ] = impulse(Salida.H);

subplot(2,1,1);
plot(te,Esc);

subplot(2,1,2);
plot(ti,Imp);

end

