<?php

abstract class FileNamingStrategy {
    abstract function createLinkName($filename);	
}
 
class ZipFileNamingStrategy extends FileNamingStrategy {
    function createLinkName($filename)
    {
        return "http://downloads.foo.bar/$filename.zip";	    
    }	
}
 
class TarGzFileNamingStrategy extends FileNamingStrategy {
    function createLinkName($filename)
    {
        return "http://downloads.foo.bar/$filename.tar.gz";	    
    }	
}
 
if (strstr($_SERVER["HTTP_USER_AGENT"], "Win")) {
    $fileNamingObj = new ZipFileNamingStrategy();
} else {
    $fileNamingObj = new TarGzFileNamingStrategy();
}
 
$calc_filename = $fileNamingObj->createLinkName("Calc101");
$stat_filename = $fileNamingObj->createLinkName("Stat2000");
 
print <<<EOF
<h1>The following is a list of great downloads<</h1>
<br>
<a href="$calc_filename">A great calculator</a><br>
<a href="$stat_filename">The best statistics application</a><br>
<br>
EOF;