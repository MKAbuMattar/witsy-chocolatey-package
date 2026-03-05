$ErrorActionPreference = 'Stop';
$packageName = 'Witsy'
$url = 'https://github.com/nbonamy/witsy/releases/download/v3.5.2/Witsy-3.5.2-win32-x64.Setup.exe'
$installerType = 'exe'
$checksum = 'B604BB522EFEEEF98B4BC9E99C1FF8ED3B0775E9F70D8EE68D5BC9917F9A3099'
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
