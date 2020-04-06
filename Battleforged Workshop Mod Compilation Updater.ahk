#NoEnv
SetWorkingDir %A_ScriptDir%
#CommentFlag é

objWMIService := ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\" A_ComputerName "\root\cimv2")
For objOperatingSystem in objWMIService.ExecQuery("Select * from Win32_OperatingSystem")
   Caption := objOperatingSystem.Caption
   
if InStr(Caption, "Windows 10") {
	SuccessCheckPath := A_Temp . "\BFWMCSuccessCheck.txt"
	FileAppend,"1", %SuccessCheckPath%
	RunWait, powershell.exe -command echo 'Angron did nothing wrong.`nDownloading the Battleforged Workshop Mod Compilation...`n=][=' ; $ProgressPreference = 'SilentlyContinue'; $url='https://raw.github.com/BigSig/Battleforged-Workshop-Mod-Compilation/master/battleforged_workshop_mod_compilation.zip' ; $downloadtemp =  $env:temp+'\Battleforged-Workshop-Mod-Compilation.zip' ; Invoke-WebRequest -Uri $url -OutFile $downloadtemp  ; $localtemp = $env:temp+'\Battleforged-Workshop-Mod-Compilation.zip' ; $ProgressPreference = 'Continue'; $tempfile = $env:temp+'\BFWMCSuccessCheck.txt' ; echo '1' | Out-File -FilePath $tempfile ; $pathtosaves = [environment]::getfolderpath('mydocuments')+'\My Games\Tabletop Simulator' ; Microsoft.PowerShell.Archive\expand-archive -force -path $localtemp -destinationpath $pathtosaves; if($LASTEXITCODE){echo '1' | Out-File -FilePath $tempfile }else{echo '0' | Out-File -FilePath $tempfile}
	SuccessCheckPath := A_Temp . "\BFWMCSuccessCheck.txt"
	FileRead, SuccessCheck, %SuccessCheckPath%
	if InStr(SuccessCheck,"0"){
	Msgbox "TTS40k Model Catalogue was installed!"
	}else{
	Msgbox Something went wrong, please try again. If this error persists, download the Battleforged Workshop Mod Compilation from https://github.com/BigSig/Battleforged-Workshop-Mod-Compilation and install it manually. (Instructions are included inside the zip.) 
	}
	FileDelete, %SuccessCheckPath%
	exitapp
	}else{
Msgbox This installer only supports Windows 10. Windows 7 is out of support, for the love of The Manperor, update now! Windows 8/8.1 is about to leave support, it sucks I know but you'll need to update soon. Please download the Battleforged Workshop Mod Compilation from https://github.com/BigSig/Battleforged-Workshop-Mod-Compilation and install it manually. (Instructions are included inside the zip.)
exitapp
}
