% AE 24/25, teste 1
% Paulo Pedreiras, Oct 10 2024

% --------------- PI --------------------
%Q1
R0=100
alfa=0.00385
teta=50
teta0=0
R=R0*(1+alfa*(teta-teta0))

%Q2
% b), ver. slide 28 ou livro

%Q3
%b) A fem de um TP é (vagamente) prop. à diferença de temperatura. Se a dif. diminui
(pelo aumento de ta) a fem diminui.

%Q4
beta=1;
deltaR_over_R=0.1/100;
Vs=5;
vo = beta/(beta+1)^2*4*deltaR_over_R*Vs

%Q5
C0=100e-9
C=130e-9
RH=0.5
alfa_h=(C/C0-1)/RH


%Q6
v1=1
v2=1.5
v3=2
R1=1e3
R2=2e3
R3=3e3
Rf=1e3
vo=-Rf*(v1/R1+v2/R2+v3/R3)

%Q7
% Passa baixo. Ver slides ou livro sobre opamps

%Q8
%c) Ambas. Ver slides e application note aí indicado

%Q9
r=5/2^12

%Q10
VREF=2.5
R1=1e3
R2=1e3
Vo=VREF*(1+R2/R1)

% --------------- PII ----------------------

%PII
%a - aplicar o método dos 3 pontos para linearizar resposta

beta = 3000
R25=1e3

Teta25=273.15+25
Teta0=273.15 + 0
Teta50=273.15+50

R0=R25*exp(beta*(1/Teta0-1/Teta25))
R50=R25*exp(beta*(1/Teta50-1/Teta25))

format shorteng
printf("R0=%d R50=%d\n", R0, R50)

RT1=R0
RT2=R25
RT3=R50

R=(RT2*(RT1+RT3)-2*RT1*RT3)/(RT1+RT3-2*RT2)

%b O objectivo do zener é igualar a tensão de saída do
% circuito do termistor a 0oC, para ser subtarido no andar seguinte (amp. dif.)
Vs=5
vo_0=Vs/(R0+R)*R
printf("vo para 0oC é %f\n", vo_0)

iz=10e-3
R2=(Vs-vo_0)/iz
printf("E.g. para i=%f R2 é %f\n", iz, R2);

%c - buffer, para anular efeito de carga entre circ. do termistor e amplif. diferença.
% Imped. entrada infinita e de saida nula (idealmente)

%d - amplificador diferença. Subtrai a tensão de saida do circuito do termistor a 0oC
% (gerada pelo zener) para a sua saidaa à temperatura "actual", por forma a que vout
% varie entre 0V e 5VC.

%e)
Vref=5
vo_50=Vs/(R50+R)*R
deltaVo=vo_50 - vo_0
g=Vref/deltaVo
printf("vo_0=%f vo_50=%f Vref=%f Ganho=%f\n",vo_50, vo_0, Vref,g)

%R3 = R4 e R5=R6
%R6/R3=G
% Fazer R4 de 100's ou kohms para não retirar demasiada corrente do zener (depende da folga dada na alinea b)
