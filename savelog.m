echo on
% user editable m-file script for text log
% テキスト形式保存のためのMファイルスクリプト
%
% Author:      Takumi Ueda
% Date:        2019-11-29

echo off
clear all

format longG

t = now;
datetime=datetime(t,'ConvertFrom','datenum');
clear t;

datefmt = 'dd-mmm-yyyy_HH-MM-SS';
savedir='./log';
str='test';             % log
filename='/test.txt';   % filename

dirname=[savedir,datestr(datetime,datefmt)];
    
mkdir(dirname);

fileID= fopen([dirname,filename],'a');
fprintf(fileID,str);
fclose(fileID);
