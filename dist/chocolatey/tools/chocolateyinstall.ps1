$ErrorActionPreference = \'Stop\';


$packageName = \'grib.tools\'
$version = "' . $version . '"
$url = "https://cli.run.pivotal.io/stable?release=windows32-exe&version=$($version)&source=github-rel"
$url64 = "https://cli.run.pivotal.io/stable?release=windows64-exe&version=$($version)&source=github-rel"
$installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$validExitCodes = @(0)


Install-ChocolateyZipPackage "$packageName" "$url" "$installDir" "$url64"';


$packageName = 'grib-tools'
$url = 'https://github.com//bliker/cmder/releases/download/v1.1.4.1/cmder.7z'
$url64 = "https://cli.run.pivotal.io/stable?release=windows64-exe&version=$($version)&source=github-rel"
$binRoot = Get-BinRoot
$installPath = Join-Path $binRoot "cmder"

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$installPath" `
                             -Url64bit "$url64" `

# Add "cmder.exe" to path
Write-Verbose "Adding `'$installPath`' to path"
Install-ChocolateyPath "$installPath" 'user'