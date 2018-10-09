classdef Sistema
	%UNTITLED Summary of this class goes here
	%   Detailed explanation goes here
	
	properties
		H		%Objeto funcion transferencia
		A		%Matriz de estados
		B		%Matriz de entrada
		C		%Matriz de salida
		D		%Matriz de transmision directa
		Polos	%Vector de polos
		Ceros	%Vector de ceros
		Orden	%Orden del sistema
		Estable	%Estabilidad del sistema
		Fase	%Sistema de fase minima o no
	end
	
	methods
		function obj = Sistema(Num,Den)
			
			%Defino la funcion transferencia
			obj.H = tf(Num,Den);
			
			%Creo las matrices de estados
			MatEst = ss(obj.H);
			obj.A = MatEst.A;
			obj.B = MatEst.B;
			obj.C = MatEst.C;
			obj.D = MatEst.D;
			
			%Defino los vectores de polos y ceros
			obj.Ceros = roots(Num);
			obj.Polos = roots(Den);
			
			%Defino el orden del sistema
			obj.Orden = lenght(obj.Polos);
			
			%Defino la estabilidad o no del sistema
			%Para que el sistema sea estable no puede haber polos en el
			%semiplano derecho
			obj.Estable = ~any( real(obj.Polos) > 0 );%Busco si hay algun polo con parte real mayor que 0
			
			%Defino la fase minima o no del sistema
			%Para que haya fase minima todos los polos y ceros deben estar
			%en el semiplano izquierdo
			obj.Fase = (~any( real(obj.Ceros) > 0 )) & Estable;
			
		end
	end
	
end

