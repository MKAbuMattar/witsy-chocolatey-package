$ErrorActionPreference = 'Stop';
$packageName = 'Witsy'
$url = 'https://github.com/nbonamy/witsy/releases/download/v2.11.2/Witsy-2.11.2-win32-x64.Setup.exe'
$installerType = 'exe'
$checksum = '55373806BE9712BA91607C899F27F8D153E8AA6496F2CE2AAE2A74FEDE208234'
$checksumType = 'sha256'
$silentArgs = '/S /quiet'
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
