$ErrorActionPreference = 'Stop';
$url = 'https://github.com/nbonamy/witsy/releases/download/v1.37.4/Witsy-1.37.4-win32-x64.Setup.exe'
$checksum = '52d005ca4bfd31652818bb9b36ff8af2cc295c5c6b2a42e1c3f03f0602354ba6'
$checksumType = 'sha256'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  checksum       = $checksum
  checksumType   = $checksumType
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
