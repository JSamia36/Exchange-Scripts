:: IF SUBJECT CONTAINS ' or " THIS WILL NOT WORK!!! Updated version hopefully coming soon 

@echo off
set /p  "sender=From: " 
set /p "subject=Subject: " 

:: Verify not blank
if "%sender%"=="" (goto :ERROR_Sender)
if "%subject%"=="" (goto :ERROR_Subject)

:: Making sure the Sender is actually an email
echo %sender% | findstr /i "@" >nul 
if %errorlevel%==1 (goto :ERROR_SENDER)

:: Last Check before deleting
echo This will delete: 
echo SUBJECT: %subject%
echo SENT BY: %sender% from every inbox.
set /p "confirm=Please Confirm with 'Y' to Delete: "
if "%confirm%" NEQ "Y" (goto :ERROR_Confirm) 

:: Delete function
:DELETE_Function
PowerShell.exe -noexit -command ". 'c:\Program Files\Microsoft\Exchange Server\V15\Bin\RemoteExchange.ps1'; Connect-ExchangeServer -auto; Get-Mailbox -ResultSize Unlimited | Search-Mailbox -SearchQuery 'From:%sender% AND Subject:%subject%' -DeleteContent -Force"
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

:: Verify before mass Deleting
:ERROR_Confirm
echo ERROR - please confirm before proceeding
pause
exit
