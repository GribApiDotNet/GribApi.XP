$packageName = 'grib-tools'
$url = 'https://github.com/0x1mason/GribApi.XP/releases/download/v1.14.5-beta/grib-tools-x64.7z'
$url64 = "https://github.com/0x1mason/GribApi.XP/releases/download/v1.14.5-beta/grib-tools-x86.7z"
$installPath = "$env:ChocolateyInstall\bin\grib-tools"
Write-Verbose $installPath
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$installPath" `
                             -Url64bit "$url64" `


Write-Verbose "Adding `'$installPath`' to path"
Install-ChocolateyPath "$installPath"