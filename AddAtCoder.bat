@echo off

set PROBLEM_NAME=%~n1

rem ディレクトリを作成
cd /d %~dp1
mkdir %PROBLEM_NAME%

rem ディレクトリを移動
cd %PROBLEM_NAME%

rem gitを初期化
git init

rem dotnetを初期化
dotnet new console

rem .gitignoreをコピー
copy %~dp0\files\.gitignore .\

rem .csprojをコピー
copy /Y %~dp0\files\default.csproj .\%PROBLEM_NAME%.csproj

rem ソリューションを追加
dotnet new sln
dotnet sln add .\%PROBLEM_NAME%.csproj

rem commit
git add *
git commit -m "first commit." 
