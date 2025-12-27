$ErrorActionPreference = 'Stop';
$packageName = 'Witsy'
$url = 'https://github.com/nbonamy/witsy/releases/download/v3.3.1/Witsy-3.3.1-win32-x64.Setup.exe'
$installerType = 'exe'
$checksum = '31A1DAA4F39A20AA504A8B1E998142B584657294183C813F37D64221800DFB05'
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
