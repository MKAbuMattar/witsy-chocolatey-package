$ErrorActionPreference = 'Stop';
$packageName = 'Witsy'
$url = 'https://github.com/nbonamy/witsy/releases/download/v3.5.0/Witsy-3.5.0-win32-x64.Setup.exe'
$installerType = 'exe'
$checksum = 'FFF207EF44F67CC5031B0DDD42F96197FD6E94C24592BE228EACE0891EDF86C1'
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
