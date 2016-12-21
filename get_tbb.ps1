$tbb_version="tbb2017_20161128oss"

# unzip function
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}


# donwload prebuild tbb
wget "https://www.threadingbuildingblocks.org/sites/default/files/software_releases/windows/${tbb_version}_win.zip" -OutFile "${tbb_version}.zip"

# unzip
Unzip "$PWD\${tbb_version}.zip" "$PWD"

# rename unzipped directory to tbb to ease packaging
rni ${tbb_version} tbb
