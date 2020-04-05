#NoEnv
SetWorkingDir %A_ScriptDir%
#CommentFlag é

RunWait, powershell.exe -command echo 'Downloading the TTS40k Model Catalogue...' ; $ProgressPreference = 'SilentlyContinue'; $url='https://raw.github.com/BigSig/TTS-Model-Catalogue/master/TTS40k` Model` Catalogue.zip' ; $downloadtemp =  $env:temp+'\TTS40k_Model_Catalogue.zip' ; Invoke-WebRequest -Uri $url -OutFile $downloadtemp  

objWMIService := ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\" A_ComputerName "\root\cimv2")
For objOperatingSystem in objWMIService.ExecQuery("Select * from Win32_OperatingSystem")
   Caption := objOperatingSystem.Caption
   
if InStr(Caption, "Windows 10") {
	RunWait, powershell.exe -command $localtemp = $env:temp+'\TTS40k_Model_Catalogue.zip' ; $pathtosaves = [environment]::getfolderpath('mydocuments')+'\My Games\Tabletop Simulator' ; Microsoft.PowerShell.Archive\expand-archive -force -path $localtemp -destinationpath $pathtosaves
	if(%A_LastError%==0){
	Msgbox "TTS40k Model Catalogue was installed!"
	}else{
	Msgbox "Something went wrong, please download the TTS40k Model Catalogue manually from https://github.com/BigSig/TTS-Model-Catalogue"
	}
	exitapp
	}else{
Msgbox %  "This installer only supports Windows 10. Windows 7 is out of support, for the love of the Manperor Update now! Windows 8/8.1 is about to leave support, it sucks I know but you'll need to update soon." 
exitapp
}
