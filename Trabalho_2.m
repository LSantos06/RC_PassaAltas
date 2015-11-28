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
%   frequencia de corte = 1/(2*pi*R*C)
%   tensao de saida da frequencia de corte = 1/2^(1/2)

% Objetivos:
%   Plotar o grafico (Modulo e fase) de H(jw), para verificar se a frequencia
% de corte estah conforme planejada

for num = 1:2
    % Definindo os valores comerciais de R e C
    if (num == 1)
    % Para obter o grafico base (ordem 1)
        R = 1; 
        C = 1;
    else
    % Para obter o grafico resultado (ordem 2*10^(-5))       
        R = 20; 
        C = 0.000001;
    end
    
    % Vetor de frequencias [Hz], com tamanhos especificos para cada RC,
    % obtendo assim graficos semelhantes.
    if (num == 1)
    % Para obter o grafico base
        f = [-2:0.01:2]; 
    else
    % Para obter o grafico resultado
        f = [-100000:0.01:100000];
    end
    
    % Vetor de frequencias [rad/s]
    w = f.*2*pi;

    % Definindo a resposta em frequencia do circuito
    H = (w.*(R*C*1i))./(1 + w.*(R*C*1i));

    % Definindo o modulo e a fase
    fase = angle(H);
    modulo = abs(H);

    % Plotando
    figure;
    subplot(2,1,1);
    plot(w,abs(H)); hold on;

    % Plotando o ponto da frequencia de corte
    if (num == 2)
        plot(50265.4824, 0.707, 'r*'); hold on;
        plot(-50265.4824, 0.707, 'r*');
    end
    
    xlabel('Frequencia [rad/s]');
    ylabel('|H(jw)|');

    subplot(2,1,2);
    plot(w,fase); hold on;
    
    % Plotando o ponto da frequencia de corte
    if (num == 2)
        plot(0, (pi/2), 'b*'); hold on;
        plot(0, (-pi/2), 'b*'); hold on;
        plot(-50265.4824, (-pi/4), 'g*'); hold on;
        plot(50265.4824, (pi/4), 'g*');    
    end
    
    xlabel('Frequencia [rad/s]');
    ylabel('\angle H(jw)');
    
    % Salvando as imagens obtidas
    if (num == 1)
        saveas(gcf, 'graficoBase.png');
    else
        saveas(gcf, 'graficoResultado.png');
    end
end