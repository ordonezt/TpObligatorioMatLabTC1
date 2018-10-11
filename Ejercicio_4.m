%
%   Description: Analizador RLC serie
%
%   Author: 
%   
%   Date: 27/09/2018
%
%   Comment: 
%
%   Tests run: 

function [ VR, VL, VC, Ps] = Ejercicio_4( Vmax, f, fase, t, R, L, C )
j = 0 + 1i;

%Cuento la cantidad de armonicas
n = length(Vmax);

%Inicializo las tensiones instantaneas:
VR = zeros(1,length(t));
VL = zeros(1,length(t));
VC = zeros(1,length(t));

%Inicializo tensiones eficaces:
Vef = zeros(1,n);
VRef = zeros(1,n);
VLef = zeros(1,n);
VCef = zeros(1,n);

%Inicializo impedancias:
ZL = zeros(1,n);
ZC = zeros(1,n);
ZT= zeros(1,n);

%Inicializo la corriente eficaz:
Ief = zeros(1,n);

for i = 1:n
	
	%Tensiones de exitacion:
	Vef(i) = (Vmax(i)/sqrt(2))*( cos(deg2rad(fase(i))) + j*sin(deg2rad(fase(i))) );
	
	%Impedancias:
	if i==1
		ZR = R;
	end
	ZL(i) = 0 + j*2*pi*f(i)*L;
	ZC(i) = 0 - j*1/(2*pi*f(i)*C);
	ZT(i) = ZR + ZL(i) + ZC(i);
	
	%Corriente:
	Ief(i) = Vef(i)/ZT(i);
	
	%Tensiones eficaces particulares:
	VRef(i) = Ief(i)*ZR;
	VLef(i) = Ief(i)*ZL(i);
	VCef(i) = Ief(i)*ZC(i);
	
	%Tensiones instantaneas:
	VR = VR + abs(VRef(i))*sqrt(2)*sin( 2*pi*f(i)*t + angle(VRef(i)) );
	VL = VL + abs(VLef(i))*sqrt(2)*sin( 2*pi*f(i)*t + angle(VLef(i)) );
	VC = VC + abs(VCef(i))*sqrt(2)*sin( 2*pi*f(i)*t + angle(VCef(i)) );
	
end

V = sqrt( sum(Vef.^2) );
I = sqrt( sum(Ief.^2) );

Ps = V*I;

end

