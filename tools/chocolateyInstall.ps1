$ErrorActionPreference = 'Stop';
$packageName = 'Witsy'
$url = 'https://github.com/nbonamy/witsy/releases/download/v3.1.1/Witsy-3.1.1-win32-x64.Setup.exe'
$installerType = 'exe'
$checksum = '548EC1AEDE6F8B7DFDDFE9958A4AAA26A5F496D7B1F20D73B088F8D01051A1EC'
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
