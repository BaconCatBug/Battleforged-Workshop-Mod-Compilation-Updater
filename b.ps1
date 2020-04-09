echo '=][= Angron did nothing wrong. =][=';
echo 'Downloading the Battleforged Workshop Mod Compilation...';
$currentGlobalPreference = $global:ProgressPreference;
$global:ProgressPreference = 'SilentlyContinue';
$url='https://raw.github.com/BigSig/Battleforged-Workshop-Mod-Compilation/master/battleforged_workshop_mod_compilation.zip';
$url2='https://raw.githubusercontent.com/BaconCatBug/Battleforged-Workshop-Mod-Compilation-Updater/master/Battleforged_Workshop_Mod_Compilation_Updater_(Just_Double_Click_Me).bat'
$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent;
$downloadTemp =  $env:temp+'\Battleforged-Workshop-Mod-Compilation.zip';
$downloadTemp2 =  $scriptDir+'\Temp.bat';
$checkSuccess = 1;
$wc = New-Object net.webclient;
$wc.Downloadfile($url, $downloadTemp);
$wc = New-Object net.webclient;
$wc.Downloadfile($url2, $downloadTemp2);
$pathtosaves = [environment]::getfolderpath('mydocuments')+'\My Games\Tabletop Simulator';
Microsoft.PowerShell.Archive\expand-archive -force -path $downloadTemp -destinationpath $pathtosaves;
Rename-Item -Path $scriptDir'\Battleforged_Workshop_Mod_Compilation_Updater_(Just_Double_Click_Me).bat' -NewName "Battleforged_Workshop_Mod_Compilation_Updater_(Just_Double_Click_Me).bat.old"
Rename-Item -Path $scriptDir'\Temp.bat' -NewName 'Battleforged_Workshop_Mod_Compilation_Updater_(Just_Double_Click_Me).bat'
Remove-Item -Path $scriptDir'\Battleforged_Workshop_Mod_Compilation_Updater_(Just_Double_Click_Me).bat.old'