$packageName = 'grib-tools'
$url = 'https://github.com/0x1mason/GribApi.XP/releases/download/v@@VERSION@@/grib-tools-@@VERSION@@-x64.7z'
$url64 = "https://github.com/0x1mason/GribApi.XP/releases/download/v@@VERSION@@/grib-tools-@@VERSION@@-x86.7z"
$installPath = "$env:ChocolateyInstall\bin\grib-tools"
Write-Verbose $installPath
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$installPath" `
                             -Url64bit "$url64" `


Write-Verbose "Adding `'$installPath`' to path"
Install-ChocolateyPath "$installPath" "User"