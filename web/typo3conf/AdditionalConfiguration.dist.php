<?php
# Backend Config
//$GLOBALS['TYPO3_CONF_VARS']['BE']['installToolPassword'] = '';

# Frontend Config
$GLOBALS['TYPO3_CONF_VARS']['FE']['pageNotFoundOnCHashError'] = FALSE;
$GLOBALS['TYPO3_CONF_VARS']['FE']['hidePagesIfNotTranslatedByDefault'] = TRUE;

# Database Config
$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['dbname'] = '';
$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['host'] = '127.0.0.1';
$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['port'] = 3306;
$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['user'] = '';
$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['password'] = '';
$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['driver'] = 'mysqli';
$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['charset'] = 'utf8';

# Image Processing Config
//$GLOBALS['TYPO3_CONF_VARS']['GFX']['processor'] = 'ImageMagick';
//$GLOBALS['TYPO3_CONF_VARS']['GFX']['processor_allowTemporaryMasksAsPng'] = '';
//$GLOBALS['TYPO3_CONF_VARS']['GFX']['processor_colorspace'] = 'sRGB';
//$GLOBALS['TYPO3_CONF_VARS']['GFX']['processor_effects'] = '-1';
//$GLOBALS['TYPO3_CONF_VARS']['GFX']['processor_enabled'] = '1';
//$GLOBALS['TYPO3_CONF_VARS']['GFX']['processor_path'] = '/ImageMagick-7.0.7/bin/';
//$GLOBALS['TYPO3_CONF_VARS']['GFX']['processor_path_lzw'] = '/ImageMagick-7.0.7/bin/';
//$GLOBALS['TYPO3_CONF_VARS']['GFX']['jpg_quality'] = '80';

# Debuging Config
//$GLOBALS['TYPO3_CONF_VARS']['SYS']['displayErrors'] = '1';
//$GLOBALS['TYPO3_CONF_VARS']['SYS']['devIPmask'] = '*';
//$GLOBALS['TYPO3_CONF_VARS']['SYS']['errorHandlerErrors'] = E_ALL ^ E_NOTICE;
//$GLOBALS['TYPO3_CONF_VARS']['SYS']['exceptionalErrors'] = E_ALL ^ E_NOTICE ^ E_WARNING ^ E_USER_ERROR ^ E_USER_NOTICE ^ E_USER_WARNING;
//$GLOBALS['TYPO3_CONF_VARS']['SYS']['systemLog'] = 'error_log';
//$GLOBALS['TYPO3_CONF_VARS']['SYS']['systemLogLevel'] = '4';
//$GLOBALS['TYPO3_CONF_VARS']['SYS']['enable_errorDLOG'] = '1';
//$GLOBALS['TYPO3_CONF_VARS']['SYS']['enable_exceptionDLOG'] = '1';
//$GLOBALS['TYPO3_CONF_VARS']['SYS']['enableDeprecationLog'] = 'console';
//$GLOBALS['TYPO3_CONF_VARS']['SYS']['sqlDebug'] = '1';
//$GLOBALS['TYPO3_CONF_VARS']['EXT']['extCache'] = '1';
//$GLOBALS['TYPO3_CONF_VARS']['BE']['debug'] = '1';
