<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css" rel="stylesheet">
        <style>
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
        </style>

        <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    <body>

        <!-- This code is taken from http://twitter.github.com/bootstrap/examples/hero.html -->

        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="/dashboard/">Dashboard</a>
                    <div class="nav-collapse collapse">
                        <p class="navbar-form pull-right navbar-text">
                          Generated <?= date('Y-m-d H:i:s') ?>
                        </p>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>


        <div class="container">

          <ul class="breadcrumb">
            <li><a href="/dashboard/"><i class="icon-home"></i>Dashboard</a> <span class="divider">/</span></li>
            <li class="active"><i class="icon-desktop"></i> Code branches</li>
          </ul>
<?php
$branches = array("branchname1", "branchname2", "branchname3");
$hashes = array();
foreach ($branches as $branch) {
    $branchFiles = array();
    exec("git --git-dir /var/www/PATH_TO_THE_REPOSITORY/.git ls-tree -r remotes/origin/$branch", &$branchFiles);
    foreach ($branchFiles as $file) {
        $fileName = substr($file, 53);
        $sha = substr($file, 12, 40); 
        $hashes[$fileName][$branch] = $sha;
    }
}
$all = 0;
$diffs = 0;
foreach ($hashes as $file => $hashBySite) {
    $all++;
    if (count($hashBySite)==3 && count(array_unique($hashBySite))==1)
        $diffs++;
}
?>
          <ul class="nav nav-tabs">
            <li id="showall" class="active">
              <a onclick="$('tr.success').show();$('li').removeClass('active');$('#showall').addClass('active')">Show all files (<?= $all ?>)</a>
            </li>
            <li id="showdiff"><a onclick="$('tr.success').hide();$('li').removeClass('active');$('#showdiff').addClass('active')">Show only differences (<?= $diffs ?>)</a></li>
          </ul>
          <table class="table"><tr><td>File<td>BRANCH1<td>BRANCH2<td>BRANCH3
<?php
foreach ($hashes as $file => $hashBySite) {
    if (count($hashBySite)==3 && count(array_unique($hashBySite))==1)
      echo "<tr class=\"success\"><td>$file";
    else
      echo "<tr><td>$file";
    foreach ($branches as $branch) {
        echo "<td>";
        if (isset($hashBySite[$branch])) {
            $href = "https://github.com/GITHUB_USERNAME/GITHUB_REPOSITORY_NAME/blob/$branch/$file";
            echo "<a href=\"$href\">".substr($hashBySite[$branch],0,7).'...</a>';
        } else 
            echo 'no file';
    }
    echo "\n";
}

# find bad phrases with: git --git-dir /PATH_TO_FOLDER/.git grep --name-only -e 'some-domain1.com' -e 'some-domain2.com' remotes/origin/SOME_BRANCH
?>
        </table>
        </div> <!-- /container -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.8.3.min.js"><\/script>')</script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
