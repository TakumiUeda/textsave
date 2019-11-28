#データをテキスト形式で保存
実験データなどをMATLABに取り込み処理後保存する、Simulinkで動かしているロボットのデータを撮る時など、mat形式以外で保存したい時があると思います。
保存用のソースを書くにあたり、まずMファイルでの実装を行いました。

#コードの解説
現在の時間をとってきます。

```
t = now;
datetime=datetime(t,'ConvertFrom','datenum');
clear t;
```

dd-mmm-yyyy_HH-MM-SSは時間のフォーマットを設定します。
この場合、29-Nov-2019_01-42-55と出力されます。

```
datefmt = 'dd-mmm-yyyy_HH-MM-SS';
```

datefmtに保存された時間データを元にフォルダを作成します。

```
mkdir(dirname);
```

ファイルを開いてデータを書き込みます。

```
fileID= fopen([dirname,filename],'a');
fprintf(fileID,str);
fclose(fileID);
```


#ソース全体
```
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
```

# License
MIT