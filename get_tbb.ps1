$tbb_version="tbb2017_20170604oss"

# unzip function
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

# donwload prebuild tbb
wget "https://github.com/01org/tbb/releases/download/2017_U7/${tbb_version}_win.zip" -OutFile "${tbb_version}.zip"

# unzip
Unzip "$PWD\${tbb_version}.zip" "$PWD"

# rename unzipped directory to tbb to ease packaging
rni ${tbb_version} tbb
