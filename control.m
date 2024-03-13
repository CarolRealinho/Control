clear; close all; clc;
%% Initialize Script Parameters (User Input)

global CBvalue ;              % Initialize a variable in the workspace

IHeadType  = 'HEAD_PDQ80A';   % Type of Head Detector
QuadSN     = 69253006;        % Auto Aligner Serial Number
ServoXSN   = 27253967;        % X Motor Serial Number
ServoYSN   = 27254029;        % Y Motor Serial Number

Freq       = 10   ;           % Controll frequency         [Hz]
fwidth     = 1400 ;           % Figure window size: width  [pixel]    
fheight    = 700  ;           % Figure window size: height [pixel]

%% Create Matlab Figure Container

spos    = get(0,'ScreenSize');            % Screen Size
fpos    = get(0,'DefaultFigurePosition'); % figure default position

% Dimensionate the figure
fpos(3) = fwidth;              % Figure window size: width
fpos(4) = fheight;             % Figure window size: height
% Centering Figure
fpos(1) = (spos(3)-fpos(3))/2; % Figure window position: X
fpos(2) = (spos(4)-fpos(4))/2; % Figure window position: X

% Create Figure
f = figure('Position', fpos,...
           'Menu','None',...
           'Name','Pointing System GUI',...
           'KeyPressFcn', @keyPressed);

%% Create ActiveX Controller

[Quadpos, ServoXpos, ServoYpos] = ControllerLayout(fpos);

% Create controllers in the Figure
quad    = actxcontrol('APTQUAD.APTQuadCtrl.1', Quadpos, f);
servoX  = actxcontrol('MGMOTOR.MGMotorCtrl.1', ServoXpos, f);
servoY  = actxcontrol('MGMOTOR.MGMotorCtrl.1', ServoYpos, f);

%% Initialize Controllers

StartController(quad , QuadSN)
%pause(5);
StartController(servoX , ServoXSN)
%pause(5);
StartController(servoY , ServoYSN)
%pause(5);

fprintf('Initializing ...\n')
pause(5); % waiting for the GUI to load up;
fprintf('Start')
