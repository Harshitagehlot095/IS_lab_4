close all
clear all
clc
%% read the image with hand-written characters
pavadinimas = 'VAGTSMRUWZ.png';
pozymiai_tinklo_mokymui = pozymiai_raidems_atpazinti(pavadinimas, 6);
%% Development of character recognizer
% take the features from cell-type variable and save into a matrix-type variable
P = cell2mat(pozymiai_tinklo_mokymui);
% create the matrices of correct answers for each line (number of matrices = number of symbol lines)
T = [eye(10), eye(10), eye(10), eye(10), eye(10), eye(10)];
% create an RBF network for classification with 13 neurons, and sigma = 1
tinklas = newrb(P,T,0,1,13);
%% Test of the network (recognizer)
% estimate output of the network for unknown symbols (row, that were
%not used during training)
P2 = P(:,12:22);
Y2 = sim(tinklas, P2);
% find which neural network output gives maximum value
[a2, b2] = max(Y2);
%% Visualize result
% calculate the total number of symbols in the row
raidziu_sk = size(P2,2);
% we will save the result in variable 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
switch b2(k)
case 1
% the symbol here should be the same as written first symbol in your image
atsakymas = [atsakymas, 'V'];
case 2
atsakymas = [atsakymas, 'A'];
case 3
atsakymas = [atsakymas, 'G'];
case 4
atsakymas = [atsakymas, 'T'];
case 5
atsakymas = [atsakymas, 'S'];
case 6
atsakymas = [atsakymas, 'M'];
case 7
atsakymas = [atsakymas, 'R'];
case 8
atsakymas = [atsakymas, 'U'];
case 9
atsakymas = [atsakymas, 'W'];
case 10
atsakymas = [atsakymas, 'Z'];
end
end
% show the result in command window
disp(atsakymas)
% % figure(7), text(0.1,0.5,atsakymas,'FontSize',38)
%% Extract features of the test image
pavadinimas = 'VGTU.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);
%% Perform letter/symbol recognition
% features from cell-variable are stored to matrix-variable
P2 = cell2mat(pozymiai_patikrai);
% estimating neuran network output for newly estimated features
Y2 = sim(tinklas, P2);
% searching which output gives maximum value
[a2, b2] = max(Y2);
% calculating number of symbols - number of columns
raidziu_sk = size(P2,2);
atsakymas = [];
for k = 1:raidziu_sk
switch b2(k)
case 1
atsakymas = [atsakymas, 'V'];
case 2
atsakymas = [atsakymas, 'A'];
case 3
atsakymas = [atsakymas, 'G'];
case 4
atsakymas = [atsakymas, 'T'];
case 5
atsakymas = [atsakymas, 'S'];
case 6
atsakymas = [atsakymas, 'M'];
case 7
atsakymas = [atsakymas, 'R'];
case 8
atsakymas = [atsakymas, 'U'];
case 9
atsakymas = [atsakymas, 'W'];
case 10
atsakymas = [atsakymas, 'Z'];
end
end
figure(8), text(0.1,0.5,atsakymas,'FontSize',38), axis off