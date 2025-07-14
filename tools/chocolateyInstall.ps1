$ErrorActionPreference = 'Stop';
$packageName = 'Witsy'
$url = 'https://github.com/nbonamy/witsy/releases/download/v2.11.1/Witsy-2.11.1-win32-x64.Setup.exe'
$installerType = 'exe'
$checksum = 'C0A06D15162C13515422587935EFA9B185944142BC6058C00639C27B680DABB7'
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
