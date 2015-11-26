% Universidade de Brasilia
% Sinais e Sistemas 2015/2
% Trabalho II.a
% Grupo: Eduardo Scartezini - 14/0137084 e 
%        Lucas Santos - 14/0151010.

% Resposta em frequencia H(jw) do circuito RC Passa-altas 

clear all
close all
clc

% Dados:
%   H(jw) = RCjw
%           ----------
%           (1 + RCjw)
%   R = 2*10 Ohms
%   C = 1*10^(-6) F

% Objetivos:
%   Plotar o grafico (Modulo e fase) de H(jw), para verificar se a frequencia
% de corte estah conforme planejada
 
% Definindo os valores comerciais de R e C
R = 20;
C = 0.000001;

% Vetor de frequencias [Hz]
f = [-1:0.0001:1];

% Vetor de frequencias [rad]
w = f.*2*pi;

% Definindo a resposta em frequencia do circuito
H = (w.*(R*C*1i))./(1 + w.*(R*C*1i));

% Definindo o modulo e a fase
fase = angle(H);
modulo = abs(H);

% Plotando
figure;
subplot(2,1,1);
plot(w,abs(H));
xlabel('Frequencia [Hz]');
ylabel('|H(jw)|');

subplot(2,1,2);
plot(w,fase);
xlabel('Frequencia [Hz]');
ylabel('\angle H(jw) [rad/s]');

%saveas(gcf, 'Grafico.png');