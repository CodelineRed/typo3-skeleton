<?php

require_once(__DIR__ . '/../web/typo3conf/AdditionalConfiguration.php');

$conn = new mysqli($GLOBALS['TYPO3_CONF_VARS']['DB']['host'], $GLOBALS['TYPO3_CONF_VARS']['DB']['username'], $GLOBALS['TYPO3_CONF_VARS']['DB']['password'], $GLOBALS['TYPO3_CONF_VARS']['DB']['database']);

// Clear DB Cache here
$conn->query("TRUNCATE cache_treelist;");
$conn->query("TRUNCATE cache_pagesection;");
$conn->query("TRUNCATE cache_hash;");
$conn->query("TRUNCATE cache_pages;");
$conn->query("TRUNCATE tx_realurl_pathcache;");
$conn->query("TRUNCATE tx_realurl_uniqalias;");
$conn->query("TRUNCATE tx_realurl_uniqalias_cache_map;");
$conn->query("TRUNCATE tx_realurl_urlcache;");

// Clear file Cache
if ($handle = opendir(__DIR__ . '/../web/typo3conf')) {
    while (false !== ($file = readdir($handle))) {
        if (strpos($file, 'temp_CACHED_') !== FALSE) {
            unlink(__DIR__ . '/../web/typo3conf/'.$file);
        }
    }
    closedir($handle);
}

// delTree(__DIR__ . '/../web/typo3temp');

function delTree($dir) {
    $files = array_diff(scandir($dir), array('.', '..', '.gitkeep'));

    foreach ($files as $file) {
        (is_dir("$dir/$file")) ? delTree("$dir/$file") : unlink("$dir/$file");
    }
}
