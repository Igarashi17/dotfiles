%******************* startup.m *******************
% Created: 2013/10/16
% Last Change: 2015-Aug-04.
% MATLAB startup file
%******************************************************

% beep音を抑制
beep off
% chenge default encording
feature('DefaultCharacterSet', 'UTF8');
% 自分で作ったfuncのhelp表示のため

%--------------------------------------------------------- %
% add paths
%--------------------------------------------------------- %
%--- not win & not mac
if( (ismac == 0) & (ispc == 0) )
    % genpath以下を再帰的にaddpath
    addpath(genpath('~/sources'));
    addpath('~/shscripts');

%--- for mac
elseif (ismac == 1)
    addpath(genpath('~/lab/src_lib/matlab/'));
end

%-------------------------------------------------------- %
% prevention of matlab crash
% when cec2013 mex file was called from diffrent directory.
%-------------------------------------------------------- %
%  curDir = pwd; % keep current dir
%
%  if( (ismac == 0)&(ispc == 0) ) % for matlab machine
%  	cec13path =	'~/benchmark_cec2013_mat';
%  elseif (ismac == 1) % for mac
%  	cec13path =	'~/Dropbox/Lab/benchmark_cec2013_mat';
%  end
%
%  cd(cec13path);
%  f = cec13_func(rand(2, 1), 1)
%  cd(curDir);
%
%
%-------------------------------------------------------- %
% default figure screen position
%-------------------------------------------------------- %
ssize = get(0, 'screensize' );
if ssize == [1 1 2560 1440 ] % for iMac
    def_pos = [1 926 560 420]; % left top
    set(0, 'defaultFigurePosition', def_pos );
    disp( [ 'default figure position: ', num2str(def_pos) ] );
    clear def_pos ssize;
end