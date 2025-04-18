$ErrorActionPreference = 'Stop';
$packageName = 'Witsy'
$url = 'https://github.com/nbonamy/witsy/releases/download/v2.4.8/Witsy-2.4.8-win32-x64.Setup.exe'
$installerType = 'exe'
$checksum = '03081BEFD5AC10A5466342ED67E1CBBCA8352784F2E12FF7777D11DEB12748CE'
$checksumType = 'sha256'
$silentArgs = '/S'
$validExitCodes = @(0)

$installPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$downloadFile = Join-Path $installPath "$($packageName)Setup.exe"

Get-ChocolateyWebFile -PackageName $packageName `
    -FileFullPath $downloadFile `
    -Url $url `
    -Checksum $checksum `
    -ChecksumType $checksumType
Install-ChocolateyInstallPackage -PackageName $packageName `
    -FileType $installerType `
    -SilentArgs $silentArgs `
    -File $downloadFile `
    -ValidExitCodes $validExitCodes
