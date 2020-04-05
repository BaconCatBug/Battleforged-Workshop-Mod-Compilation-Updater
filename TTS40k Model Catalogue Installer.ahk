#NoEnv
SetWorkingDir %A_ScriptDir%
#CommentFlag é

RunWait, powershell.exe -command echo 'Downloading the Catalogue...' ; $ProgressPreference = 'SilentlyContinue'; $url='https://raw.github.com/BigSig/TTS-Model-Catalogue/master/TTS40k` Model` Catalogue.zip' ; $downloadtemp =  $env:temp+'\TTS40k_Model_Catalogue.zip' ; Invoke-WebRequest -Uri $url -OutFile $downloadtemp  

objWMIService := ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\" A_ComputerName "\root\cimv2")
For objOperatingSystem in objWMIService.ExecQuery("Select * from Win32_OperatingSystem")
   Caption := objOperatingSystem.Caption
   
if InStr(Caption, "Windows 10") {
	if(CheckSaveLocation()==1){
	RunWait, powershell.exe -command $localtemp = $env:temp+'\TTS40k_Model_Catalogue.zip' ;$pathtosaves = get-itempropertyvalue 'HKCU:\Software\Valve\Steam' 'SteamPath' ; $pathtosaves=$pathtosaves+'\steamapps\common\Tabletop Simulator\Tabletop Simulator_Data' ;  Microsoft.PowerShell.Archive\expand-archive -force -path $localtemp -destinationpath $pathtosaves
	exitapp
	}else{
	RunWait, powershell.exe -command $localtemp = $env:temp+'\TTS40k_Model_Catalogue.zip' ; $pathtosaves = [environment]::getfolderpath('mydocuments')+'\My Games\Tabletop Simulator' ; Microsoft.PowerShell.Archive\expand-archive -force -path $localtemp -destinationpath $pathtosaves
	exitapp
	}
}else{
Msgbox %  "This installer only supports Windows 10. Windows 7 is out of support, for the love of the Manperor Update now! Windows 8/8.1 is about to leave support, it sucks I know but you'll need to update soon." 
}

CheckSaveLocation(){
Loop, Reg, HKEY_CURRENT_USER\Software\Berserk Games\Tabletop Simulator, KV
{
if (instr(A_LoopRegName, "ConfigGame")){
    if (A_LoopRegType = "key")
        value := ""
    else
    {
        RegRead, value
        if ErrorLevel
            value := "*error*"
    }
	if(instr(value,"224c6f636174696f6e223a31")){
	return 1
	}else{
	return 0
	}
}
}
}