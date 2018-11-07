<?php
return [
    'BE' => [
        'debug' => false,
        'explicitADmode' => 'explicitAllow',
        'installToolPassword' => '',
        'loginSecurityLevel' => 'rsa',
    ],
    'DB' => [
        'Connections' => [
            'Default' => [
                'charset' => 'utf8',
                'dbname' => '',
                'driver' => 'mysqli',
                'host' => '',
                'password' => '',
                'port' => 3306,
                'user' => '',
            ],
        ],
    ],
    'EXT' => [
        'extConf' => [
            'about' => 'a:0:{}',
            'belog' => 'a:0:{}',
            'beuser' => 'a:0:{}',
            'bootstrap_grids' => 'a:1:{s:19:"enableGridSimpleRow";s:1:"0";}',
            'context_help' => 'a:0:{}',
            'dce' => 'a:3:{s:29:"disableAutoClearFrontendCache";s:1:"1";s:17:"disableCodemirror";s:1:"0";s:17:"enableUpdateCheck";s:1:"0";}',
            'extensionmanager' => 'a:2:{s:21:"automaticInstallation";s:1:"1";s:11:"offlineMode";s:1:"0";}',
            'filemetadata' => 'a:0:{}',
            'fluid_styled_content' => 'a:0:{}',
            'form' => 'a:0:{}',
            'func' => 'a:0:{}',
            'gridelements' => 'a:3:{s:20:"additionalStylesheet";s:0:"";s:19:"nestingInListModule";s:1:"0";s:26:"overlayShortcutTranslation";s:1:"0";}',
            'imhh_t3base' => 'a:4:{s:10:"loginStyle";s:1:"1";s:12:"backendStyle";s:1:"1";s:14:"newsDetailList";s:2:"21";s:12:"languageList";s:9:"0#en,1#de";}',
            'indexed_search' => 'a:20:{s:8:"pdftools";s:9:"/usr/bin/";s:8:"pdf_mode";s:2:"20";s:5:"unzip";s:9:"/usr/bin/";s:6:"catdoc";s:9:"/usr/bin/";s:6:"xlhtml";s:9:"/usr/bin/";s:7:"ppthtml";s:9:"/usr/bin/";s:5:"unrtf";s:9:"/usr/bin/";s:18:"trackIpInStatistic";s:1:"2";s:9:"debugMode";s:1:"0";s:18:"fullTextDataLength";s:1:"0";s:23:"disableFrontendIndexing";s:1:"0";s:21:"enableMetaphoneSearch";s:1:"1";s:6:"minAge";s:2:"24";s:6:"maxAge";s:1:"0";s:16:"maxExternalFiles";s:1:"5";s:26:"useCrawlerForExternalFiles";s:1:"0";s:11:"flagBitMask";s:3:"192";s:16:"ignoreExtensions";s:0:"";s:17:"indexExternalURLs";s:1:"0";s:16:"useMysqlFulltext";s:1:"0";}',
            'info' => 'a:0:{}',
            'info_pagetsconfig' => 'a:0:{}',
            'lowlevel' => 'a:0:{}',
            'news' => 'a:17:{s:13:"prependAtCopy";s:1:"1";s:6:"tagPid";s:1:"1";s:12:"rteForTeaser";s:1:"0";s:22:"contentElementRelation";s:1:"1";s:21:"contentElementPreview";s:1:"1";s:13:"manualSorting";s:1:"0";s:19:"categoryRestriction";s:0:"";s:34:"categoryBeGroupTceFormsRestriction";s:1:"0";s:19:"dateTimeNotRequired";s:1:"0";s:11:"archiveDate";s:4:"date";s:12:"mediaPreview";s:5:"false";s:20:"advancedMediaPreview";s:4:"true";s:24:"showAdministrationModule";s:1:"1";s:35:"hidePageTreeForAdministrationModule";s:1:"0";s:12:"showImporter";s:1:"0";s:18:"storageUidImporter";s:1:"1";s:22:"resourceFolderImporter";s:12:"/news_import";}',
            'opendocs' => 'a:0:{}',
            'realurl' => 'a:6:{s:10:"configFile";s:26:"typo3conf/realurl_conf.php";s:14:"enableAutoConf";s:1:"1";s:14:"autoConfFormat";s:1:"0";s:17:"segTitleFieldList";s:0:"";s:12:"enableDevLog";s:1:"0";s:10:"moduleIcon";s:1:"2";}',
            'reports' => 'a:0:{}',
            'rsaauth' => 'a:1:{s:18:"temporaryDirectory";s:0:"";}',
            'rte_ckeditor' => 'a:0:{}',
            'saltedpasswords' => 'a:2:{s:3:"BE.";a:4:{s:21:"saltedPWHashingMethod";s:41:"TYPO3\\CMS\\Saltedpasswords\\Salt\\Pbkdf2Salt";s:11:"forceSalted";i:0;s:15:"onlyAuthService";i:0;s:12:"updatePasswd";i:1;}s:3:"FE.";a:5:{s:7:"enabled";i:1;s:21:"saltedPWHashingMethod";s:41:"TYPO3\\CMS\\Saltedpasswords\\Salt\\Pbkdf2Salt";s:11:"forceSalted";i:0;s:15:"onlyAuthService";i:0;s:12:"updatePasswd";i:1;}}',
            'scheduler' => 'a:4:{s:11:"maxLifetime";s:4:"1440";s:11:"enableBELog";s:1:"1";s:15:"showSampleTasks";s:1:"1";s:11:"useAtdaemon";s:1:"0";}',
            'setup' => 'a:0:{}',
            'sys_action' => 'a:0:{}',
            'sys_note' => 'a:0:{}',
            't3editor' => 'a:0:{}',
            'taskcenter' => 'a:0:{}',
            'tstemplate' => 'a:0:{}',
            'viewpage' => 'a:0:{}',
            'wizard_crpages' => 'a:0:{}',
            'wizard_sortpages' => 'a:0:{}',
        ],
    ],
    'EXTCONF' => [
        'lang' => [
            'availableLanguages' => [
                'de',
            ],
        ],
    ],
    'FE' => [
        'debug' => false,
        'loginSecurityLevel' => 'rsa',
    ],
    'GFX' => [
        'jpg_quality' => '80',
    ],
    'MAIL' => [
        'transport' => 'sendmail',
        'transport_sendmail_command' => '/usr/sbin/sendmail -t -i ',
        'transport_smtp_encrypt' => '',
        'transport_smtp_password' => '',
        'transport_smtp_server' => '',
        'transport_smtp_username' => '',
    ],
    'SYS' => [
        'caching' => [
            'cacheConfigurations' => [
                'extbase_object' => [
                    'backend' => 'TYPO3\\CMS\\Core\\Cache\\Backend\\Typo3DatabaseBackend',
                    'frontend' => 'TYPO3\\CMS\\Core\\Cache\\Frontend\\VariableFrontend',
                    'groups' => [
                        'system',
                    ],
                    'options' => [
                        'defaultLifetime' => 0,
                    ],
                ],
            ],
        ],
        'devIPmask' => '',
        'displayErrors' => 0,
        'enableDeprecationLog' => false,
        'encryptionKey' => '29125a85134d9b96be80113988d4d8a8077eb76777c1a5270a77e0d1d82e5528c4ee56bbaebe42456b329fb14b3e337b',
        'exceptionalErrors' => 20480,
        'isInitialDatabaseImportDone' => true,
        'isInitialInstallationInProgress' => false,
        'sitename' => '',
        'sqlDebug' => 0,
        'systemLogLevel' => 2,
    ],
];
