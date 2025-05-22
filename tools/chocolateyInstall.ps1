$ErrorActionPreference = 'Stop';
$packageName = 'Witsy'
$url = 'https://github.com/nbonamy/witsy/releases/download/v2.6.5/Witsy-2.6.5-win32-x64.Setup.exe'
$installerType = 'exe'
$checksum = '8F6E42BA8DF625B312CB476845D16F136385F44E9C6A290D2596821660E2FFDB'
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
