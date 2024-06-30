@echo off
chcp 65001
title tools by xako
setlocal enabledelayedexpansion
color a

:: Effacer l'écran et afficher l'ASCII art
cls
echo          ██▓     ▒█████   ▒█████   ██▓███    ██████ 
echo         ▓██▒    ▒██▒  ██▒▒██▒  ██▒▓██░  ██▒▒██    ▒ 
echo         ▒██░    ▒██░  ██▒▒██░  ██▒▓██░ ██▓▒░ ▓██▄   
echo         ▒██░    ▒██   ██░▒██   ██░▒██▄█▓▒ ▒  ▒   ██▒
echo         ░██████▒░ ████▓▒░░ ████▓▒░▒██▒ ░  ░▒██████▒▒
echo         ░ ▒░▓  ░░ ▒░▒░▒░ ░ ▒░▒░▒░ ▒▓▒░ ░  ░▒ ▒▓▒ ▒ ░
echo        ░ ░ ▒  ░  ░ ▒ ▒░   ░ ▒ ▒░ ░▒ ░     ░ ░▒  ░ ░
echo           ░ ░   ░ ░ ░ ▒  ░ ░ ░ ▒  ░░       ░  ░  ░  
echo             ░  ░    ░ ░      ░ ░                 ░


:: Demander le webhook Discord
set /p webhook="Entrez le webhook Discord: "

:: Demander le message
set /p message="Entrez le message: "

:: Demander le nombre de fois
set /p count="Entrez le nombre de fois que le message doit être envoyé: "

:: Vérifier que le nombre de fois est un nombre valide
if not "%count%"=="" (
  for /L %%i in (1,1,%count%) do (
    echo Envoi du message %%i de %count%
    curl -H "Content-Type: application/json" -X POST -d "{\"content\": \"%message%\"}" %webhook%
  )
) else (
  echo Le nombre de fois doit être un nombre valide.
)

echo Tous les messages ont été envoyés.
pause
