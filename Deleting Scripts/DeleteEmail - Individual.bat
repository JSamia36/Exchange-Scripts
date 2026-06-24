:: IF SUBJECT CONTAINS ' or " THIS WILL NOT WORK!!!

@echo off
set /p  "sender=From: " 
set /p "subject=Subject: " 
set /p "toDel=Delete from what inbox: "

:: Verify not blank
if "%sender%"=="" (goto :ERROR_Sender)
if "%subject%"=="" (goto :ERROR_Subject)
if "%toDel%"=="" (goto :ERROR_Inbox)

:: Making sure the Sender is actually an email
echo %sender% | findstr /i "@" >nul 
if %errorlevel%==1 (goto :ERROR_SENDER)

echo %sender% | findstr /i "@" >nul 
if %errorlevel%==1 (goto :ERROR_Inbox)

:: Last Check before deleting
echo This will delete: 
echo SUBJECT: %subject% 
echo FROM: %sender% 
echo TO: %toDel%.
set /p "confirm=Please Confirm with 'Y' to Delete: "
if "%confirm%" NEQ "Y" (goto :ERROR_Confirm) 

:: Delete function
:DELETE_Function
PowerShell.exe -noexit -command ". 'c:\Program Files\Microsoft\Exchange Server\V15\Bin\RemoteExchange.ps1'; Connect-ExchangeServer -auto; Search-Mailbox -Identity %toDel% -SearchQuery 'From:%sender% AND Subject:%subject%' -DeleteContent -Force"
echo "Deleted Successfully"

:: Safety to not delete everything from a Sender
:ERROR_Sender
echo ERROR - please provide a Sender Email Address
pause
exit

:: Safety to not delete everything with a Subject Line
:ERROR_Subject
echo ERROR - please provide a Subject
pause
exit

:: Safety to not delete without Inbox
:ERROR_Inbox
echo ERROR - please provide a Inbox to remove from
pause
exit

:: Verify before mass Deleting
:ERROR_Confirm
echo ERROR - please confirm before proceeding
pause
exit
