$ErrorActionPreference = 'Stop';
$packageName = 'Witsy'
$url = 'https://github.com/nbonamy/witsy/releases/download/v3.2.2/Witsy-3.2.2-win32-x64.Setup.exe'
$installerType = 'exe'
$checksum = '5C2AFD5C3652CF7A4542DA35ACB7FA185025CC8705154376D9744363D2274F47'
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
