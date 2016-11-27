## GribApi.XP

GribApi.XP is a friendly fork of the ECMWF's [GRIB API](https://software.ecmwf.int/wiki/display/GRIB/What+is+GRIB-API). It makes a few changes to improve cross-platform (hence the `XP`) parity of features and packages. At the moment, that mostly means improving support for Windows, but changes for all platforms are welcome.

### GRIB Tools Packages

#### Chocolatey (Windows)

To install the GRIB tools from [Chocolatey](https://chocolatey.org/packages/grib-tools), run
```shell
C:\> choco install grib-tools
```

##### Changes from Vanilla 1.14.5 for Windows
* PNG compression support
* Pre-built `definitions` and `samples`
* Thread safety for Windows via OpenMP
* `grib_exit` and `grib_assert` hooks for custom handling of fatal errors (details coming soon)

##### Building
You can build directly with Visual Studio using `./build/Grib.Api.Master.sln`.

To build x86 and x64 libs together, you can run `build\build_gribapi.cmd [re|build] [vs tools version] [Debug|Release] [opt: package version]`, e.g.
```shell
C:\> build\build_gribapi.cmd rebuild 12 Debug
```

### Updating grib_api
Not scripted yet, sorry :(

1. Delete everything in `root/grib_api`.
2. Download the latest version from https://software.ecmwf.int/wiki/display/GRIB/Download
3. Extract the files with `tar` or `7zip` and copy the files to `root/grib_api` directory.
4. Open a VS Developer Command Prompt.
```shell
> powershell
PS > cd root/grib_api/windows
PS > dir -Recurse *.vcproj | ForEach-Object { devenv /upgrade /q $_.FullName}
```
5. From a Bash prompt (e.g., `Git Bash` or `Bash on Windows`)
```shell
$ cd root/grib_api/src
$ perl -p -i.bak -e 's/\sexit(?=\(\w)/ grib_exit/g' *.c
$ rm *.bak && git checkout grib_dumper_class_c_code.c grib_lex.c md5.c
$ git am --ignore-whitespace ../../build/grib_errors_c.patch
$ git am --ignore-whitespace ../../build/grib_api_h.patch
$ cd ../windows
$ git am --ignore-whitespace ../../build/vsproj.patch
$ git add -A :/
$ git commit -m "Some commit msg"
```

