-- Adminer 4.6.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `backend_layout`;
CREATE TABLE `backend_layout` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `icon` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `be_groups`;
CREATE TABLE `be_groups` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `non_exclude_fields` text COLLATE utf8_unicode_ci,
  `explicit_allowdeny` text COLLATE utf8_unicode_ci,
  `allowed_languages` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `custom_options` text COLLATE utf8_unicode_ci,
  `db_mountpoints` text COLLATE utf8_unicode_ci,
  `pagetypes_select` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tables_select` text COLLATE utf8_unicode_ci,
  `tables_modify` text COLLATE utf8_unicode_ci,
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `groupMods` text COLLATE utf8_unicode_ci,
  `file_mountpoints` text COLLATE utf8_unicode_ci,
  `file_permissions` text COLLATE utf8_unicode_ci,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(2000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lockToDomain` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `TSconfig` text COLLATE utf8_unicode_ci,
  `subgroup` text COLLATE utf8_unicode_ci,
  `hide_in_lists` smallint(6) NOT NULL DEFAULT '0',
  `workspace_perms` smallint(6) NOT NULL DEFAULT '1',
  `category_perms` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `be_sessions`;
CREATE TABLE `be_sessions` (
  `ses_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `ses_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `ses_data` longblob,
  `ses_backuserid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `be_users`;
CREATE TABLE `be_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(2000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `avatar` int(10) unsigned NOT NULL DEFAULT '0',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `admin` smallint(5) unsigned NOT NULL DEFAULT '0',
  `usergroup` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `disable` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `lang` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `db_mountpoints` text COLLATE utf8_unicode_ci,
  `options` smallint(5) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `realName` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userMods` text COLLATE utf8_unicode_ci,
  `allowed_languages` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uc` mediumblob,
  `file_mountpoints` text COLLATE utf8_unicode_ci,
  `file_permissions` text COLLATE utf8_unicode_ci,
  `workspace_perms` smallint(6) NOT NULL DEFAULT '1',
  `lockToDomain` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `disableIPlock` smallint(5) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `TSconfig` text COLLATE utf8_unicode_ci,
  `lastlogin` int(10) unsigned NOT NULL DEFAULT '0',
  `createdByAction` int(11) NOT NULL DEFAULT '0',
  `usergroup_cached_list` text COLLATE utf8_unicode_ci,
  `workspace_id` int(11) NOT NULL DEFAULT '0',
  `workspace_preview` smallint(6) NOT NULL DEFAULT '1',
  `category_perms` text COLLATE utf8_unicode_ci,
  `tx_news_categorymounts` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `be_users` (`uid`, `pid`, `tstamp`, `username`, `description`, `avatar`, `password`, `admin`, `usergroup`, `disable`, `starttime`, `endtime`, `lang`, `email`, `db_mountpoints`, `options`, `crdate`, `cruser_id`, `realName`, `userMods`, `allowed_languages`, `uc`, `file_mountpoints`, `file_permissions`, `workspace_perms`, `lockToDomain`, `disableIPlock`, `deleted`, `TSconfig`, `lastlogin`, `createdByAction`, `usergroup_cached_list`, `workspace_id`, `workspace_preview`, `category_perms`, `tx_news_categorymounts`) VALUES
(1,	0,	1539008116,	'admin',	'',	0,	'$pbkdf2-sha256$25000$v50USe1ddIgpmpQ2LzSkbw$M/13AxDl/g0u4HHaOAq1PfUU47dyj0NFRvEk/13Vhg8',	1,	'',	0,	0,	0,	'',	'',	NULL,	0,	1539008116,	0,	'',	NULL,	'',	'a:33:{s:14:\"interfaceSetup\";s:7:\"backend\";s:10:\"moduleData\";a:15:{s:10:\"web_layout\";a:2:{s:8:\"function\";s:1:\"2\";s:8:\"language\";s:1:\"0\";}s:10:\"FormEngine\";a:2:{i:0;a:1:{s:32:\"9b209de23811ef89bec385c059f31cd5\";a:4:{i:0;s:15:\"Root TypoScript\";i:1;a:6:{s:4:\"edit\";a:1:{s:12:\"sys_template\";a:1:{i:1;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;s:9:\"workspace\";N;}i:2;s:82:\"&edit[sys_template][1]=edit&defVals=&overrideVals=&columnsOnly=&noView=&workspace=\";i:3;a:5:{s:5:\"table\";s:12:\"sys_template\";s:3:\"uid\";i:1;s:3:\"pid\";i:1;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}}i:1;s:32:\"c635d64c74a712f6fd670adcdd8c7a61\";}s:57:\"TYPO3\\CMS\\Backend\\Utility\\BackendUtility::getUpdateSignal\";a:0:{}s:16:\"opendocs::recent\";a:8:{s:32:\"c635d64c74a712f6fd670adcdd8c7a61\";a:4:{i:0;s:8:\"Layout 7\";i:1;a:6:{s:4:\"edit\";a:1:{s:5:\"pages\";a:1:{i:17;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;s:9:\"workspace\";N;}i:2;s:76:\"&edit[pages][17]=edit&defVals=&overrideVals=&columnsOnly=&noView=&workspace=\";i:3;a:5:{s:5:\"table\";s:5:\"pages\";s:3:\"uid\";i:17;s:3:\"pid\";i:10;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"0a5be10278e2fd811fa9b3bd69c9f63f\";a:4:{i:0;s:8:\"Layout 6\";i:1;a:6:{s:4:\"edit\";a:1:{s:5:\"pages\";a:1:{i:16;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;s:9:\"workspace\";N;}i:2;s:76:\"&edit[pages][16]=edit&defVals=&overrideVals=&columnsOnly=&noView=&workspace=\";i:3;a:5:{s:5:\"table\";s:5:\"pages\";s:3:\"uid\";i:16;s:3:\"pid\";i:10;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"9a8ddc6139bc1d43fed95ba483ce3ed5\";a:4:{i:0;s:8:\"Layout 5\";i:1;a:6:{s:4:\"edit\";a:1:{s:5:\"pages\";a:1:{i:15;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;s:9:\"workspace\";N;}i:2;s:76:\"&edit[pages][15]=edit&defVals=&overrideVals=&columnsOnly=&noView=&workspace=\";i:3;a:5:{s:5:\"table\";s:5:\"pages\";s:3:\"uid\";i:15;s:3:\"pid\";i:10;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"92c767883f5352bc474b88b36004987f\";a:4:{i:0;s:8:\"Layout 4\";i:1;a:6:{s:4:\"edit\";a:1:{s:5:\"pages\";a:1:{i:14;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;s:9:\"workspace\";N;}i:2;s:76:\"&edit[pages][14]=edit&defVals=&overrideVals=&columnsOnly=&noView=&workspace=\";i:3;a:5:{s:5:\"table\";s:5:\"pages\";s:3:\"uid\";i:14;s:3:\"pid\";i:10;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"b2f927f113dd3b9f7b56ebfc25440081\";a:4:{i:0;s:8:\"Layout 3\";i:1;a:6:{s:4:\"edit\";a:1:{s:5:\"pages\";a:1:{i:13;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;s:9:\"workspace\";N;}i:2;s:76:\"&edit[pages][13]=edit&defVals=&overrideVals=&columnsOnly=&noView=&workspace=\";i:3;a:5:{s:5:\"table\";s:5:\"pages\";s:3:\"uid\";i:13;s:3:\"pid\";i:10;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"78c36df977c8c4fb973a77e6dd4e4096\";a:4:{i:0;s:8:\"Layout 2\";i:1;a:6:{s:4:\"edit\";a:1:{s:5:\"pages\";a:1:{i:12;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;s:9:\"workspace\";N;}i:2;s:76:\"&edit[pages][12]=edit&defVals=&overrideVals=&columnsOnly=&noView=&workspace=\";i:3;a:5:{s:5:\"table\";s:5:\"pages\";s:3:\"uid\";i:12;s:3:\"pid\";i:10;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"1400950116d0ecae1dc6dbee2fb49612\";a:4:{i:0;s:8:\"Layout 1\";i:1;a:6:{s:4:\"edit\";a:1:{s:5:\"pages\";a:1:{i:11;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;s:9:\"workspace\";N;}i:2;s:76:\"&edit[pages][11]=edit&defVals=&overrideVals=&columnsOnly=&noView=&workspace=\";i:3;a:5:{s:5:\"table\";s:5:\"pages\";s:3:\"uid\";i:11;s:3:\"pid\";i:10;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}s:32:\"5ad14e8169896165e68d50229a6913c9\";a:4:{i:0;s:37:\"[Translate to German (Deutsch):] Home\";i:1;a:6:{s:4:\"edit\";a:1:{s:22:\"pages_language_overlay\";a:1:{i:15;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;s:9:\"workspace\";N;}i:2;s:93:\"&edit[pages_language_overlay][15]=edit&defVals=&overrideVals=&columnsOnly=&noView=&workspace=\";i:3;a:5:{s:5:\"table\";s:22:\"pages_language_overlay\";s:3:\"uid\";i:15;s:3:\"pid\";i:8;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}}s:8:\"web_list\";a:2:{s:12:\"localization\";s:1:\"1\";s:15:\"bigControlPanel\";s:1:\"1\";}s:6:\"web_ts\";a:7:{s:8:\"function\";s:85:\"TYPO3\\CMS\\Tstemplate\\Controller\\TypoScriptTemplateInformationModuleFunctionController\";s:19:\"constant_editor_cat\";s:23:\"plugin.tx_indexedsearch\";s:15:\"ts_browser_type\";s:5:\"setup\";s:16:\"ts_browser_const\";s:1:\"0\";s:19:\"ts_browser_fixedLgd\";s:1:\"1\";s:23:\"ts_browser_showComments\";s:1:\"1\";s:25:\"tsbrowser_depthKeys_setup\";a:11:{s:23:\"plugin.tx_indexedsearch\";i:1;s:40:\"plugin.tx_indexedsearch.settings.results\";i:1;s:63:\"plugin.tx_indexedsearch.settings.forwardSearchWordsInResultLink\";i:1;s:38:\"plugin.tx_indexedsearch.settings.blind\";i:1;s:47:\"plugin.tx_indexedsearch.settings.defaultOptions\";i:1;s:28:\"plugin.tx_indexedsearch.view\";i:1;s:46:\"plugin.tx_indexedsearch.view.templateRootPaths\";i:1;s:10:\"lib.search\";i:1;s:19:\"lib.search.settings\";i:1;s:6:\"plugin\";i:1;s:32:\"plugin.tx_indexedsearch.settings\";i:1;}}s:13:\"system_config\";a:2:{s:8:\"function\";s:1:\"0\";s:6:\"node_0\";a:4:{s:2:\"DB\";i:1;s:14:\"DB.Connections\";i:1;s:22:\"DB.Connections.Default\";i:1;s:30:\"DB.additionalQueryRestrictions\";i:1;}}s:12:\"system_dbint\";a:3:{s:8:\"function\";s:1:\"0\";s:6:\"search\";s:3:\"raw\";s:22:\"search_query_makeQuery\";s:3:\"all\";}s:8:\"web_info\";a:2:{s:8:\"function\";s:72:\"TYPO3\\CMS\\InfoPagetsconfig\\Controller\\InfoPageTyposcriptConfigController\";s:12:\"tsconf_parts\";s:1:\"0\";}s:8:\"web_func\";a:1:{s:8:\"function\";s:76:\"TYPO3\\CMS\\WizardCrpages\\Controller\\CreatePagesWizardModuleFunctionController\";}s:29:\"tx_realurl_web_realurlrealurl\";a:1:{s:10:\"controller\";s:8:\"UrlCache\";}s:16:\"browse_links.php\";a:1:{s:12:\"expandFolder\";s:8:\"1:/demo/\";}s:9:\"file_list\";a:0:{}s:9:\"clipboard\";a:5:{s:6:\"normal\";a:0:{}s:5:\"tab_1\";a:0:{}s:5:\"tab_2\";a:0:{}s:5:\"tab_3\";a:0:{}s:7:\"current\";s:6:\"normal\";}s:4:\"page\";a:1:{s:28:\"gridelementsCollapsedColumns\";a:0:{}}}s:19:\"thumbnailsByDefault\";i:1;s:14:\"emailMeAtLogin\";i:0;s:11:\"startModule\";s:10:\"web_layout\";s:8:\"titleLen\";s:2:\"50\";s:8:\"edit_RTE\";i:1;s:20:\"edit_docModuleUpload\";i:1;s:15:\"resizeTextareas\";i:1;s:25:\"resizeTextareas_MaxHeight\";s:3:\"500\";s:24:\"resizeTextareas_Flexible\";i:0;s:4:\"lang\";s:2:\"de\";s:19:\"firstLoginTimeStamp\";i:1539008199;s:15:\"moduleSessionID\";a:14:{s:10:\"web_layout\";s:32:\"12d92dee911368e6dd6388594fc20faa\";s:10:\"FormEngine\";s:32:\"a7d7d5de8a0ddc3265d74859ff102e02\";s:57:\"TYPO3\\CMS\\Backend\\Utility\\BackendUtility::getUpdateSignal\";s:32:\"a7d7d5de8a0ddc3265d74859ff102e02\";s:16:\"opendocs::recent\";s:32:\"a7d7d5de8a0ddc3265d74859ff102e02\";s:8:\"web_list\";s:32:\"daaf282e0f609a10229cd7c28535ee2c\";s:6:\"web_ts\";s:32:\"98b6d4a7eaa500285a9d063d922f52e5\";s:13:\"system_config\";s:32:\"82ddc09f6082b39745516e337e1a900c\";s:12:\"system_dbint\";s:32:\"82ddc09f6082b39745516e337e1a900c\";s:8:\"web_info\";s:32:\"82ddc09f6082b39745516e337e1a900c\";s:8:\"web_func\";s:32:\"74871ce1107e32f97fc485e3b09bb10c\";s:29:\"tx_realurl_web_realurlrealurl\";s:32:\"74871ce1107e32f97fc485e3b09bb10c\";s:16:\"browse_links.php\";s:32:\"12d92dee911368e6dd6388594fc20faa\";s:9:\"file_list\";s:32:\"12d92dee911368e6dd6388594fc20faa\";s:9:\"clipboard\";s:32:\"12d92dee911368e6dd6388594fc20faa\";}s:17:\"BackendComponents\";a:1:{s:6:\"States\";a:1:{s:8:\"Pagetree\";a:1:{s:9:\"stateHash\";a:21:{i:0;s:1:\"1\";i:1;s:1:\"1\";i:2;s:1:\"1\";i:3;s:1:\"1\";i:4;s:1:\"1\";i:5;s:1:\"1\";i:6;s:1:\"1\";i:7;s:1:\"1\";i:8;s:1:\"1\";i:9;s:1:\"1\";i:10;s:1:\"1\";i:11;s:1:\"1\";i:12;s:1:\"1\";s:4:\"root\";s:1:\"1\";s:16:\"lastSelectedNode\";s:3:\"p11\";s:1:\"b\";s:1:\"1\";s:1:\"c\";s:1:\"1\";s:1:\"d\";s:1:\"1\";s:1:\"e\";s:1:\"1\";s:1:\"f\";s:1:\"1\";s:1:\"a\";s:1:\"1\";}}}}s:18:\"disablePMKTextarea\";i:1;s:8:\"realName\";s:0:\"\";s:5:\"email\";s:0:\"\";s:8:\"password\";s:0:\"\";s:9:\"password2\";s:0:\"\";s:6:\"avatar\";s:0:\"\";s:25:\"showHiddenFilesAndFolders\";i:0;s:10:\"copyLevels\";s:0:\"\";s:15:\"recursiveDelete\";i:0;s:18:\"resetConfiguration\";s:0:\"\";s:42:\"dragAndDropHideNewElementWizardInfoOverlay\";i:0;s:17:\"hideColumnHeaders\";i:0;s:18:\"hideContentPreview\";i:0;s:19:\"showGridInformation\";i:0;s:11:\"newsoverlay\";s:1:\"0\";s:11:\"browseTrees\";a:1:{s:6:\"folder\";s:35:\"a:1:{i:25218;a:1:{i:62822724;i:1;}}\";}s:10:\"inlineView\";s:125:\"a:2:{i:0;b:0;s:10:\"tt_content\";a:1:{s:25:\"NEW5bd067092dd79630892091\";a:1:{s:18:\"sys_file_reference\";a:2:{i:0;i:1;i:1;i:2;}}}}\";s:14:\"indexed_search\";a:2:{s:6:\"action\";s:16:\"statisticDetails\";s:9:\"arguments\";a:3:{s:8:\"pageHash\";s:9:\"197821338\";s:6:\"action\";s:16:\"statisticDetails\";s:10:\"controller\";s:14:\"Administration\";}}}',	NULL,	NULL,	1,	'',	0,	0,	NULL,	1540826164,	0,	NULL,	0,	1,	NULL,	''),
(2,	0,	1539008131,	'_cli_',	'',	0,	'$pbkdf2-sha256$25000$mUYc9jo.irAX09MES4sPCw$bxqXD5TbCbzEOrXrdZhp3wmzwJPI2xhORUbzv9m/3Yk',	1,	'',	0,	0,	0,	'',	'',	NULL,	0,	1539008131,	0,	'',	NULL,	'',	'a:13:{s:14:\"interfaceSetup\";s:0:\"\";s:10:\"moduleData\";a:0:{}s:19:\"thumbnailsByDefault\";i:1;s:14:\"emailMeAtLogin\";i:0;s:11:\"startModule\";s:22:\"help_AboutAboutmodules\";s:8:\"titleLen\";i:50;s:8:\"edit_RTE\";s:1:\"1\";s:20:\"edit_docModuleUpload\";s:1:\"1\";s:15:\"resizeTextareas\";i:1;s:25:\"resizeTextareas_MaxHeight\";i:500;s:24:\"resizeTextareas_Flexible\";i:0;s:4:\"lang\";s:0:\"\";s:19:\"firstLoginTimeStamp\";i:1539008131;}',	NULL,	NULL,	1,	'',	0,	0,	NULL,	0,	0,	NULL,	0,	1,	NULL,	'');

DROP TABLE IF EXISTS `cache_md5params`;
CREATE TABLE `cache_md5params` (
  `md5hash` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`md5hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cache_treelist`;
CREATE TABLE `cache_treelist` (
  `md5hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0',
  `treelist` mediumtext COLLATE utf8_unicode_ci,
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `cache_treelist` (`md5hash`, `pid`, `treelist`, `tstamp`, `expires`) VALUES
('2ff3f1964aba5cef8cdf0a0d4126a7fa',	1,	'6,7,11,12,13,14,15,16,17,8,10,4,5,18,2,3,9,1',	1540828136,	0);

DROP TABLE IF EXISTS `cf_cache_hash`;
CREATE TABLE `cf_cache_hash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cf_cache_hash_tags`;
CREATE TABLE `cf_cache_hash_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`),
  KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cf_cache_imagesizes`;
CREATE TABLE `cf_cache_imagesizes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cf_cache_imagesizes_tags`;
CREATE TABLE `cf_cache_imagesizes_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`),
  KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cf_cache_news_category`;
CREATE TABLE `cf_cache_news_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cf_cache_news_category_tags`;
CREATE TABLE `cf_cache_news_category_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`),
  KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cf_cache_pages`;
CREATE TABLE `cf_cache_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cf_cache_pagesection`;
CREATE TABLE `cf_cache_pagesection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cf_cache_pagesection_tags`;
CREATE TABLE `cf_cache_pagesection_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`),
  KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cf_cache_pages_tags`;
CREATE TABLE `cf_cache_pages_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`),
  KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cf_cache_rootline`;
CREATE TABLE `cf_cache_rootline` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cf_cache_rootline_tags`;
CREATE TABLE `cf_cache_rootline_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`),
  KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cf_extbase_datamapfactory_datamap`;
CREATE TABLE `cf_extbase_datamapfactory_datamap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cf_extbase_datamapfactory_datamap_tags`;
CREATE TABLE `cf_extbase_datamapfactory_datamap_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`),
  KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cf_extbase_object`;
CREATE TABLE `cf_extbase_object` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cf_extbase_object_tags`;
CREATE TABLE `cf_extbase_object_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`),
  KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cf_extbase_reflection`;
CREATE TABLE `cf_extbase_reflection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `cf_extbase_reflection_tags`;
CREATE TABLE `cf_extbase_reflection_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`),
  KEY `cache_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `fe_groups`;
CREATE TABLE `fe_groups` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tx_extbase_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `lockToDomain` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `subgroup` tinytext COLLATE utf8_unicode_ci,
  `TSconfig` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `fe_sessions`;
CREATE TABLE `fe_sessions` (
  `ses_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `ses_tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `ses_data` mediumblob,
  `ses_permanent` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ses_anonymous` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `fe_users`;
CREATE TABLE `fe_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tx_extbase_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usergroup` tinytext COLLATE utf8_unicode_ci,
  `disable` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(160) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `middle_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `telephone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lockToDomain` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `uc` blob,
  `title` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `zip` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `www` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` tinytext COLLATE utf8_unicode_ci,
  `TSconfig` text COLLATE utf8_unicode_ci,
  `lastlogin` int(10) unsigned NOT NULL DEFAULT '0',
  `is_online` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`username`),
  KEY `username` (`username`),
  KEY `is_online` (`is_online`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `index_config`;
CREATE TABLE `index_config` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `starttime` int(11) NOT NULL DEFAULT '0',
  `set_id` int(11) NOT NULL DEFAULT '0',
  `session_data` mediumtext COLLATE utf8_unicode_ci,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `depth` int(10) unsigned NOT NULL DEFAULT '0',
  `table2index` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alternative_source_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `get_params` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fieldlist` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `externalUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `indexcfgs` text COLLATE utf8_unicode_ci,
  `chashcalc` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filepath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extensions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timer_next_indexing` int(11) NOT NULL DEFAULT '0',
  `timer_frequency` int(11) NOT NULL DEFAULT '0',
  `timer_offset` int(11) NOT NULL DEFAULT '0',
  `url_deny` text COLLATE utf8_unicode_ci,
  `recordsbatch` int(11) NOT NULL DEFAULT '0',
  `records_indexonchange` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `index_debug`;
CREATE TABLE `index_debug` (
  `phash` int(11) NOT NULL DEFAULT '0',
  `debuginfo` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`phash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `index_fulltext`;
CREATE TABLE `index_fulltext` (
  `phash` int(11) NOT NULL DEFAULT '0',
  `fulltextdata` mediumtext COLLATE utf8_unicode_ci,
  `metaphonedata` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`phash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `index_grlist`;
CREATE TABLE `index_grlist` (
  `uniqid` int(11) NOT NULL AUTO_INCREMENT,
  `phash` int(11) NOT NULL DEFAULT '0',
  `phash_x` int(11) NOT NULL DEFAULT '0',
  `hash_gr_list` int(11) NOT NULL DEFAULT '0',
  `gr_list` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uniqid`),
  KEY `joinkey` (`phash`,`hash_gr_list`),
  KEY `phash_grouping` (`phash_x`,`hash_gr_list`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `index_phash`;
CREATE TABLE `index_phash` (
  `phash` int(11) NOT NULL DEFAULT '0',
  `phash_grouping` int(11) NOT NULL DEFAULT '0',
  `cHashParams` blob,
  `data_filename` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data_page_id` int(10) unsigned NOT NULL DEFAULT '0',
  `data_page_reg1` int(10) unsigned NOT NULL DEFAULT '0',
  `data_page_type` int(10) unsigned NOT NULL DEFAULT '0',
  `data_page_mp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gr_list` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_type` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_mtime` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `item_size` int(11) NOT NULL DEFAULT '0',
  `contentHash` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `parsetime` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `item_crdate` int(11) NOT NULL DEFAULT '0',
  `externalUrl` smallint(6) NOT NULL DEFAULT '0',
  `recordUid` int(11) NOT NULL DEFAULT '0',
  `freeIndexUid` int(11) NOT NULL DEFAULT '0',
  `freeIndexSetId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`phash`),
  KEY `phash_grouping` (`phash_grouping`),
  KEY `freeIndexUid` (`freeIndexUid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `index_rel`;
CREATE TABLE `index_rel` (
  `phash` int(11) NOT NULL DEFAULT '0',
  `wid` int(11) NOT NULL DEFAULT '0',
  `count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `first` int(10) unsigned NOT NULL DEFAULT '0',
  `freq` smallint(5) unsigned NOT NULL DEFAULT '0',
  `flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`phash`,`wid`),
  KEY `wid` (`wid`,`phash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `index_section`;
CREATE TABLE `index_section` (
  `uniqid` int(11) NOT NULL AUTO_INCREMENT,
  `phash` int(11) NOT NULL DEFAULT '0',
  `phash_t3` int(11) NOT NULL DEFAULT '0',
  `rl0` int(10) unsigned NOT NULL DEFAULT '0',
  `rl1` int(10) unsigned NOT NULL DEFAULT '0',
  `rl2` int(10) unsigned NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uniqid`),
  KEY `joinkey` (`phash`,`rl0`),
  KEY `page_id` (`page_id`),
  KEY `rl0` (`rl0`,`rl1`,`phash`),
  KEY `rl0_2` (`rl0`,`phash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `index_stat_search`;
CREATE TABLE `index_stat_search` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `searchstring` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `searchoptions` blob,
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `feuser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cookie` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `IP` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `index_stat_word`;
CREATE TABLE `index_stat_word` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `index_stat_search_id` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `pageid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `tstamp` (`tstamp`,`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `index_words`;
CREATE TABLE `index_words` (
  `wid` int(11) NOT NULL DEFAULT '0',
  `baseword` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `metaphone` int(11) NOT NULL DEFAULT '0',
  `is_stopword` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wid`),
  KEY `baseword` (`baseword`),
  KEY `metaphone` (`metaphone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `perms_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `perms_groupid` int(10) unsigned NOT NULL DEFAULT '0',
  `perms_user` smallint(5) unsigned NOT NULL DEFAULT '0',
  `perms_group` smallint(5) unsigned NOT NULL DEFAULT '0',
  `perms_everybody` smallint(5) unsigned NOT NULL DEFAULT '0',
  `editlock` smallint(5) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `doktype` int(10) unsigned NOT NULL DEFAULT '0',
  `TSconfig` text COLLATE utf8_unicode_ci,
  `is_siteroot` smallint(6) NOT NULL DEFAULT '0',
  `php_tree_stop` smallint(6) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `urltype` smallint(5) unsigned NOT NULL DEFAULT '0',
  `shortcut` int(10) unsigned NOT NULL DEFAULT '0',
  `shortcut_mode` int(10) unsigned NOT NULL DEFAULT '0',
  `no_cache` int(10) unsigned NOT NULL DEFAULT '0',
  `fe_group` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `layout` int(10) unsigned NOT NULL DEFAULT '0',
  `target` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `media` int(10) unsigned NOT NULL DEFAULT '0',
  `lastUpdated` int(10) unsigned NOT NULL DEFAULT '0',
  `keywords` text COLLATE utf8_unicode_ci,
  `cache_timeout` int(10) unsigned NOT NULL DEFAULT '0',
  `cache_tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newUntil` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `no_search` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SYS_LASTCHANGED` int(10) unsigned NOT NULL DEFAULT '0',
  `abstract` text COLLATE utf8_unicode_ci,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extendToSubpages` smallint(5) unsigned NOT NULL DEFAULT '0',
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_email` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nav_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nav_hide` smallint(6) NOT NULL DEFAULT '0',
  `content_from_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `mount_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `mount_pid_ol` smallint(6) NOT NULL DEFAULT '0',
  `alias` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `l18n_cfg` smallint(6) NOT NULL DEFAULT '0',
  `fe_login_mode` smallint(6) NOT NULL DEFAULT '0',
  `backend_layout` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backend_layout_next_level` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tsconfig_includes` text COLLATE utf8_unicode_ci,
  `categories` int(11) NOT NULL DEFAULT '0',
  `tx_realurl_pathsegment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tx_realurl_pathoverride` int(11) NOT NULL DEFAULT '0',
  `tx_realurl_exclude` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `parent` (`pid`,`deleted`,`sorting`),
  KEY `alias` (`alias`),
  KEY `determineSiteRoot` (`is_siteroot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `pages` (`uid`, `pid`, `t3ver_oid`, `t3ver_id`, `t3ver_wsid`, `t3ver_label`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `t3_origuid`, `tstamp`, `sorting`, `deleted`, `perms_userid`, `perms_groupid`, `perms_user`, `perms_group`, `perms_everybody`, `editlock`, `crdate`, `cruser_id`, `hidden`, `title`, `doktype`, `TSconfig`, `is_siteroot`, `php_tree_stop`, `url`, `starttime`, `endtime`, `urltype`, `shortcut`, `shortcut_mode`, `no_cache`, `fe_group`, `subtitle`, `layout`, `target`, `media`, `lastUpdated`, `keywords`, `cache_timeout`, `cache_tags`, `newUntil`, `description`, `no_search`, `SYS_LASTCHANGED`, `abstract`, `module`, `extendToSubpages`, `author`, `author_email`, `nav_title`, `nav_hide`, `content_from_pid`, `mount_pid`, `mount_pid_ol`, `alias`, `l18n_cfg`, `fe_login_mode`, `backend_layout`, `backend_layout_next_level`, `tsconfig_includes`, `categories`, `tx_realurl_pathsegment`, `tx_realurl_pathoverride`, `tx_realurl_exclude`) VALUES
(1,	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540826834,	256,	0,	1,	0,	31,	27,	0,	0,	1540826462,	1,	0,	'Home',	1,	'<INCLUDE_TYPOSCRIPT: source=\"FILE:EXT:imhh_t3base/Configuration/TypoScript/page-ts/BackendLayouts.ts\">\r\n<INCLUDE_TYPOSCRIPT: source=\"FILE:EXT:imhh_t3base/Configuration/TypoScript/page-ts/Default.ts\">',	1,	0,	'',	0,	0,	1,	0,	0,	0,	'',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	1540826834,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'pagets__bl7',	'pagets__bl1',	NULL,	0,	'',	0,	0),
(2,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827116,	256,	0,	1,	0,	31,	27,	0,	0,	1540827075,	1,	0,	'Main Navigation',	199,	NULL,	0,	0,	'',	0,	0,	1,	0,	0,	0,	'',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	0,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'',	'',	NULL,	0,	'',	0,	1),
(3,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827146,	512,	0,	1,	0,	31,	27,	0,	0,	1540827088,	1,	0,	'Footer Navigation',	199,	NULL,	0,	0,	'',	0,	0,	1,	0,	0,	0,	'',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	0,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'',	'',	NULL,	0,	'footer',	0,	0),
(4,	2,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827199,	256,	0,	1,	0,	31,	27,	0,	0,	1540827199,	1,	0,	'Imprint',	1,	NULL,	0,	0,	'',	0,	0,	1,	0,	0,	0,	'0',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	1540827199,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'',	'',	NULL,	0,	'',	0,	0),
(5,	2,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827199,	512,	0,	1,	0,	31,	27,	0,	0,	1540827199,	1,	0,	'Contact',	1,	NULL,	0,	0,	'',	0,	0,	1,	0,	0,	0,	'0',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	0,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'',	'',	NULL,	0,	'',	0,	0),
(6,	3,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827340,	256,	0,	1,	0,	31,	27,	0,	0,	1540827316,	1,	0,	'Imprint',	4,	NULL,	0,	0,	'',	0,	0,	1,	4,	0,	0,	'',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	0,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'',	'',	NULL,	0,	'',	0,	0),
(7,	3,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827361,	512,	0,	1,	0,	31,	27,	0,	0,	1540827316,	1,	0,	'Contact',	4,	NULL,	0,	0,	'',	0,	0,	1,	5,	0,	0,	'',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	0,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'',	'',	NULL,	0,	'',	0,	0),
(8,	2,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827406,	128,	0,	1,	0,	31,	27,	0,	0,	1540827365,	1,	0,	'Home',	4,	NULL,	0,	0,	'',	0,	0,	1,	1,	0,	0,	'',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	0,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'',	'',	NULL,	0,	'',	0,	0),
(9,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827442,	768,	0,	1,	0,	31,	27,	0,	0,	1540827424,	1,	0,	'System Folder',	254,	NULL,	0,	0,	'',	0,	0,	1,	0,	0,	0,	'0',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	0,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'',	'',	NULL,	0,	'',	0,	0),
(10,	2,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827485,	192,	0,	1,	0,	31,	27,	0,	0,	1540827449,	1,	0,	'Layouts',	4,	NULL,	0,	0,	'',	0,	0,	1,	0,	1,	0,	'',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	0,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'',	'',	NULL,	0,	'',	0,	0),
(11,	10,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827979,	256,	0,	1,	0,	31,	27,	0,	0,	1540827522,	1,	0,	'Layout 1',	1,	NULL,	0,	0,	'',	0,	0,	1,	0,	0,	0,	'',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	1540827522,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'pagets__bl1',	'',	NULL,	0,	'',	0,	0),
(12,	10,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827990,	512,	0,	1,	0,	31,	27,	0,	0,	1540827522,	1,	0,	'Layout 2',	1,	NULL,	0,	0,	'',	0,	0,	1,	0,	0,	0,	'',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	1540827990,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'pagets__bl2',	'',	NULL,	0,	'',	0,	0),
(13,	10,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540828001,	768,	0,	1,	0,	31,	27,	0,	0,	1540827522,	1,	0,	'Layout 3',	1,	NULL,	0,	0,	'',	0,	0,	1,	0,	0,	0,	'',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	1540828001,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'pagets__bl3',	'',	NULL,	0,	'',	0,	0),
(14,	10,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540828012,	1024,	0,	1,	0,	31,	27,	0,	0,	1540827522,	1,	0,	'Layout 4',	1,	NULL,	0,	0,	'',	0,	0,	1,	0,	0,	0,	'',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	1540828012,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'pagets__bl4',	'',	NULL,	0,	'',	0,	0),
(15,	10,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540828024,	1280,	0,	1,	0,	31,	27,	0,	0,	1540827522,	1,	0,	'Layout 5',	1,	NULL,	0,	0,	'',	0,	0,	1,	0,	0,	0,	'',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	1540828024,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'pagets__bl5',	'',	NULL,	0,	'',	0,	0),
(16,	10,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540828036,	1536,	0,	1,	0,	31,	27,	0,	0,	1540827522,	1,	0,	'Layout 6',	1,	NULL,	0,	0,	'',	0,	0,	1,	0,	0,	0,	'',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	1540828036,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'pagets__bl6',	'',	NULL,	0,	'',	0,	0),
(17,	10,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540828045,	1792,	0,	1,	0,	31,	27,	0,	0,	1540827522,	1,	0,	'Layout 7',	1,	NULL,	0,	0,	'',	0,	0,	1,	0,	0,	0,	'',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	1540828045,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'pagets__bl7',	'',	NULL,	0,	'',	0,	0),
(18,	2,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827552,	768,	0,	1,	0,	31,	27,	0,	0,	1540827542,	1,	0,	'Search',	1,	NULL,	0,	0,	'',	0,	0,	1,	0,	0,	0,	'0',	'',	0,	'',	0,	0,	NULL,	0,	'',	0,	NULL,	0,	1540827552,	NULL,	'',	0,	'',	'',	'',	0,	0,	0,	0,	'',	0,	0,	'',	'',	NULL,	0,	'',	0,	0);

DROP TABLE IF EXISTS `pages_language_overlay`;
CREATE TABLE `pages_language_overlay` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `doktype` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nav_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `media` int(10) unsigned NOT NULL DEFAULT '0',
  `keywords` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `abstract` text COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_email` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `l18n_diffsource` mediumblob,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `urltype` smallint(5) unsigned NOT NULL DEFAULT '0',
  `shortcut` int(10) unsigned NOT NULL DEFAULT '0',
  `shortcut_mode` int(10) unsigned NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  `tx_realurl_pathsegment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `parent` (`pid`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `pages_language_overlay` (`uid`, `pid`, `doktype`, `t3ver_oid`, `t3ver_id`, `t3ver_wsid`, `t3ver_label`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `t3_origuid`, `tstamp`, `crdate`, `cruser_id`, `sys_language_uid`, `title`, `hidden`, `starttime`, `endtime`, `deleted`, `subtitle`, `nav_title`, `media`, `keywords`, `description`, `abstract`, `author`, `author_email`, `l18n_diffsource`, `url`, `urltype`, `shortcut`, `shortcut_mode`, `l10n_state`, `tx_realurl_pathsegment`) VALUES
(1,	1,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540826696,	1540826672,	1,	1,	'Startseite',	0,	0,	0,	0,	'',	'',	0,	NULL,	NULL,	NULL,	'',	'',	'a:15:{s:7:\"doktype\";i:1;s:5:\"title\";s:4:\"Home\";s:9:\"nav_title\";s:0:\"\";s:8:\"subtitle\";s:0:\"\";s:22:\"tx_realurl_pathsegment\";s:0:\"\";s:8:\"abstract\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:5:\"media\";i:0;s:16:\"sys_language_uid\";N;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	'',	1,	0,	0,	NULL,	''),
(2,	10,	4,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827689,	1540827677,	1,	1,	'Layouts',	0,	0,	0,	0,	'',	'',	0,	NULL,	NULL,	NULL,	'',	'',	'a:15:{s:7:\"doktype\";i:4;s:5:\"title\";s:7:\"Layouts\";s:9:\"nav_title\";s:0:\"\";s:8:\"subtitle\";s:0:\"\";s:22:\"tx_realurl_pathsegment\";s:0:\"\";s:13:\"shortcut_mode\";i:1;s:8:\"shortcut\";i:0;s:8:\"abstract\";N;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:5:\"media\";i:0;s:16:\"sys_language_uid\";N;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	'',	1,	0,	1,	NULL,	''),
(3,	11,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827713,	1540827696,	1,	1,	'Layout 1',	0,	0,	0,	0,	'',	'',	0,	NULL,	NULL,	NULL,	'',	'',	'a:15:{s:7:\"doktype\";i:1;s:5:\"title\";s:8:\"Layout 1\";s:9:\"nav_title\";s:0:\"\";s:8:\"subtitle\";s:0:\"\";s:22:\"tx_realurl_pathsegment\";s:0:\"\";s:8:\"abstract\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:5:\"media\";i:0;s:16:\"sys_language_uid\";N;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	'',	1,	0,	0,	NULL,	''),
(4,	12,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827727,	1540827720,	1,	1,	'Layout 2',	0,	0,	0,	0,	'',	'',	0,	NULL,	NULL,	NULL,	'',	'',	'a:15:{s:7:\"doktype\";i:1;s:5:\"title\";s:8:\"Layout 2\";s:9:\"nav_title\";s:0:\"\";s:8:\"subtitle\";s:0:\"\";s:22:\"tx_realurl_pathsegment\";s:0:\"\";s:8:\"abstract\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:5:\"media\";i:0;s:16:\"sys_language_uid\";N;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	'',	1,	0,	0,	NULL,	''),
(5,	13,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827738,	1540827733,	1,	1,	'Layout 3',	0,	0,	0,	0,	'',	'',	0,	NULL,	NULL,	NULL,	'',	'',	'a:15:{s:7:\"doktype\";i:1;s:5:\"title\";s:8:\"Layout 3\";s:9:\"nav_title\";s:0:\"\";s:8:\"subtitle\";s:0:\"\";s:22:\"tx_realurl_pathsegment\";s:0:\"\";s:8:\"abstract\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:5:\"media\";i:0;s:16:\"sys_language_uid\";N;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	'',	1,	0,	0,	NULL,	''),
(6,	14,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827753,	1540827746,	1,	1,	'Layout 4',	0,	0,	0,	0,	'',	'',	0,	NULL,	NULL,	NULL,	'',	'',	'a:15:{s:7:\"doktype\";i:1;s:5:\"title\";s:8:\"Layout 4\";s:9:\"nav_title\";s:0:\"\";s:8:\"subtitle\";s:0:\"\";s:22:\"tx_realurl_pathsegment\";s:0:\"\";s:8:\"abstract\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:5:\"media\";i:0;s:16:\"sys_language_uid\";N;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	'',	1,	0,	0,	NULL,	''),
(7,	15,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827763,	1540827757,	1,	1,	'Layout 5',	0,	0,	0,	0,	'',	'',	0,	NULL,	NULL,	NULL,	'',	'',	'a:15:{s:7:\"doktype\";i:1;s:5:\"title\";s:8:\"Layout 5\";s:9:\"nav_title\";s:0:\"\";s:8:\"subtitle\";s:0:\"\";s:22:\"tx_realurl_pathsegment\";s:0:\"\";s:8:\"abstract\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:5:\"media\";i:0;s:16:\"sys_language_uid\";N;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	'',	1,	0,	0,	NULL,	''),
(8,	16,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827774,	1540827768,	1,	1,	'Layout 6',	0,	0,	0,	0,	'',	'',	0,	NULL,	NULL,	NULL,	'',	'',	'a:15:{s:7:\"doktype\";i:1;s:5:\"title\";s:8:\"Layout 6\";s:9:\"nav_title\";s:0:\"\";s:8:\"subtitle\";s:0:\"\";s:22:\"tx_realurl_pathsegment\";s:0:\"\";s:8:\"abstract\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:5:\"media\";i:0;s:16:\"sys_language_uid\";N;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	'',	1,	0,	0,	NULL,	''),
(9,	17,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827787,	1540827780,	1,	1,	'Layout 7',	0,	0,	0,	0,	'',	'',	0,	NULL,	NULL,	NULL,	'',	'',	'a:15:{s:7:\"doktype\";i:1;s:5:\"title\";s:8:\"Layout 7\";s:9:\"nav_title\";s:0:\"\";s:8:\"subtitle\";s:0:\"\";s:22:\"tx_realurl_pathsegment\";s:0:\"\";s:8:\"abstract\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:5:\"media\";i:0;s:16:\"sys_language_uid\";N;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	'',	1,	0,	0,	NULL,	''),
(10,	4,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827811,	1540827794,	1,	1,	'Impressum',	0,	0,	0,	0,	'',	'',	0,	NULL,	NULL,	NULL,	'',	'',	'a:15:{s:7:\"doktype\";i:1;s:5:\"title\";s:7:\"Imprint\";s:9:\"nav_title\";s:0:\"\";s:8:\"subtitle\";s:0:\"\";s:22:\"tx_realurl_pathsegment\";s:0:\"\";s:8:\"abstract\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:5:\"media\";i:0;s:16:\"sys_language_uid\";N;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	'',	1,	0,	0,	NULL,	''),
(11,	5,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827828,	1540827818,	1,	1,	'Kontakt',	0,	0,	0,	0,	'',	'',	0,	NULL,	NULL,	NULL,	'',	'',	'a:15:{s:7:\"doktype\";i:1;s:5:\"title\";s:7:\"Contact\";s:9:\"nav_title\";s:0:\"\";s:8:\"subtitle\";s:0:\"\";s:22:\"tx_realurl_pathsegment\";s:0:\"\";s:8:\"abstract\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:5:\"media\";i:0;s:16:\"sys_language_uid\";N;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	'',	1,	0,	0,	NULL,	''),
(12,	18,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827844,	1540827834,	1,	1,	'Suche',	0,	0,	0,	0,	'',	'',	0,	NULL,	NULL,	NULL,	'',	'',	'a:15:{s:7:\"doktype\";i:1;s:5:\"title\";s:6:\"Search\";s:9:\"nav_title\";s:0:\"\";s:8:\"subtitle\";s:0:\"\";s:22:\"tx_realurl_pathsegment\";s:0:\"\";s:8:\"abstract\";N;s:8:\"keywords\";N;s:11:\"description\";N;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:5:\"media\";i:0;s:16:\"sys_language_uid\";N;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	'',	1,	0,	0,	NULL,	''),
(13,	6,	4,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827868,	1540827848,	1,	1,	'Impressum',	0,	0,	0,	0,	'',	'',	0,	NULL,	NULL,	NULL,	'',	'',	'a:15:{s:7:\"doktype\";i:4;s:5:\"title\";s:7:\"Imprint\";s:9:\"nav_title\";s:0:\"\";s:8:\"subtitle\";s:0:\"\";s:22:\"tx_realurl_pathsegment\";s:0:\"\";s:13:\"shortcut_mode\";i:0;s:8:\"shortcut\";i:4;s:8:\"abstract\";N;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:5:\"media\";i:0;s:16:\"sys_language_uid\";N;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	'',	1,	4,	0,	NULL,	''),
(14,	7,	4,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827885,	1540827872,	1,	1,	'Kontakt',	0,	0,	0,	0,	'',	'',	0,	NULL,	NULL,	NULL,	'',	'',	'a:15:{s:7:\"doktype\";i:4;s:5:\"title\";s:7:\"Contact\";s:9:\"nav_title\";s:0:\"\";s:8:\"subtitle\";s:0:\"\";s:22:\"tx_realurl_pathsegment\";s:0:\"\";s:13:\"shortcut_mode\";i:0;s:8:\"shortcut\";i:5;s:8:\"abstract\";N;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:5:\"media\";i:0;s:16:\"sys_language_uid\";N;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	'',	1,	5,	0,	NULL,	''),
(15,	8,	4,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827935,	1540827916,	1,	1,	'Startseite',	0,	0,	0,	0,	'',	'',	0,	NULL,	NULL,	NULL,	'',	'',	'a:15:{s:7:\"doktype\";i:4;s:5:\"title\";s:4:\"Home\";s:9:\"nav_title\";s:0:\"\";s:8:\"subtitle\";s:0:\"\";s:22:\"tx_realurl_pathsegment\";s:0:\"\";s:13:\"shortcut_mode\";i:0;s:8:\"shortcut\";i:1;s:8:\"abstract\";N;s:6:\"author\";s:0:\"\";s:12:\"author_email\";s:0:\"\";s:5:\"media\";i:0;s:16:\"sys_language_uid\";N;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	'',	1,	1,	0,	NULL,	'');

DROP TABLE IF EXISTS `sys_action`;
CREATE TABLE `sys_action` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `t1_userprefix` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t1_copy_of_user` int(11) NOT NULL DEFAULT '0',
  `t1_allowed_groups` tinytext COLLATE utf8_unicode_ci,
  `t2_data` blob,
  `assign_to_groups` int(11) NOT NULL DEFAULT '0',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `t1_create_user_dir` smallint(6) NOT NULL DEFAULT '0',
  `t3_listPid` int(11) NOT NULL DEFAULT '0',
  `t3_tables` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t4_recordsToEdit` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `cruser_id` (`cruser_id`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `sys_action_asgr_mm`;
CREATE TABLE `sys_action_asgr_mm` (
  `uid_local` int(10) unsigned NOT NULL DEFAULT '0',
  `uid_foreign` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `sys_be_shortcuts`;
CREATE TABLE `sys_be_shortcuts` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `module_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` text COLLATE utf8_unicode_ci,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `sc_group` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `title` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `parent` int(11) NOT NULL DEFAULT '0',
  `items` int(11) NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  `fe_group` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `images` int(10) unsigned DEFAULT '0',
  `single_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `shortcut` int(11) NOT NULL DEFAULT '0',
  `import_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `import_source` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `seo_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `seo_description` text COLLATE utf8_unicode_ci,
  `seo_headline` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `seo_text` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `category_parent` (`parent`),
  KEY `category_list` (`pid`,`deleted`,`sys_language_uid`),
  KEY `import` (`import_id`,`import_source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `sys_category_record_mm`;
CREATE TABLE `sys_category_record_mm` (
  `uid_local` int(11) NOT NULL DEFAULT '0',
  `uid_foreign` int(11) NOT NULL DEFAULT '0',
  `tablenames` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fieldname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `sorting_foreign` int(11) NOT NULL DEFAULT '0',
  KEY `uid_local_foreign` (`uid_local`,`uid_foreign`),
  KEY `uid_foreign_tablefield` (`uid_foreign`,`tablenames`(40),`fieldname`(3),`sorting_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `sys_collection`;
CREATE TABLE `sys_collection` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumtext COLLATE utf8_unicode_ci,
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `starttime` int(11) NOT NULL DEFAULT '0',
  `endtime` int(11) NOT NULL DEFAULT '0',
  `fe_group` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `title` tinytext COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'static',
  `table_name` tinytext COLLATE utf8_unicode_ci,
  `items` int(11) NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `sys_collection_entries`;
CREATE TABLE `sys_collection_entries` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uid_local` int(11) NOT NULL DEFAULT '0',
  `uid_foreign` int(11) NOT NULL DEFAULT '0',
  `tablenames` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `sys_domain`;
CREATE TABLE `sys_domain` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `domainName` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `redirectTo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `redirectHttpStatusCode` int(10) unsigned NOT NULL DEFAULT '301',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `prepend_params` int(11) NOT NULL DEFAULT '0',
  `forced` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `getSysDomain` (`redirectTo`,`hidden`),
  KEY `getDomainStartPage` (`pid`,`hidden`,`domainName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `last_indexed` int(11) NOT NULL DEFAULT '0',
  `missing` smallint(6) NOT NULL DEFAULT '0',
  `storage` int(11) NOT NULL DEFAULT '0',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `metadata` int(11) NOT NULL DEFAULT '0',
  `identifier` text COLLATE utf8_unicode_ci,
  `identifier_hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder_hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mime_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` tinytext COLLATE utf8_unicode_ci,
  `sha1` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `creation_date` int(11) NOT NULL DEFAULT '0',
  `modification_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `sel01` (`storage`,`identifier_hash`),
  KEY `folder` (`storage`,`folder_hash`),
  KEY `tstamp` (`tstamp`),
  KEY `lastindex` (`last_indexed`),
  KEY `sha1` (`sha1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `sys_file` (`uid`, `pid`, `tstamp`, `last_indexed`, `missing`, `storage`, `type`, `metadata`, `identifier`, `identifier_hash`, `folder_hash`, `extension`, `mime_type`, `name`, `sha1`, `size`, `creation_date`, `modification_date`) VALUES
(1,	0,	1540384705,	1540384705,	0,	1,	'2',	0,	'/demo/d2-1-gold.png',	'68187b5b5e3bcc51bddbb1883fab75c976bb5acf',	'dccf9746bbea6a3c592ea566a426e71379b87e7a',	'png',	'image/png',	'd2-1-gold.png',	'78113533c61f82feaf55870c394002167bd27334',	4069,	1540384705,	1540384705),
(2,	0,	1540384705,	1540384705,	0,	1,	'2',	0,	'/demo/d2-1.png',	'233995e25867932c064e56bc813e3da9a08bf042',	'dccf9746bbea6a3c592ea566a426e71379b87e7a',	'png',	'image/png',	'd2-1.png',	'5ef3a6bc4991a64602caa6d3e9458381b9c6fa0e',	4069,	1540384705,	1540384705),
(3,	0,	1540391104,	0,	0,	0,	'2',	0,	'/typo3/sysext/indexed_search/Resources/Public/Icons/FileTypes/pages.gif',	'a29edd12d132bfd31b97ef46f7cfb6aa74a967f4',	'1d50fb38753b56d6a38d6f0aae9ffc7db62efede',	'gif',	'image/gif',	'pages.gif',	'5c5fd7567caa18c3c6cff78996c73b78c2b77864',	102,	1539006858,	1534836201);

DROP TABLE IF EXISTS `sys_filemounts`;
CREATE TABLE `sys_filemounts` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(2000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `base` int(10) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `read_only` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `sys_file_collection`;
CREATE TABLE `sys_file_collection` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumtext COLLATE utf8_unicode_ci,
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `starttime` int(11) NOT NULL DEFAULT '0',
  `endtime` int(11) NOT NULL DEFAULT '0',
  `title` tinytext COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'static',
  `files` int(11) NOT NULL DEFAULT '0',
  `storage` int(11) NOT NULL DEFAULT '0',
  `folder` text COLLATE utf8_unicode_ci,
  `recursive` smallint(6) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `sys_file_metadata`;
CREATE TABLE `sys_file_metadata` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `file` int(11) NOT NULL DEFAULT '0',
  `title` tinytext COLLATE utf8_unicode_ci,
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `alternative` text COLLATE utf8_unicode_ci,
  `l10n_state` text COLLATE utf8_unicode_ci,
  `categories` int(11) NOT NULL DEFAULT '0',
  `visible` int(10) unsigned DEFAULT '1',
  `status` varchar(24) COLLATE utf8_unicode_ci DEFAULT '',
  `keywords` text COLLATE utf8_unicode_ci,
  `caption` text COLLATE utf8_unicode_ci,
  `creator_tool` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `download_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `creator` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `publisher` varchar(45) COLLATE utf8_unicode_ci DEFAULT '',
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `copyright` text COLLATE utf8_unicode_ci,
  `location_country` varchar(45) COLLATE utf8_unicode_ci DEFAULT '',
  `location_region` varchar(45) COLLATE utf8_unicode_ci DEFAULT '',
  `location_city` varchar(45) COLLATE utf8_unicode_ci DEFAULT '',
  `latitude` decimal(24,14) DEFAULT '0.00000000000000',
  `longitude` decimal(24,14) DEFAULT '0.00000000000000',
  `ranking` int(10) unsigned DEFAULT '0',
  `content_creation_date` int(10) unsigned DEFAULT '0',
  `content_modification_date` int(10) unsigned DEFAULT '0',
  `note` text COLLATE utf8_unicode_ci,
  `unit` varchar(3) COLLATE utf8_unicode_ci DEFAULT '',
  `duration` double DEFAULT '0',
  `color_space` varchar(4) COLLATE utf8_unicode_ci DEFAULT '',
  `pages` int(10) unsigned DEFAULT '0',
  `language` varchar(12) COLLATE utf8_unicode_ci DEFAULT '',
  `fe_groups` tinytext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `pid` (`pid`),
  KEY `file` (`file`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `fal_filelist` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `sys_file_metadata` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `sys_language_uid`, `l10n_parent`, `l10n_diffsource`, `t3ver_oid`, `t3ver_id`, `t3ver_wsid`, `t3ver_label`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `t3_origuid`, `file`, `title`, `width`, `height`, `description`, `alternative`, `l10n_state`, `categories`, `visible`, `status`, `keywords`, `caption`, `creator_tool`, `download_name`, `creator`, `publisher`, `source`, `copyright`, `location_country`, `location_region`, `location_city`, `latitude`, `longitude`, `ranking`, `content_creation_date`, `content_modification_date`, `note`, `unit`, `duration`, `color_space`, `pages`, `language`, `fe_groups`) VALUES
(1,	0,	1540384705,	1540384705,	1,	0,	0,	'',	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1,	NULL,	1200,	600,	NULL,	NULL,	NULL,	0,	1,	'',	NULL,	NULL,	'',	'',	'',	'',	'',	NULL,	'',	'',	'',	0.00000000000000,	0.00000000000000,	0,	0,	0,	NULL,	'',	0,	'',	0,	'',	NULL),
(2,	0,	1540384705,	1540384705,	1,	0,	0,	'',	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	2,	NULL,	1200,	600,	NULL,	NULL,	NULL,	0,	1,	'',	NULL,	NULL,	'',	'',	'',	'',	'',	NULL,	'',	'',	'',	0.00000000000000,	0.00000000000000,	0,	0,	0,	NULL,	'',	0,	'',	0,	'',	NULL),
(3,	0,	1540391104,	1540391104,	1,	0,	0,	'',	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	3,	NULL,	18,	16,	NULL,	NULL,	NULL,	0,	1,	'',	NULL,	NULL,	'',	'',	'',	'',	'',	NULL,	'',	'',	'',	0.00000000000000,	0.00000000000000,	0,	0,	0,	NULL,	'',	0,	'',	0,	'',	NULL);

DROP TABLE IF EXISTS `sys_file_processedfile`;
CREATE TABLE `sys_file_processedfile` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `storage` int(11) NOT NULL DEFAULT '0',
  `original` int(11) NOT NULL DEFAULT '0',
  `identifier` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` tinytext COLLATE utf8_unicode_ci,
  `configuration` text COLLATE utf8_unicode_ci,
  `configurationsha1` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `originalfilesha1` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `task_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `checksum` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` int(11) DEFAULT '0',
  `height` int(11) DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `combined_1` (`original`,`task_type`,`configurationsha1`),
  KEY `identifier` (`storage`,`identifier`(199))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `sys_file_processedfile` (`uid`, `tstamp`, `crdate`, `storage`, `original`, `identifier`, `name`, `configuration`, `configurationsha1`, `originalfilesha1`, `task_type`, `checksum`, `width`, `height`) VALUES
(1,	1540384758,	1540384758,	1,	1,	'',	NULL,	'a:7:{s:5:\"width\";N;s:6:\"height\";N;s:8:\"minWidth\";N;s:9:\"minHeight\";N;s:8:\"maxWidth\";N;s:9:\"maxHeight\";i:150;s:4:\"crop\";N;}',	'cfe93cbb07d0cfbe7800b799777ad2e70305dbab',	'78113533c61f82feaf55870c394002167bd27334',	'Image.CropScaleMask',	'0cfcc04475',	NULL,	NULL),
(2,	1540384758,	1540384758,	1,	1,	'/_processed_/3/0/preview_d2-1-gold_c6639801b3.png',	'preview_d2-1-gold_c6639801b3.png',	'a:2:{s:5:\"width\";i:45;s:6:\"height\";i:45;}',	'b0d56d56a4278a814fda5a593711f40921d5c3f0',	'78113533c61f82feaf55870c394002167bd27334',	'Image.Preview',	'c6639801b3',	NULL,	NULL),
(3,	1540384781,	1540384781,	1,	2,	'',	NULL,	'a:7:{s:5:\"width\";N;s:6:\"height\";N;s:8:\"minWidth\";N;s:9:\"minHeight\";N;s:8:\"maxWidth\";N;s:9:\"maxHeight\";i:150;s:4:\"crop\";N;}',	'cfe93cbb07d0cfbe7800b799777ad2e70305dbab',	'5ef3a6bc4991a64602caa6d3e9458381b9c6fa0e',	'Image.CropScaleMask',	'2faf0f23df',	NULL,	NULL),
(4,	1540384781,	1540384781,	1,	2,	'/_processed_/7/e/preview_d2-1_bc1896b4ef.png',	'preview_d2-1_bc1896b4ef.png',	'a:2:{s:5:\"width\";i:45;s:6:\"height\";i:45;}',	'b0d56d56a4278a814fda5a593711f40921d5c3f0',	'5ef3a6bc4991a64602caa6d3e9458381b9c6fa0e',	'Image.Preview',	'bc1896b4ef',	NULL,	NULL),
(5,	1540384789,	1540384789,	1,	2,	'',	NULL,	'a:3:{s:5:\"width\";i:64;s:6:\"height\";s:3:\"64c\";s:4:\"crop\";N;}',	'1721acbe390638a893310b0f6fe9845a9cd2b754',	'5ef3a6bc4991a64602caa6d3e9458381b9c6fa0e',	'Image.CropScaleMask',	'08a1736b4d',	NULL,	NULL),
(6,	1540384789,	1540384789,	1,	1,	'',	NULL,	'a:3:{s:5:\"width\";i:64;s:6:\"height\";s:3:\"64c\";s:4:\"crop\";N;}',	'1721acbe390638a893310b0f6fe9845a9cd2b754',	'78113533c61f82feaf55870c394002167bd27334',	'Image.CropScaleMask',	'5b5c259bd2',	NULL,	NULL),
(7,	1540389075,	1540389075,	1,	1,	'',	NULL,	'a:3:{s:5:\"width\";i:295;s:6:\"height\";d:147;s:4:\"crop\";N;}',	'3bb3d226685eb57f1dd55c489f4b5fe60f6fde40',	'78113533c61f82feaf55870c394002167bd27334',	'Image.CropScaleMask',	'6f7135e75a',	NULL,	NULL),
(8,	1540389075,	1540389075,	1,	2,	'',	NULL,	'a:3:{s:5:\"width\";i:295;s:6:\"height\";d:147;s:4:\"crop\";N;}',	'3bb3d226685eb57f1dd55c489f4b5fe60f6fde40',	'5ef3a6bc4991a64602caa6d3e9458381b9c6fa0e',	'Image.CropScaleMask',	'0c7c7db1cd',	NULL,	NULL),
(9,	1540389479,	1540389479,	1,	1,	'/_processed_/3/0/preview_d2-1-gold_52716656ac.png',	'preview_d2-1-gold_52716656ac.png',	'a:3:{s:5:\"width\";i:45;s:6:\"height\";i:45;s:4:\"crop\";s:98:\"{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}\";}',	'810cb3ebae746ce83d653c014560bffa73be2bdc',	'78113533c61f82feaf55870c394002167bd27334',	'Image.Preview',	'52716656ac',	NULL,	NULL),
(10,	1540389479,	1540389479,	1,	2,	'/_processed_/7/e/preview_d2-1_a0ba851f56.png',	'preview_d2-1_a0ba851f56.png',	'a:3:{s:5:\"width\";i:45;s:6:\"height\";i:45;s:4:\"crop\";s:98:\"{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}\";}',	'810cb3ebae746ce83d653c014560bffa73be2bdc',	'5ef3a6bc4991a64602caa6d3e9458381b9c6fa0e',	'Image.Preview',	'a0ba851f56',	NULL,	NULL),
(11,	1540389499,	1540389499,	1,	1,	'',	NULL,	'a:3:{s:5:\"width\";i:600;s:6:\"height\";d:300;s:4:\"crop\";N;}',	'cf99b0a9fe98fdce7dab5a9a8540222e61ecfbcd',	'78113533c61f82feaf55870c394002167bd27334',	'Image.CropScaleMask',	'9d0a1e93e6',	NULL,	NULL),
(12,	1540391104,	1540391104,	0,	3,	'',	NULL,	'a:7:{s:5:\"width\";N;s:6:\"height\";N;s:8:\"minWidth\";N;s:9:\"minHeight\";N;s:8:\"maxWidth\";N;s:9:\"maxHeight\";N;s:4:\"crop\";N;}',	'24f48d5b4de7d99b7144e6559156976855e74b5d',	'5c5fd7567caa18c3c6cff78996c73b78c2b77864',	'Image.CropScaleMask',	'ea6b096af9',	NULL,	NULL);

DROP TABLE IF EXISTS `sys_file_reference`;
CREATE TABLE `sys_file_reference` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  `uid_local` int(11) NOT NULL DEFAULT '0',
  `uid_foreign` int(11) NOT NULL DEFAULT '0',
  `tablenames` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fieldname` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting_foreign` int(11) NOT NULL DEFAULT '0',
  `table_local` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` tinytext COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `alternative` text COLLATE utf8_unicode_ci,
  `link` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `crop` varchar(4000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `autoplay` smallint(6) NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  `showinpreview` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`),
  KEY `tablenames_fieldname` (`tablenames`(32),`fieldname`(12)),
  KEY `deleted` (`deleted`),
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`),
  KEY `combined_1` (`l10n_parent`,`t3ver_oid`,`t3ver_wsid`,`t3ver_state`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `sys_file_reference` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `sorting`, `deleted`, `hidden`, `t3ver_oid`, `t3ver_id`, `t3ver_wsid`, `t3ver_label`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `t3_origuid`, `sys_language_uid`, `l10n_parent`, `l10n_diffsource`, `uid_local`, `uid_foreign`, `tablenames`, `fieldname`, `sorting_foreign`, `table_local`, `title`, `description`, `alternative`, `link`, `crop`, `autoplay`, `l10n_state`, `showinpreview`) VALUES
(1,	12,	1540389492,	1540384788,	1,	0,	0,	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	0,	0,	'a:1:{s:6:\"hidden\";N;}',	1,	3,	'tt_content',	'image',	1,	'sys_file',	NULL,	NULL,	NULL,	'',	'{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',	0,	NULL,	0),
(2,	12,	1540389492,	1540384788,	1,	0,	1,	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	0,	0,	'',	2,	3,	'tt_content',	'image',	2,	'sys_file',	NULL,	NULL,	NULL,	'',	'{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',	0,	NULL,	0),
(3,	12,	1540389855,	1540389832,	1,	0,	0,	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1,	1,	'a:1:{s:6:\"hidden\";i:0;}',	1,	6,	'tt_content',	'image',	1,	'sys_file',	NULL,	NULL,	NULL,	'',	'{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',	0,	NULL,	0),
(4,	13,	1540390225,	1540390225,	1,	0,	0,	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	0,	0,	'a:1:{s:6:\"hidden\";N;}',	1,	25,	'tt_content',	'image',	1,	'sys_file',	NULL,	NULL,	NULL,	'',	'{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',	0,	NULL,	0),
(5,	13,	1540390984,	1540390225,	1,	0,	0,	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1,	4,	'a:1:{s:6:\"hidden\";i:0;}',	1,	26,	'tt_content',	'image',	1,	'sys_file',	NULL,	NULL,	NULL,	'',	'{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',	0,	NULL,	0),
(6,	16,	1540390235,	1540390235,	1,	0,	0,	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	0,	0,	'a:1:{s:6:\"hidden\";N;}',	1,	27,	'tt_content',	'image',	1,	'sys_file',	NULL,	NULL,	NULL,	'',	'{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',	0,	NULL,	0),
(7,	16,	1540390255,	1540390235,	1,	0,	0,	0,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1,	6,	'a:1:{s:6:\"hidden\";i:0;}',	1,	28,	'tt_content',	'image',	1,	'sys_file',	NULL,	NULL,	NULL,	'',	'{\"default\":{\"cropArea\":{\"x\":0,\"y\":0,\"width\":1,\"height\":1},\"selectedRatio\":\"NaN\",\"focusArea\":null}}',	0,	NULL,	0);

DROP TABLE IF EXISTS `sys_file_storage`;
CREATE TABLE `sys_file_storage` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `driver` tinytext COLLATE utf8_unicode_ci,
  `configuration` text COLLATE utf8_unicode_ci,
  `is_default` smallint(6) NOT NULL DEFAULT '0',
  `is_browsable` smallint(6) NOT NULL DEFAULT '0',
  `is_public` smallint(6) NOT NULL DEFAULT '0',
  `is_writable` smallint(6) NOT NULL DEFAULT '0',
  `is_online` smallint(6) NOT NULL DEFAULT '1',
  `auto_extract_metadata` smallint(6) NOT NULL DEFAULT '1',
  `processingfolder` tinytext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `sys_file_storage` (`uid`, `pid`, `tstamp`, `crdate`, `cruser_id`, `deleted`, `name`, `description`, `driver`, `configuration`, `is_default`, `is_browsable`, `is_public`, `is_writable`, `is_online`, `auto_extract_metadata`, `processingfolder`) VALUES
(1,	0,	1540282999,	1540282999,	0,	0,	'fileadmin/ (auto-created)',	'This is the local fileadmin/ directory. This storage mount has been created automatically by TYPO3.',	'Local',	'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"basePath\">\n                    <value index=\"vDEF\">fileadmin/</value>\n                </field>\n                <field index=\"pathType\">\n                    <value index=\"vDEF\">relative</value>\n                </field>\n                <field index=\"caseSensitive\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',	1,	1,	1,	1,	1,	1,	NULL);

DROP TABLE IF EXISTS `sys_history`;
CREATE TABLE `sys_history` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `sys_log_uid` int(11) NOT NULL DEFAULT '0',
  `history_data` mediumtext COLLATE utf8_unicode_ci,
  `fieldlist` text COLLATE utf8_unicode_ci,
  `recuid` int(11) NOT NULL DEFAULT '0',
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `history_files` mediumtext COLLATE utf8_unicode_ci,
  `snapshot` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `recordident_1` (`tablename`,`recuid`),
  KEY `recordident_2` (`tablename`,`tstamp`),
  KEY `sys_log_uid` (`sys_log_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `sys_language`;
CREATE TABLE `sys_language` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `flag` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `language_isocode` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `static_lang_isocode` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `sys_language` (`uid`, `pid`, `tstamp`, `hidden`, `title`, `flag`, `language_isocode`, `static_lang_isocode`, `sorting`) VALUES
(1,	0,	1540370934,	0,	'German (Deutsch)',	'de',	'de',	0,	256);

DROP TABLE IF EXISTS `sys_lockedrecords`;
CREATE TABLE `sys_lockedrecords` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `record_table` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `record_uid` int(11) NOT NULL DEFAULT '0',
  `record_pid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `feuserid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `action` smallint(5) unsigned NOT NULL DEFAULT '0',
  `recuid` int(10) unsigned NOT NULL DEFAULT '0',
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recpid` int(11) NOT NULL DEFAULT '0',
  `error` smallint(5) unsigned NOT NULL DEFAULT '0',
  `details` text COLLATE utf8_unicode_ci,
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `details_nr` smallint(6) NOT NULL DEFAULT '0',
  `IP` varchar(39) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `log_data` text COLLATE utf8_unicode_ci,
  `event_pid` int(11) NOT NULL DEFAULT '-1',
  `workspace` int(11) NOT NULL DEFAULT '0',
  `NEWid` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `request_id` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time_micro` double NOT NULL DEFAULT '0',
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `level` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `event` (`userid`,`event_pid`),
  KEY `recuidIdx` (`recuid`),
  KEY `user_auth` (`type`,`action`,`tstamp`),
  KEY `request` (`request_id`),
  KEY `combined_1` (`tstamp`,`type`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `sys_news`;
CREATE TABLE `sys_news` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `sys_note`;
CREATE TABLE `sys_note` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci,
  `personal` smallint(5) unsigned NOT NULL DEFAULT '0',
  `category` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `sys_refindex`;
CREATE TABLE `sys_refindex` (
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recuid` int(11) NOT NULL DEFAULT '0',
  `field` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `flexpointer` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `softref_key` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `softref_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `workspace` int(11) NOT NULL DEFAULT '0',
  `ref_table` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ref_uid` int(11) NOT NULL DEFAULT '0',
  `ref_string` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`hash`),
  KEY `lookup_rec` (`tablename`(240),`recuid`),
  KEY `lookup_uid` (`ref_table`(240),`ref_uid`),
  KEY `lookup_string` (`ref_string`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `sys_refindex` (`hash`, `tablename`, `recuid`, `field`, `flexpointer`, `softref_key`, `softref_id`, `sorting`, `deleted`, `workspace`, `ref_table`, `ref_uid`, `ref_string`) VALUES
('0a0299dc735e6b3c9ea5d52b9ba2707b',	'tt_content',	37,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	34,	''),
('1a80e018546c4774ebf79b29e82cdbf0',	'tt_content',	38,	'tx_gridelements_children',	'',	'',	'',	1,	0,	0,	'tt_content',	37,	''),
('1d811a3925393e92fa6972d3172e3eca',	'tt_content',	26,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	25,	''),
('219c4b771c6f77c1793dc6e6b01cd7e4',	'tt_content',	38,	'tx_gridelements_children',	'',	'',	'',	0,	0,	0,	'tt_content',	36,	''),
('2d1eba3ebe5a9f0ce5464fc2f2a5eab4',	'tt_content',	8,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	5,	''),
('2d516d979ecdf3aa6af4a3a650e7e6ba',	'tt_content',	22,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	21,	''),
('32a6672cc485fba7968ab149b4174f92',	'pages_language_overlay',	7,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	''),
('32fbff3defba7af4f9454687ddda475e',	'tt_content',	33,	'tx_gridelements_children',	'',	'',	'',	1,	0,	0,	'tt_content',	34,	''),
('33a53c3a3427b257fa46a60f2f8b6338',	'tt_content',	18,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	17,	''),
('3443c4c8f56a794f86bfe6687b0fefa7',	'sys_file_reference',	6,	'uid_local',	'',	'',	'',	0,	0,	0,	'sys_file',	1,	''),
('350b29a419daef850aa93ad9586e30f4',	'tt_content',	24,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	23,	''),
('438b43d9e039bf4a08ff4e0caa9081ca',	'sys_file_reference',	5,	'l10n_parent',	'',	'',	'',	0,	0,	0,	'sys_file_reference',	4,	''),
('4502398f69470036cbce8ccba3b9fc9b',	'tt_content',	14,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	13,	''),
('4cf8716d11b3277bc3b6343d9aa72dd5',	'pages_language_overlay',	2,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	''),
('4d053c51b6032ba5d47f622755ea089d',	'pages',	6,	'shortcut',	'',	'',	'',	0,	0,	0,	'pages',	4,	''),
('4ddee0a67d1b98321c15d39808862d17',	'pages_language_overlay',	6,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	''),
('510dbf154175c6417b07ea5f7d20b29c',	'sys_file_reference',	5,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	''),
('52206a0378a42f2c71f828df0a49d07b',	'tt_content',	3,	'image',	'',	'',	'',	0,	0,	0,	'sys_file_reference',	1,	''),
('5349de1901eb0c90afc1366c9959485b',	'tt_content',	28,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	27,	''),
('5458228fe89ddb4a03099356ed48eb7c',	'tt_content',	7,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	4,	''),
('550cd1dca4b104fe5fc178ab8f159854',	'tt_content',	3,	'image',	'',	'',	'',	1,	0,	0,	'sys_file_reference',	2,	''),
('59c41b9f1d5338d9417c9b6817e2c542',	'sys_file',	2,	'storage',	'',	'',	'',	0,	0,	0,	'sys_file_storage',	1,	''),
('5b659c035b2ec797bd434eafc6ce3fdf',	'sys_file_reference',	7,	'l10n_parent',	'',	'',	'',	0,	0,	0,	'sys_file_reference',	6,	''),
('5c81cc7d074c6bd9ca9ef368d028648b',	'tt_content',	36,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	35,	''),
('61f39a75834ed2f79dfe938a32fa919d',	'pages_language_overlay',	4,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	''),
('620d83da5d9983e9c47a321787a34f94',	'tt_content',	36,	'tx_gridelements_container',	'',	'',	'',	0,	0,	0,	'tt_content',	38,	''),
('628885d8ce70c399a75d88dfa56f6c79',	'tt_content',	28,	'image',	'',	'',	'',	0,	0,	0,	'sys_file_reference',	7,	''),
('63ef53519fa018c99b91e005ac359601',	'pages_language_overlay',	3,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	''),
('64dee6445f2100265a9cbff26e7d2f74',	'tt_content',	37,	'tx_gridelements_container',	'',	'',	'',	0,	0,	0,	'tt_content',	38,	''),
('6dc2e50186331b4108e651c5f8308d4d',	'tt_content',	30,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	29,	''),
('6dda85ef2f749589cadbf7cdf8e7e36a',	'sys_file_reference',	3,	'l10n_parent',	'',	'',	'',	0,	0,	0,	'sys_file_reference',	1,	''),
('72615181d7b8528970771c1459c338ae',	'tt_content',	6,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	3,	''),
('72d16fd7cfbe652ef7e84fa172285115',	'tt_content',	20,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	19,	''),
('765652c10157cfb6cc414c8729462178',	'tt_content',	34,	'tx_gridelements_container',	'',	'',	'',	0,	0,	0,	'tt_content',	33,	''),
('76c27f157a3215976409898fad35cbb0',	'sys_file',	2,	'metadata',	'',	'',	'',	0,	0,	0,	'sys_file_metadata',	2,	''),
('7b5c0a1bbe9073fcc5ad5ca538215794',	'tt_content',	6,	'image',	'',	'',	'',	0,	0,	0,	'sys_file_reference',	3,	''),
('810203dd694732b7c7fac624a60c5e3d',	'pages',	7,	'shortcut',	'',	'',	'',	0,	0,	0,	'pages',	5,	''),
('9459dcf4ed5fb8da3a068f6bf09e03b1',	'tt_content',	12,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	11,	''),
('9700b267243569c573079086bdbf2c92',	'tt_content',	35,	'tx_gridelements_container',	'',	'',	'',	0,	0,	0,	'tt_content',	33,	''),
('97f32c79ef51092352f499bf73f58376',	'tt_content',	25,	'image',	'',	'',	'',	0,	0,	0,	'sys_file_reference',	4,	''),
('9b3fce6599f2570388f129853ad294e8',	'tt_content',	2,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	1,	''),
('9f14da3b8f5fe576df03d50d8f328b1b',	'sys_file_reference',	3,	'uid_local',	'',	'',	'',	0,	0,	0,	'sys_file',	1,	''),
('a3a953ad37ad2a9fb39c84506b091278',	'tt_content',	33,	'tx_gridelements_children',	'',	'',	'',	0,	0,	0,	'tt_content',	35,	''),
('a71334ea97f50ce0ce84899ba8fa5547',	'pages_language_overlay',	13,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	''),
('a957f6787926d9ab04dc05f2971bff82',	'sys_file_reference',	3,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	''),
('ade3204a21e93bed69d649d1b6ae1fcb',	'sys_file_reference',	5,	'uid_local',	'',	'',	'',	0,	0,	0,	'sys_file',	1,	''),
('b1315f6a325027205050c81764294b72',	'sys_file',	1,	'storage',	'',	'',	'',	0,	0,	0,	'sys_file_storage',	1,	''),
('b8b9daf444e4eefb639cefa1171ee0d8',	'pages_language_overlay',	5,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	''),
('b926231e438eaad74efa7ef8ae89995f',	'tt_content',	38,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	33,	''),
('bb47b7f031fff3c038f4c3032129b7dd',	'sys_file_reference',	4,	'uid_local',	'',	'',	'',	0,	0,	0,	'sys_file',	1,	''),
('bcdc321b03309fbc9a0c4ba0178d27b5',	'sys_file_reference',	7,	'uid_local',	'',	'',	'',	0,	0,	0,	'sys_file',	1,	''),
('bdd2a6eb99d51bfe8bf78a1a6cc34092',	'pages_language_overlay',	1,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	''),
('c198823e95278ee364ba1542303f4990',	'tt_content',	32,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	31,	''),
('c969e9d4ced0356c6c86cd52953b6dca',	'pages_language_overlay',	11,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	''),
('c9e5fd0779ac498c6d34d6dc7a1a2a14',	'tt_content',	10,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	9,	''),
('ca32a9b1b1eebe9d9748c8360f02e3b1',	'pages_language_overlay',	12,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	''),
('cbe0b09949ab428f77138c71ab292071',	'pages_language_overlay',	14,	'shortcut',	'',	'',	'',	0,	0,	0,	'pages',	5,	''),
('d7f395d6becfac465d016275f09e5a9b',	'pages_language_overlay',	10,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	''),
('dcf4e6a010028aa9ad6aaaee01dd7875',	'sys_file_reference',	2,	'uid_local',	'',	'',	'',	0,	1,	0,	'sys_file',	2,	''),
('de89fbc508d8a12d8425a113302ff5ed',	'sys_file_reference',	1,	'uid_local',	'',	'',	'',	0,	0,	0,	'sys_file',	1,	''),
('e064d8f0ba82dd792bb32d7f05238abe',	'tt_content',	27,	'image',	'',	'',	'',	0,	0,	0,	'sys_file_reference',	6,	''),
('e3d088eeb4060e4e4871713247bc4195',	'pages_language_overlay',	9,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	''),
('e786152473d81766c78573daad63921a',	'pages_language_overlay',	15,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	''),
('e96a238ec727484a86634e650598f843',	'sys_template',	1,	'constants',	'',	'url',	'2',	-1,	0,	0,	'_STRING',	0,	'http://localhost/imhh-typo3/web/'),
('ea728f7e026dd0cf2f6d5693d87d4472',	'pages_language_overlay',	15,	'shortcut',	'',	'',	'',	0,	0,	0,	'pages',	1,	''),
('ecdb77c1ba566b4b5efb67fb96502bf5',	'pages_language_overlay',	14,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	''),
('efc7669eeb56f6801bbb3c56471d7e75',	'pages_language_overlay',	13,	'shortcut',	'',	'',	'',	0,	0,	0,	'pages',	4,	''),
('f0ba3c1231532c5cd42f918f2705430f',	'pages',	8,	'shortcut',	'',	'',	'',	0,	0,	0,	'pages',	1,	''),
('f781acbfb08081913bca5f81da694f37',	'sys_file_reference',	7,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	''),
('fb9517c5fcd74a0790ef49012298b72d',	'tt_content',	26,	'image',	'',	'',	'',	0,	0,	0,	'sys_file_reference',	5,	''),
('fe4c106e5e1d487d6de83b9fc58d0185',	'tt_content',	16,	'l18n_parent',	'',	'',	'',	0,	0,	0,	'tt_content',	15,	''),
('ffca3e16ea3f13691f9439373478fcd5',	'pages_language_overlay',	8,	'sys_language_uid',	'',	'',	'',	0,	0,	0,	'sys_language',	1,	'');

DROP TABLE IF EXISTS `sys_registry`;
CREATE TABLE `sys_registry` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_namespace` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entry_key` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entry_value` mediumblob,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `entry_identifier` (`entry_namespace`,`entry_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `sys_registry` (`uid`, `entry_namespace`, `entry_key`, `entry_value`) VALUES
(1,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\AccessRightParametersUpdate',	'i:1;'),
(2,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\LanguageIsoCodeUpdate',	'i:1;'),
(3,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\PageShortcutParentUpdate',	'i:1;'),
(4,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\MigrateShortcutUrlsAgainUpdate',	'i:1;'),
(5,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\ProcessedFileChecksumUpdate',	'i:1;'),
(6,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\FilesReplacePermissionUpdate',	'i:1;'),
(7,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\TableFlexFormToTtContentFieldsUpdate',	'i:1;'),
(8,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\FileListInAccessModuleListUpdate',	'i:1;'),
(9,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\FileListIsStartModuleUpdate',	'i:1;'),
(10,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\WorkspacesNotificationSettingsUpdate',	'i:1;'),
(11,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\MigrateMediaToAssetsForTextMediaCe',	'i:1;'),
(12,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\Compatibility6ExtractionUpdate',	'i:1;'),
(13,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\OpenidExtractionUpdate',	'i:1;'),
(14,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\ExtensionManagerTables',	'i:1;'),
(15,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\WizardDoneToRegistry',	'i:1;'),
(16,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\BackendUserStartModuleUpdate',	'i:1;'),
(17,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\FrontendUserImageUpdateWizard',	'i:1;'),
(18,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\DatabaseRowsUpdateWizard',	'i:1;'),
(19,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\CommandLineBackendUserRemovalUpdate',	'i:1;'),
(20,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\FillTranslationSourceField',	'i:1;'),
(21,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\SectionFrameToFrameClassUpdate',	'i:1;'),
(22,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\SplitMenusUpdate',	'i:1;'),
(23,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\BulletContentElementUpdate',	'i:1;'),
(24,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\UploadContentElementUpdate',	'i:1;'),
(25,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\MigrateCscStaticTemplateUpdate',	'i:1;'),
(26,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\MigrateFscStaticTemplateUpdate',	'i:1;'),
(27,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\FileReferenceUpdate',	'i:1;'),
(28,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\MigrateFeSessionDataUpdate',	'i:1;'),
(29,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\Compatibility7ExtractionUpdate',	'i:1;'),
(30,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\FormLegacyExtractionUpdate',	'i:1;'),
(31,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\RteHtmlAreaExtractionUpdate',	'i:1;'),
(32,	'installUpdate',	'TYPO3\\CMS\\Install\\Updates\\LanguageSortingUpdate',	'i:1;'),
(33,	'extensionDataImport',	'typo3/sysext/core/ext_tables_static+adt.sql',	's:0:\"\";'),
(34,	'extensionDataImport',	'typo3/sysext/scheduler/ext_tables_static+adt.sql',	's:0:\"\";'),
(35,	'extensionDataImport',	'typo3/sysext/extbase/ext_tables_static+adt.sql',	's:0:\"\";'),
(36,	'extensionDataImport',	'typo3/sysext/fluid/ext_tables_static+adt.sql',	's:0:\"\";'),
(37,	'extensionDataImport',	'typo3/sysext/install/ext_tables_static+adt.sql',	's:0:\"\";'),
(38,	'extensionDataImport',	'typo3/sysext/extensionmanager/ext_tables_static+adt.sql',	's:32:\"6d9cccf73eaea1454a066f0cf626974d\";'),
(39,	'extensionDataImport',	'typo3/sysext/lang/ext_tables_static+adt.sql',	's:0:\"\";'),
(40,	'extensionDataImport',	'typo3/sysext/backend/ext_tables_static+adt.sql',	's:0:\"\";'),
(41,	'extensionDataImport',	'typo3/sysext/cshmanual/ext_tables_static+adt.sql',	's:0:\"\";'),
(42,	'extensionDataImport',	'typo3/sysext/filelist/ext_tables_static+adt.sql',	's:0:\"\";'),
(43,	'extensionDataImport',	'typo3/sysext/frontend/ext_tables_static+adt.sql',	's:0:\"\";'),
(44,	'extensionDataImport',	'typo3/sysext/recordlist/ext_tables_static+adt.sql',	's:0:\"\";'),
(45,	'extensionDataImport',	'typo3/sysext/saltedpasswords/ext_tables_static+adt.sql',	's:0:\"\";'),
(46,	'extensionDataImport',	'typo3/sysext/sv/ext_tables_static+adt.sql',	's:0:\"\";'),
(47,	'extensionDataImport',	'typo3conf/ext/gridelements/ext_tables_static+adt.sql',	's:0:\"\";'),
(48,	'extensionDataImport',	'typo3conf/ext/bootstrap_grids/ext_tables_static+adt.sql',	's:0:\"\";'),
(49,	'extensionDataImport',	'typo3conf/ext/realurl/ext_tables_static+adt.sql',	's:0:\"\";'),
(50,	'extensionDataImport',	'typo3conf/ext/news/ext_tables_static+adt.sql',	's:0:\"\";'),
(51,	'extensionDataImport',	'typo3conf/ext/dce/ext_tables_static+adt.sql',	's:0:\"\";'),
(52,	'extensionDataImport',	'typo3conf/ext/scriptmerger/ext_tables_static+adt.sql',	's:0:\"\";'),
(53,	'extensionDataImport',	'typo3conf/ext/sourceopt/ext_tables_static+adt.sql',	's:0:\"\";'),
(54,	'tx_realurl',	'updateLevel',	'i:4;'),
(55,	'core',	'formProtectionSessionToken:1',	's:64:\"f9b0955471e269a99fcac308fd98230d8912aefcd46972b61e3ae4a2b861d950\";'),
(56,	'TYPO3\\CMS\\Lang',	'de',	'i:1540553731;'),
(57,	'extensionDataImport',	'typo3conf/ext/imhh_base/ext_tables_static+adt.sql',	's:0:\"\";'),
(58,	'extensionDataImport',	'typo3/sysext/tstemplate/ext_tables_static+adt.sql',	's:0:\"\";'),
(59,	'extensionDataImport',	'typo3conf/ext/typo3_base_ext/ext_tables_static+adt.sql',	's:0:\"\";'),
(60,	'extensionDataImport',	'typo3/sysext/info/ext_tables_static+adt.sql',	's:0:\"\";'),
(61,	'extensionDataImport',	'typo3/sysext/rsaauth/ext_tables_static+adt.sql',	's:0:\"\";'),
(62,	'extensionDataImport',	'typo3/sysext/reports/ext_tables_static+adt.sql',	's:0:\"\";'),
(63,	'extensionDataImport',	'typo3/sysext/rte_ckeditor/ext_tables_static+adt.sql',	's:0:\"\";'),
(64,	'extensionDataImport',	'typo3/sysext/viewpage/ext_tables_static+adt.sql',	's:0:\"\";'),
(65,	'extensionDataImport',	'typo3/sysext/beuser/ext_tables_static+adt.sql',	's:0:\"\";'),
(66,	'extensionDataImport',	'typo3/sysext/belog/ext_tables_static+adt.sql',	's:0:\"\";'),
(67,	'extensionDataImport',	'typo3/sysext/setup/ext_tables_static+adt.sql',	's:0:\"\";'),
(68,	'extensionDataImport',	'typo3/sysext/func/ext_tables_static+adt.sql',	's:0:\"\";'),
(69,	'extensionDataImport',	'typo3/sysext/wizard_sortpages/ext_tables_static+adt.sql',	's:0:\"\";'),
(70,	'extensionDataImport',	'typo3/sysext/wizard_crpages/ext_tables_static+adt.sql',	's:0:\"\";'),
(71,	'extensionDataImport',	'typo3/sysext/taskcenter/ext_tables_static+adt.sql',	's:0:\"\";'),
(72,	'extensionDataImport',	'typo3/sysext/t3editor/ext_tables_static+adt.sql',	's:0:\"\";'),
(73,	'extensionDataImport',	'typo3/sysext/info_pagetsconfig/ext_tables_static+adt.sql',	's:0:\"\";'),
(74,	'extensionDataImport',	'typo3/sysext/lowlevel/ext_tables_static+adt.sql',	's:0:\"\";'),
(75,	'extensionDataImport',	'typo3/sysext/sys_action/ext_tables_static+adt.sql',	's:0:\"\";'),
(76,	'extensionDataImport',	'typo3/sysext/about/ext_tables_static+adt.sql',	's:0:\"\";'),
(77,	'extensionDataImport',	'typo3/sysext/filemetadata/ext_tables_static+adt.sql',	's:0:\"\";'),
(78,	'extensionDataImport',	'typo3/sysext/context_help/ext_tables_static+adt.sql',	's:0:\"\";'),
(79,	'extensionDataImport',	'typo3/sysext/sys_note/ext_tables_static+adt.sql',	's:0:\"\";'),
(80,	'extensionDataImport',	'typo3/sysext/opendocs/ext_tables_static+adt.sql',	's:0:\"\";'),
(81,	'extensionDataImport',	'typo3/sysext/fluid_styled_content/ext_tables_static+adt.sql',	's:0:\"\";'),
(82,	'extensionDataImport',	'typo3/sysext/indexed_search/ext_tables_static+adt.sql',	's:0:\"\";'),
(83,	'extensionDataImport',	'typo3conf/ext/imhh_t3base/ext_tables_static+adt.sql',	's:0:\"\";');

DROP TABLE IF EXISTS `sys_template`;
CREATE TABLE `sys_template` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sitetitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `root` smallint(5) unsigned NOT NULL DEFAULT '0',
  `clear` smallint(5) unsigned NOT NULL DEFAULT '0',
  `include_static_file` text COLLATE utf8_unicode_ci,
  `constants` text COLLATE utf8_unicode_ci,
  `config` text COLLATE utf8_unicode_ci,
  `nextLevel` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `basedOn` tinytext COLLATE utf8_unicode_ci,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `includeStaticAfterBasedOn` smallint(5) unsigned NOT NULL DEFAULT '0',
  `static_file_mode` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `parent` (`pid`,`deleted`,`hidden`,`sorting`),
  KEY `roottemplate` (`deleted`,`hidden`,`root`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `sys_template` (`uid`, `pid`, `t3ver_oid`, `t3ver_id`, `t3ver_wsid`, `t3ver_label`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `t3_origuid`, `tstamp`, `sorting`, `crdate`, `cruser_id`, `title`, `sitetitle`, `hidden`, `starttime`, `endtime`, `root`, `clear`, `include_static_file`, `constants`, `config`, `nextLevel`, `description`, `basedOn`, `deleted`, `includeStaticAfterBasedOn`, `static_file_mode`) VALUES
(1,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540827633,	0,	1539008126,	1,	'Root TypoScript',	'',	0,	0,	0,	1,	1,	'EXT:indexed_search/Configuration/TypoScript,EXT:fluid_styled_content/Configuration/TypoScript/Styling/,EXT:fluid_styled_content/Configuration/TypoScript/,EXT:news/Configuration/TypoScript,EXT:sourceopt/Configuration/TypoScript,EXT:scriptmerger/Configuration/,EXT:gridelements/Configuration/TypoScript/,EXT:bootstrap_grids/Configuration/TypoScript,EXT:imhh_t3base/Configuration/TypoScript',	'plugin.tx_imhh_t3base.settings.title = TYPO3 Skeleton\r\nplugin.tx_imhh_t3base.settings.domain = http://localhost/imhh-typo3/web/\r\nplugin.tx_imhh_t3base.settings.main_navigation = 2\r\nplugin.tx_imhh_t3base.settings.footer_navigation = 3\r\nplugin.tx_indexedsearch.settings.targetPid = 18\r\nplugin.tx_indexedsearch.settings.rootPidList = 1',	'plugin.tx_indexedsearch.settings.blind.numberOfResults = 6\r\n\r\n# English\r\nconfig {\r\n    language = en\r\n    locale_all = en_US.utf8\r\n    htmlTag_langKey = en_US\r\n}\r\n\r\n# German\r\n[globalVar = GP:L = 1]\r\n    config {\r\n        language = de\r\n        locale_all = de_DE.utf8\r\n        htmlTag_langKey = de-DE\r\n    }\r\n[global]',	'',	'',	NULL,	0,	0,	0);

DROP TABLE IF EXISTS `tt_content`;
CREATE TABLE `tt_content` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `editlock` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `CType` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header_position` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rowDescription` text COLLATE utf8_unicode_ci,
  `bodytext` mediumtext COLLATE utf8_unicode_ci,
  `bullets_type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uploads_description` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uploads_type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `assets` int(10) unsigned NOT NULL DEFAULT '0',
  `image` int(10) unsigned NOT NULL DEFAULT '0',
  `imagewidth` int(10) unsigned NOT NULL DEFAULT '0',
  `imageorient` smallint(5) unsigned NOT NULL DEFAULT '0',
  `imagecols` smallint(5) unsigned NOT NULL DEFAULT '0',
  `imageborder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `media` int(10) unsigned NOT NULL DEFAULT '0',
  `layout` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `frame_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cols` int(10) unsigned NOT NULL DEFAULT '0',
  `spaceBefore` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceAfter` smallint(5) unsigned NOT NULL DEFAULT '0',
  `space_before_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `space_after_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `records` text COLLATE utf8_unicode_ci,
  `pages` text COLLATE utf8_unicode_ci,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `colPos` smallint(6) NOT NULL DEFAULT '0',
  `subheader` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fe_group` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `header_link` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image_zoom` smallint(5) unsigned NOT NULL DEFAULT '0',
  `header_layout` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `list_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sectionIndex` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linkToTop` smallint(5) unsigned NOT NULL DEFAULT '0',
  `file_collections` text COLLATE utf8_unicode_ci,
  `filelink_size` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filelink_sorting` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `recursive` smallint(5) unsigned NOT NULL DEFAULT '0',
  `imageheight` int(10) unsigned NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `pi_flexform` mediumtext COLLATE utf8_unicode_ci,
  `accessibility_title` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `accessibility_bypass` smallint(5) unsigned NOT NULL DEFAULT '0',
  `accessibility_bypass_text` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `l18n_parent` int(11) NOT NULL DEFAULT '0',
  `l18n_diffsource` mediumblob,
  `l10n_source` int(11) NOT NULL DEFAULT '0',
  `selected_categories` text COLLATE utf8_unicode_ci,
  `category_field` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `table_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `table_caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `table_delimiter` smallint(5) unsigned NOT NULL DEFAULT '0',
  `table_enclosure` smallint(5) unsigned NOT NULL DEFAULT '0',
  `table_header_position` smallint(5) unsigned NOT NULL DEFAULT '0',
  `table_tfoot` smallint(5) unsigned NOT NULL DEFAULT '0',
  `l10n_state` text COLLATE utf8_unicode_ci,
  `categories` int(11) NOT NULL DEFAULT '0',
  `backupColPos` smallint(6) NOT NULL DEFAULT '-2',
  `tx_gridelements_backend_layout` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tx_gridelements_children` int(11) NOT NULL DEFAULT '0',
  `tx_gridelements_container` int(11) NOT NULL DEFAULT '0',
  `tx_gridelements_columns` int(11) NOT NULL DEFAULT '0',
  `tx_news_related_news` int(11) NOT NULL DEFAULT '0',
  `tx_dce_dce` int(11) NOT NULL DEFAULT '0',
  `tx_dce_index` mediumtext COLLATE utf8_unicode_ci,
  `tx_dce_new_container` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `parent` (`pid`,`sorting`),
  KEY `language` (`l18n_parent`,`sys_language_uid`),
  KEY `gridelements` (`tx_gridelements_container`,`tx_gridelements_columns`),
  KEY `index_newscontent` (`tx_news_related_news`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tt_content` (`uid`, `pid`, `t3ver_oid`, `t3ver_id`, `t3ver_wsid`, `t3ver_label`, `t3ver_state`, `t3ver_stage`, `t3ver_count`, `t3ver_tstamp`, `t3ver_move_id`, `t3_origuid`, `tstamp`, `crdate`, `cruser_id`, `editlock`, `hidden`, `sorting`, `CType`, `header`, `header_position`, `rowDescription`, `bodytext`, `bullets_type`, `uploads_description`, `uploads_type`, `assets`, `image`, `imagewidth`, `imageorient`, `imagecols`, `imageborder`, `media`, `layout`, `frame_class`, `deleted`, `cols`, `spaceBefore`, `spaceAfter`, `space_before_class`, `space_after_class`, `records`, `pages`, `starttime`, `endtime`, `colPos`, `subheader`, `fe_group`, `header_link`, `image_zoom`, `header_layout`, `list_type`, `sectionIndex`, `linkToTop`, `file_collections`, `filelink_size`, `filelink_sorting`, `target`, `date`, `recursive`, `imageheight`, `sys_language_uid`, `pi_flexform`, `accessibility_title`, `accessibility_bypass`, `accessibility_bypass_text`, `l18n_parent`, `l18n_diffsource`, `l10n_source`, `selected_categories`, `category_field`, `table_class`, `table_caption`, `table_delimiter`, `table_enclosure`, `table_header_position`, `table_tfoot`, `l10n_state`, `categories`, `backupColPos`, `tx_gridelements_backend_layout`, `tx_gridelements_children`, `tx_gridelements_container`, `tx_gridelements_columns`, `tx_news_related_news`, `tx_dce_dce`, `tx_dce_index`, `tx_dce_new_container`) VALUES
(1,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540369233,	1540369233,	1,	0,	0,	1280,	'text',	'TYPO3 Skeleton',	'',	'',	'<p>This is a TYPO3 Skeleton for version 8.7 LTS.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	NULL,	NULL,	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	NULL,	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'',	0,	NULL,	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(2,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	1,	1540383951,	1540383786,	1,	0,	0,	1792,	'text',	'TYPO3 Skeleton',	'',	'',	'<p>Dies ist ein&nbsp;TYPO3 Skeleton für Version 8.7 LTS.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	1,	'a:25:{s:5:\"CType\";s:4:\"text\";s:6:\"colPos\";i:0;s:6:\"header\";s:14:\"TYPO3 Skeleton\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:8:\"bodytext\";s:52:\"<p>This is a TYPO3 Skeleton for version 8.7 LTS.</p>\";s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:11:\"l18n_parent\";i:0;s:6:\"hidden\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	1,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(3,	12,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540389492,	1540384788,	1,	0,	0,	256,	'image',	'',	'',	'',	NULL,	0,	0,	0,	0,	1,	0,	0,	1,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	NULL,	NULL,	0,	0,	2,	'',	'',	'',	0,	'0',	'',	1,	0,	NULL,	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'a:30:{s:5:\"CType\";N;s:6:\"colPos\";N;s:6:\"header\";N;s:13:\"header_layout\";N;s:15:\"header_position\";N;s:4:\"date\";N;s:11:\"header_link\";N;s:9:\"subheader\";N;s:5:\"image\";N;s:10:\"imagewidth\";N;s:11:\"imageheight\";N;s:11:\"imageborder\";N;s:11:\"imageorient\";N;s:9:\"imagecols\";N;s:10:\"image_zoom\";N;s:6:\"layout\";N;s:11:\"frame_class\";N;s:18:\"space_before_class\";N;s:17:\"space_after_class\";N;s:12:\"sectionIndex\";N;s:9:\"linkToTop\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:10:\"categories\";N;s:14:\"rowDescription\";N;s:25:\"tx_gridelements_container\";N;}',	0,	NULL,	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(4,	12,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540389669,	1540389669,	1,	0,	0,	128,	'text',	'Content',	'',	'',	'<p>This is the Content column.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	NULL,	NULL,	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	NULL,	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'',	0,	NULL,	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(5,	12,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540389710,	1540389710,	1,	0,	0,	64,	'text',	'Sidebar',	'',	'',	'<p>This is the Sidebar column.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	NULL,	NULL,	0,	0,	1,	'',	'',	'',	0,	'0',	'',	1,	0,	NULL,	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'',	0,	NULL,	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(6,	12,	0,	0,	0,	'',	0,	0,	0,	0,	0,	3,	1540389855,	1540389832,	1,	0,	0,	512,	'image',	'',	'',	'',	NULL,	0,	0,	0,	0,	1,	0,	0,	1,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	2,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	3,	'a:31:{s:5:\"CType\";s:5:\"image\";s:6:\"colPos\";i:2;s:6:\"header\";s:0:\"\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:5:\"image\";i:1;s:10:\"imagewidth\";i:0;s:11:\"imageheight\";i:0;s:11:\"imageborder\";i:0;s:11:\"imageorient\";i:0;s:9:\"imagecols\";i:1;s:10:\"image_zoom\";i:0;s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:0;s:11:\"l18n_parent\";i:0;}',	3,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(7,	12,	0,	0,	0,	'',	0,	0,	0,	0,	0,	4,	1540389981,	1540389925,	1,	0,	0,	192,	'text',	'Content',	'',	'',	'<p>Dies ist die Content-Spalte.</p>\r\n\r\n',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	4,	'a:25:{s:5:\"CType\";s:4:\"text\";s:6:\"colPos\";i:0;s:6:\"header\";s:7:\"Content\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:8:\"bodytext\";s:34:\"<p>This is the Content column.</p>\";s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:11:\"l18n_parent\";i:0;s:6:\"hidden\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	4,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(8,	12,	0,	0,	0,	'',	0,	0,	0,	0,	0,	5,	1540390015,	1540389935,	1,	0,	0,	96,	'text',	'Sidebar',	'',	'',	'<p>Dies ist die Sidebar-Spalte.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	1,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	5,	'a:25:{s:5:\"CType\";s:4:\"text\";s:6:\"colPos\";i:1;s:6:\"header\";s:7:\"Sidebar\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:8:\"bodytext\";s:34:\"<p>This is the Sidebar column.</p>\";s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:11:\"l18n_parent\";i:0;s:6:\"hidden\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	5,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(9,	11,	0,	0,	0,	'',	0,	0,	0,	0,	0,	4,	1540390056,	1540390047,	1,	0,	0,	256,	'text',	'Content',	'',	'',	'<p>This is the Content column.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'a:1:{s:6:\"hidden\";N;}',	0,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(10,	11,	0,	0,	0,	'',	0,	0,	0,	0,	0,	7,	1540390080,	1540390047,	1,	0,	0,	128,	'text',	'Content',	'',	'',	'<p>Dies ist die Content-Spalte.</p>\r\n\r\n',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	9,	'a:25:{s:5:\"CType\";s:4:\"text\";s:6:\"colPos\";i:0;s:6:\"header\";s:7:\"Content\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:8:\"bodytext\";s:34:\"<p>This is the Content column.</p>\";s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:11:\"l18n_parent\";i:0;s:6:\"hidden\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	9,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(11,	13,	0,	0,	0,	'',	0,	0,	0,	0,	0,	4,	1540390941,	1540390094,	1,	0,	0,	256,	'text',	'Content',	'',	'',	'<p>This is the Content column.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'a:1:{s:6:\"hidden\";N;}',	0,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(12,	13,	0,	0,	0,	'',	0,	0,	0,	0,	0,	7,	1540390999,	1540390094,	1,	0,	0,	128,	'text',	'Content',	'',	'',	'<p>Dies ist die Content-Spalte.</p>\r\n\r\n',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	11,	'a:25:{s:5:\"CType\";s:4:\"text\";s:6:\"colPos\";i:0;s:6:\"header\";s:7:\"Content\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:8:\"bodytext\";s:34:\"<p>This is the Content column.</p>\";s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:11:\"l18n_parent\";i:0;s:6:\"hidden\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	11,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(13,	14,	0,	0,	0,	'',	0,	0,	0,	0,	0,	4,	1540390933,	1540390100,	1,	0,	0,	256,	'text',	'Content',	'',	'',	'<p>This is the Content column.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'a:1:{s:6:\"hidden\";N;}',	0,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(14,	14,	0,	0,	0,	'',	0,	0,	0,	0,	0,	7,	1540390968,	1540390100,	1,	0,	0,	128,	'text',	'Content',	'',	'',	'<p>Dies ist die Content-Spalte.</p>\r\n\r\n',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	13,	'a:25:{s:5:\"CType\";s:4:\"text\";s:6:\"colPos\";i:0;s:6:\"header\";s:7:\"Content\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:8:\"bodytext\";s:34:\"<p>This is the Content column.</p>\";s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:11:\"l18n_parent\";i:0;s:6:\"hidden\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	13,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(15,	15,	0,	0,	0,	'',	0,	0,	0,	0,	0,	4,	1540390269,	1540390165,	1,	0,	0,	256,	'text',	'Content',	'',	'',	'<p>This is the Content column.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'a:1:{s:6:\"hidden\";N;}',	0,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(16,	15,	0,	0,	0,	'',	0,	0,	0,	0,	0,	7,	1540390289,	1540390165,	1,	0,	0,	128,	'text',	'Content',	'',	'',	'<p>Dies ist die Content-Spalte.</p>\r\n\r\n',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	15,	'a:25:{s:5:\"CType\";s:4:\"text\";s:6:\"colPos\";i:0;s:6:\"header\";s:7:\"Content\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:8:\"bodytext\";s:34:\"<p>This is the Content column.</p>\";s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:11:\"l18n_parent\";i:0;s:6:\"hidden\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	15,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(17,	16,	0,	0,	0,	'',	0,	0,	0,	0,	0,	4,	1540390247,	1540390173,	1,	0,	0,	256,	'text',	'Content',	'',	'',	'<p>This is the Content column.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'a:1:{s:6:\"hidden\";N;}',	0,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(18,	16,	0,	0,	0,	'',	0,	0,	0,	0,	0,	7,	1540390262,	1540390173,	1,	0,	0,	128,	'text',	'Content',	'',	'',	'<p>Dies ist die Content-Spalte.</p>\r\n\r\n',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	17,	'a:25:{s:5:\"CType\";s:4:\"text\";s:6:\"colPos\";i:0;s:6:\"header\";s:7:\"Content\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:8:\"bodytext\";s:34:\"<p>This is the Content column.</p>\";s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:11:\"l18n_parent\";i:0;s:6:\"hidden\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	17,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(19,	13,	0,	0,	0,	'',	0,	0,	0,	0,	0,	5,	1540390944,	1540390191,	1,	0,	0,	64,	'text',	'Sidebar',	'',	'',	'<p>This is the Sidebar column.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	1,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'a:1:{s:6:\"hidden\";N;}',	0,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(20,	13,	0,	0,	0,	'',	0,	0,	0,	0,	0,	8,	1540390992,	1540390191,	1,	0,	0,	32,	'text',	'Sidebar',	'',	'',	'<p>Dies ist die Sidebar-Spalte.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	1,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	19,	'a:25:{s:5:\"CType\";s:4:\"text\";s:6:\"colPos\";i:1;s:6:\"header\";s:7:\"Sidebar\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:8:\"bodytext\";s:34:\"<p>This is the Sidebar column.</p>\";s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:11:\"l18n_parent\";i:0;s:6:\"hidden\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	19,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(21,	14,	0,	0,	0,	'',	0,	0,	0,	0,	0,	5,	1540390931,	1540390198,	1,	0,	0,	64,	'text',	'Sidebar',	'',	'',	'<p>This is the Sidebar column.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	1,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'a:1:{s:6:\"hidden\";N;}',	0,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(22,	14,	0,	0,	0,	'',	0,	0,	0,	0,	0,	8,	1540390975,	1540390198,	1,	0,	0,	32,	'text',	'Sidebar',	'',	'',	'<p>Dies ist die Sidebar-Spalte.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	1,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	21,	'a:25:{s:5:\"CType\";s:4:\"text\";s:6:\"colPos\";i:1;s:6:\"header\";s:7:\"Sidebar\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:8:\"bodytext\";s:34:\"<p>This is the Sidebar column.</p>\";s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:11:\"l18n_parent\";i:0;s:6:\"hidden\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	21,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(23,	15,	0,	0,	0,	'',	0,	0,	0,	0,	0,	5,	1540390268,	1540390204,	1,	0,	0,	64,	'text',	'Sidebar',	'',	'',	'<p>This is the Sidebar column.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	1,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'a:1:{s:6:\"hidden\";N;}',	0,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(24,	15,	0,	0,	0,	'',	0,	0,	0,	0,	0,	8,	1540390283,	1540390204,	1,	0,	0,	32,	'text',	'Sidebar',	'',	'',	'<p>Dies ist die Sidebar-Spalte.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	1,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	23,	'a:25:{s:5:\"CType\";s:4:\"text\";s:6:\"colPos\";i:1;s:6:\"header\";s:7:\"Sidebar\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:8:\"bodytext\";s:34:\"<p>This is the Sidebar column.</p>\";s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:11:\"l18n_parent\";i:0;s:6:\"hidden\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	23,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(25,	13,	0,	0,	0,	'',	0,	0,	0,	0,	0,	3,	1540390946,	1540390225,	1,	0,	0,	16,	'image',	'',	'',	'',	NULL,	0,	0,	0,	0,	1,	0,	0,	1,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	2,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'a:1:{s:6:\"hidden\";N;}',	0,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(26,	13,	0,	0,	0,	'',	0,	0,	0,	0,	0,	6,	1540390984,	1540390225,	1,	0,	0,	8,	'image',	'',	'',	'',	NULL,	0,	0,	0,	0,	1,	0,	0,	1,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	2,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	25,	'a:31:{s:5:\"CType\";s:5:\"image\";s:6:\"colPos\";i:2;s:6:\"header\";s:0:\"\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:5:\"image\";i:1;s:10:\"imagewidth\";i:0;s:11:\"imageheight\";i:0;s:11:\"imageborder\";i:0;s:11:\"imageorient\";i:0;s:9:\"imagecols\";i:1;s:10:\"image_zoom\";i:0;s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:0;s:11:\"l18n_parent\";i:0;}',	25,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(27,	16,	0,	0,	0,	'',	0,	0,	0,	0,	0,	3,	1540390245,	1540390235,	1,	0,	0,	64,	'image',	'',	'',	'',	NULL,	0,	0,	0,	0,	1,	0,	0,	1,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	2,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'a:1:{s:6:\"hidden\";N;}',	0,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(28,	16,	0,	0,	0,	'',	0,	0,	0,	0,	0,	6,	1540390255,	1540390235,	1,	0,	0,	32,	'image',	'',	'',	'',	NULL,	0,	0,	0,	0,	1,	0,	0,	1,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	2,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	27,	'a:31:{s:5:\"CType\";s:5:\"image\";s:6:\"colPos\";i:2;s:6:\"header\";s:0:\"\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:5:\"image\";i:1;s:10:\"imagewidth\";i:0;s:11:\"imageheight\";i:0;s:11:\"imageborder\";i:0;s:11:\"imageorient\";i:0;s:9:\"imagecols\";i:1;s:10:\"image_zoom\";i:0;s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:0;s:11:\"l18n_parent\";i:0;}',	27,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(29,	17,	0,	0,	0,	'',	0,	0,	0,	0,	0,	9,	1540390423,	1540390385,	1,	0,	0,	256,	'text',	'Homepage',	'',	'',	'<p>This is the Content column.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'a:24:{s:5:\"CType\";N;s:6:\"colPos\";N;s:6:\"header\";N;s:13:\"header_layout\";N;s:15:\"header_position\";N;s:4:\"date\";N;s:11:\"header_link\";N;s:9:\"subheader\";N;s:8:\"bodytext\";N;s:6:\"layout\";N;s:11:\"frame_class\";N;s:18:\"space_before_class\";N;s:17:\"space_after_class\";N;s:12:\"sectionIndex\";N;s:9:\"linkToTop\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:10:\"categories\";N;s:14:\"rowDescription\";N;s:25:\"tx_gridelements_container\";N;}',	0,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(30,	17,	0,	0,	0,	'',	0,	0,	0,	0,	0,	10,	1540390437,	1540390385,	1,	0,	0,	128,	'text',	'Homepage',	'',	'',	'<p>Dies ist die Content-Spalte.</p>\r\n\r\n',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	29,	'a:25:{s:5:\"CType\";s:4:\"text\";s:6:\"colPos\";i:0;s:6:\"header\";s:8:\"Homepage\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:8:\"bodytext\";s:34:\"<p>This is the Content column.</p>\";s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:11:\"l18n_parent\";i:0;s:6:\"hidden\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	29,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(31,	18,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540391229,	1540391229,	1,	0,	0,	256,	'list',	'Search',	'',	'',	NULL,	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	NULL,	NULL,	0,	0,	0,	'',	'',	'',	0,	'0',	'indexedsearch_pi2',	1,	0,	NULL,	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'',	0,	NULL,	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(32,	18,	0,	0,	0,	'',	0,	0,	0,	0,	0,	31,	1540391261,	1540391246,	1,	0,	0,	512,	'list',	'Suche',	'',	'',	NULL,	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	0,	'',	'',	'',	0,	'0',	'indexedsearch_pi2',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	31,	'a:24:{s:5:\"CType\";s:4:\"list\";s:6:\"colPos\";i:0;s:6:\"header\";s:6:\"Search\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:9:\"list_type\";s:17:\"indexedsearch_pi2\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:11:\"l18n_parent\";i:0;s:6:\"hidden\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;}',	31,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	0,	0,	0,	0,	NULL,	0),
(33,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540554988,	1540545032,	1,	0,	0,	1536,	'gridelements_pi1',	'',	'',	'',	NULL,	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	NULL,	NULL,	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	NULL,	0,	'',	'',	0,	0,	0,	0,	'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"mdCol1\">\n                    <value index=\"vDEF\">col-md-6 d-md-block</value>\n                </field>\n                <field index=\"mdCol2\">\n                    <value index=\"vDEF\">col-md-6 d-md-block</value>\n                </field>\n                <field index=\"mdCol3\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"mdCol4\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"smallDevices\">\n            <language index=\"lDEF\">\n                <field index=\"smCol1\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"smCol2\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"smCol3\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"smCol4\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"extraSmallDevices\">\n            <language index=\"lDEF\">\n                <field index=\"xsCol1\">\n                    <value index=\"vDEF\">d-none</value>\n                </field>\n                <field index=\"xsCol2\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"xsCol3\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"xsCol4\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"largeDevices\">\n            <language index=\"lDEF\">\n                <field index=\"lgCol1\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"lgCol2\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"lgCol3\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"lgCol4\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"customClasses\">\n            <language index=\"lDEF\">\n                <field index=\"col21class\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"col22class\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"col31class\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"col32class\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"col33class\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"col41class\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"col42class\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"col43class\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"col44class\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"extralargeDevices\">\n            <language index=\"lDEF\">\n                <field index=\"xlCol1\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"xlCol2\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"xlCol3\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"xlCol4\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',	'',	0,	'',	0,	'a:27:{s:5:\"CType\";N;s:6:\"colPos\";N;s:6:\"header\";N;s:9:\"subheader\";N;s:13:\"header_layout\";N;s:15:\"header_position\";N;s:4:\"date\";N;s:11:\"header_link\";N;s:30:\"tx_gridelements_backend_layout\";N;s:11:\"pi_flexform\";N;s:24:\"tx_gridelements_children\";N;s:6:\"layout\";N;s:11:\"frame_class\";N;s:18:\"space_before_class\";N;s:17:\"space_after_class\";N;s:12:\"sectionIndex\";N;s:9:\"linkToTop\";N;s:5:\"media\";N;s:16:\"sys_language_uid\";N;s:6:\"hidden\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:8:\"fe_group\";N;s:8:\"editlock\";N;s:10:\"categories\";N;s:14:\"rowDescription\";N;s:25:\"tx_gridelements_container\";N;}',	0,	NULL,	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'2cols',	0,	0,	0,	0,	0,	NULL,	0),
(34,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540554988,	1540545061,	1,	0,	0,	2,	'text',	'',	'',	'',	'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	NULL,	NULL,	0,	0,	-1,	'',	'',	'',	0,	'0',	'',	1,	0,	NULL,	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'a:1:{s:6:\"hidden\";N;}',	0,	NULL,	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	33,	101,	0,	0,	NULL,	0),
(35,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	0,	1540554988,	1540545069,	1,	0,	0,	1,	'text',	'',	'',	'',	'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	NULL,	NULL,	0,	0,	-1,	'',	'',	'',	0,	'0',	'',	1,	0,	NULL,	0,	'',	'',	0,	0,	0,	0,	NULL,	'',	0,	'',	0,	'a:1:{s:6:\"hidden\";N;}',	0,	NULL,	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	33,	102,	0,	0,	NULL,	0),
(36,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	35,	1540548755,	1540547642,	1,	0,	0,	1,	'text',	'',	'',	'',	'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>\r\n\r\n',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	-1,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	35,	'a:26:{s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;s:5:\"CType\";s:4:\"text\";s:6:\"colPos\";i:-1;s:6:\"header\";s:0:\"\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:8:\"bodytext\";s:162:\"<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>\";s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:11:\"l18n_parent\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:33;s:23:\"tx_gridelements_columns\";i:102;}',	35,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	38,	102,	0,	0,	NULL,	0),
(37,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	34,	1540548755,	1540547642,	1,	0,	0,	2,	'text',	'',	'',	'',	'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>\r\n\r\n',	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	-1,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	NULL,	'',	0,	'',	34,	'a:26:{s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;s:5:\"CType\";s:4:\"text\";s:6:\"colPos\";i:-1;s:6:\"header\";s:0:\"\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:8:\"bodytext\";s:162:\"<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>\";s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:16:\"sys_language_uid\";i:0;s:11:\"l18n_parent\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:33;s:23:\"tx_gridelements_columns\";i:101;}',	34,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'0',	0,	38,	101,	0,	0,	NULL,	0),
(38,	1,	0,	0,	0,	'',	0,	0,	0,	0,	0,	33,	1540548755,	1540547642,	1,	0,	0,	2048,	'gridelements_pi1',	'',	'',	'',	NULL,	0,	0,	0,	0,	0,	0,	0,	2,	0,	0,	'0',	'default',	0,	0,	0,	0,	'',	'',	'',	'',	0,	0,	0,	'',	'',	'',	0,	'0',	'',	1,	0,	'',	0,	'',	'',	0,	0,	0,	1,	'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"mdCol1\">\n                    <value index=\"vDEF\">col-md-6 d-md-block</value>\n                </field>\n                <field index=\"mdCol2\">\n                    <value index=\"vDEF\">col-md-6 d-md-block</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"smallDevices\">\n            <language index=\"lDEF\">\n                <field index=\"smCol1\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"smCol2\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"extraSmallDevices\">\n            <language index=\"lDEF\">\n                <field index=\"xsCol1\">\n                    <value index=\"vDEF\">d-none</value>\n                </field>\n                <field index=\"xsCol2\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"largeDevices\">\n            <language index=\"lDEF\">\n                <field index=\"lgCol1\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"lgCol2\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"customClasses\">\n            <language index=\"lDEF\">\n                <field index=\"col21class\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"col22class\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"extralargeDevices\">\n            <language index=\"lDEF\">\n                <field index=\"xlCol1\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"xlCol2\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',	'',	0,	'',	33,	'a:28:{s:5:\"CType\";s:16:\"gridelements_pi1\";s:6:\"colPos\";i:0;s:6:\"header\";s:0:\"\";s:9:\"subheader\";s:0:\"\";s:13:\"header_layout\";s:1:\"0\";s:15:\"header_position\";s:0:\"\";s:4:\"date\";i:0;s:11:\"header_link\";s:0:\"\";s:30:\"tx_gridelements_backend_layout\";s:5:\"2cols\";s:11:\"pi_flexform\";s:2203:\"<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"mdCol1\">\n                    <value index=\"vDEF\">col-md-8 d-md-block</value>\n                </field>\n                <field index=\"mdCol2\">\n                    <value index=\"vDEF\">col-md-6 d-md-block</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"smallDevices\">\n            <language index=\"lDEF\">\n                <field index=\"smCol1\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"smCol2\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"extraSmallDevices\">\n            <language index=\"lDEF\">\n                <field index=\"xsCol1\">\n                    <value index=\"vDEF\">d-none</value>\n                </field>\n                <field index=\"xsCol2\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"largeDevices\">\n            <language index=\"lDEF\">\n                <field index=\"lgCol1\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"lgCol2\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"customClasses\">\n            <language index=\"lDEF\">\n                <field index=\"col21class\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"col22class\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"extralargeDevices\">\n            <language index=\"lDEF\">\n                <field index=\"xlCol1\">\n                    <value index=\"vDEF\"></value>\n                </field>\n                <field index=\"xlCol2\">\n                    <value index=\"vDEF\"></value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>\";s:24:\"tx_gridelements_children\";i:0;s:6:\"layout\";s:1:\"0\";s:11:\"frame_class\";s:7:\"default\";s:18:\"space_before_class\";s:0:\"\";s:17:\"space_after_class\";s:0:\"\";s:12:\"sectionIndex\";i:1;s:9:\"linkToTop\";i:0;s:5:\"media\";i:0;s:16:\"sys_language_uid\";i:0;s:6:\"hidden\";i:0;s:9:\"starttime\";i:0;s:7:\"endtime\";i:0;s:8:\"fe_group\";s:0:\"\";s:8:\"editlock\";i:0;s:10:\"categories\";i:0;s:14:\"rowDescription\";s:0:\"\";s:25:\"tx_gridelements_container\";i:0;s:11:\"l18n_parent\";i:0;}',	33,	'',	'',	'',	NULL,	124,	0,	0,	0,	NULL,	0,	-2,	'2cols',	20,	0,	0,	0,	0,	NULL,	0);

DROP TABLE IF EXISTS `tx_dce_domain_model_dce`;
CREATE TABLE `tx_dce_domain_model_dce` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fields` text COLLATE utf8_unicode_ci,
  `wizard_enable` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `wizard_category` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `wizard_description` text COLLATE utf8_unicode_ci,
  `wizard_icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `wizard_custom_icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `template_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `template_content` text COLLATE utf8_unicode_ci,
  `template_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cache_dce` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `show_access_tab` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `show_media_tab` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `show_category_tab` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hide_default_ce_wrap` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `flexform_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'LLL:EXT:dce/Resources/Private/Language/locallang_db.xml:tx_dce_domain_model_dce.flexformLabel.default',
  `use_simple_backend_view` smallint(5) unsigned NOT NULL DEFAULT '0',
  `backend_view_header` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '*dcetitle',
  `backend_view_bodytext` text COLLATE utf8_unicode_ci,
  `backend_template_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backend_template_content` text COLLATE utf8_unicode_ci,
  `backend_template_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `template_layout_root_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'EXT:dce/Resources/Private/Layouts/',
  `template_partial_root_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'EXT:dce/Resources/Private/Partials/',
  `palette_fields` text COLLATE utf8_unicode_ci,
  `enable_detailpage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `detailpage_identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `detailpage_template_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `detailpage_template` text COLLATE utf8_unicode_ci,
  `detailpage_template_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enable_container` smallint(5) unsigned NOT NULL DEFAULT '0',
  `container_item_limit` int(11) NOT NULL DEFAULT '0',
  `container_template_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `container_template` text COLLATE utf8_unicode_ci,
  `container_template_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tx_dce_domain_model_dcefield`;
CREATE TABLE `tx_dce_domain_model_dcefield` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `variable` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `configuration` text COLLATE utf8_unicode_ci,
  `map_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `new_tca_field_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `new_tca_field_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `section_fields` text COLLATE utf8_unicode_ci,
  `section_fields_tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent_dce` int(11) NOT NULL DEFAULT '0',
  `parent_field` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumblob,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l10n_parent`,`sys_language_uid`),
  KEY `parent_dce` (`parent_dce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tx_extensionmanager_domain_model_extension`;
CREATE TABLE `tx_extensionmanager_domain_model_extension` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `extension_key` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `repository` int(10) unsigned NOT NULL DEFAULT '1',
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alldownloadcounter` int(10) unsigned NOT NULL DEFAULT '0',
  `downloadcounter` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_unicode_ci,
  `state` int(11) NOT NULL DEFAULT '0',
  `review_state` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '0',
  `serialized_dependencies` mediumtext COLLATE utf8_unicode_ci,
  `author_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ownerusername` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `md5hash` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `update_comment` mediumtext COLLATE utf8_unicode_ci,
  `authorcompany` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `integer_version` int(11) NOT NULL DEFAULT '0',
  `current_version` int(11) NOT NULL DEFAULT '0',
  `lastreviewedversion` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `versionextrepo` (`extension_key`,`version`,`repository`),
  KEY `index_extrepo` (`extension_key`,`repository`),
  KEY `index_versionrepo` (`integer_version`,`repository`,`extension_key`),
  KEY `index_currentversions` (`current_version`,`review_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tx_extensionmanager_domain_model_repository`;
CREATE TABLE `tx_extensionmanager_domain_model_repository` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_unicode_ci,
  `wsdl_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mirror_list_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `extension_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tx_extensionmanager_domain_model_repository` (`uid`, `pid`, `title`, `description`, `wsdl_url`, `mirror_list_url`, `last_update`, `extension_count`) VALUES
(1,	0,	'TYPO3.org Main Repository',	'Main repository on typo3.org. This repository has some mirrors configured which are available with the mirror url.',	'https://typo3.org/wsdl/tx_ter_wsdl.php',	'https://repositories.typo3.org/mirrors.xml.gz',	1346191200,	0);

DROP TABLE IF EXISTS `tx_gridelements_backend_layout`;
CREATE TABLE `tx_gridelements_backend_layout` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` int(11) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `frame` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `horizontal` smallint(6) NOT NULL DEFAULT '0',
  `top_level_layout` smallint(6) NOT NULL DEFAULT '0',
  `config` text COLLATE utf8_unicode_ci,
  `pi_flexform_ds` mediumtext COLLATE utf8_unicode_ci,
  `pi_flexform_ds_file` text COLLATE utf8_unicode_ci,
  `icon` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`,`sorting`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tx_news_domain_model_link`;
CREATE TABLE `tx_news_domain_model_link` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumtext COLLATE utf8_unicode_ci,
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `title` tinytext COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `uri` text COLLATE utf8_unicode_ci,
  `l10n_state` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tx_news_domain_model_news`;
CREATE TABLE `tx_news_domain_model_news` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `editlock` smallint(6) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumtext COLLATE utf8_unicode_ci,
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `starttime` int(11) NOT NULL DEFAULT '0',
  `endtime` int(11) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `fe_group` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `title` tinytext COLLATE utf8_unicode_ci,
  `teaser` text COLLATE utf8_unicode_ci,
  `bodytext` mediumtext COLLATE utf8_unicode_ci,
  `datetime` int(11) NOT NULL DEFAULT '0',
  `archive` int(11) NOT NULL DEFAULT '0',
  `author` tinytext COLLATE utf8_unicode_ci,
  `author_email` tinytext COLLATE utf8_unicode_ci,
  `categories` int(11) NOT NULL DEFAULT '0',
  `related` int(11) NOT NULL DEFAULT '0',
  `related_from` int(11) NOT NULL DEFAULT '0',
  `related_files` tinytext COLLATE utf8_unicode_ci,
  `fal_related_files` int(10) unsigned DEFAULT '0',
  `related_links` tinytext COLLATE utf8_unicode_ci,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `keywords` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `tags` int(11) NOT NULL DEFAULT '0',
  `media` text COLLATE utf8_unicode_ci,
  `fal_media` int(10) unsigned DEFAULT '0',
  `internalurl` text COLLATE utf8_unicode_ci,
  `externalurl` text COLLATE utf8_unicode_ci,
  `istopnews` int(11) NOT NULL DEFAULT '0',
  `content_elements` int(11) NOT NULL DEFAULT '0',
  `path_segment` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative_title` tinytext COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `import_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `import_source` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `l10n_state` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `sys_language_uid_l10n_parent` (`sys_language_uid`,`l10n_parent`),
  KEY `import` (`import_id`,`import_source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tx_news_domain_model_news_related_mm`;
CREATE TABLE `tx_news_domain_model_news_related_mm` (
  `uid_local` int(11) NOT NULL DEFAULT '0',
  `uid_foreign` int(11) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `sorting_foreign` int(11) NOT NULL DEFAULT '0',
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tx_news_domain_model_news_tag_mm`;
CREATE TABLE `tx_news_domain_model_news_tag_mm` (
  `uid_local` int(11) NOT NULL DEFAULT '0',
  `uid_foreign` int(11) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tx_news_domain_model_news_ttcontent_mm`;
CREATE TABLE `tx_news_domain_model_news_ttcontent_mm` (
  `uid_local` int(11) NOT NULL DEFAULT '0',
  `uid_foreign` int(11) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tx_news_domain_model_tag`;
CREATE TABLE `tx_news_domain_model_tag` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tstamp` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `cruser_id` int(11) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `deleted` smallint(6) NOT NULL DEFAULT '0',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `sys_language_uid` int(11) NOT NULL DEFAULT '0',
  `l10n_parent` int(11) NOT NULL DEFAULT '0',
  `l10n_diffsource` mediumtext COLLATE utf8_unicode_ci,
  `t3ver_oid` int(11) NOT NULL DEFAULT '0',
  `t3ver_id` int(11) NOT NULL DEFAULT '0',
  `t3_origuid` int(11) NOT NULL DEFAULT '0',
  `t3ver_wsid` int(11) NOT NULL DEFAULT '0',
  `t3ver_label` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `t3ver_state` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_stage` smallint(6) NOT NULL DEFAULT '0',
  `t3ver_count` int(11) NOT NULL DEFAULT '0',
  `t3ver_tstamp` int(11) NOT NULL DEFAULT '0',
  `t3ver_move_id` int(11) NOT NULL DEFAULT '0',
  `title` tinytext COLLATE utf8_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `seo_description` text COLLATE utf8_unicode_ci,
  `seo_headline` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `seo_text` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tx_realurl_pathdata`;
CREATE TABLE `tx_realurl_pathdata` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `rootpage_id` int(11) NOT NULL DEFAULT '0',
  `mpvar` tinytext COLLATE utf8_unicode_ci,
  `pagepath` text COLLATE utf8_unicode_ci,
  `expire` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `pathq1` (`rootpage_id`,`pagepath`(32),`expire`),
  KEY `pathq2` (`page_id`,`language_id`,`rootpage_id`,`expire`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tx_realurl_uniqalias`;
CREATE TABLE `tx_realurl_uniqalias` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field_alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field_id` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value_alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value_id` int(11) NOT NULL DEFAULT '0',
  `lang` int(11) NOT NULL DEFAULT '0',
  `expire` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `tablename` (`tablename`),
  KEY `bk_realurl01` (`field_alias`(20),`field_id`,`value_id`,`lang`,`expire`),
  KEY `bk_realurl02` (`tablename`(32),`field_alias`(20),`field_id`,`value_alias`(20),`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tx_realurl_uniqalias_cache_map`;
CREATE TABLE `tx_realurl_uniqalias_cache_map` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `alias_uid` int(11) NOT NULL DEFAULT '0',
  `url_cache_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `check_existence` (`alias_uid`,`url_cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tx_realurl_urldata`;
CREATE TABLE `tx_realurl_urldata` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `rootpage_id` int(11) NOT NULL DEFAULT '0',
  `original_url` text COLLATE utf8_unicode_ci,
  `original_url_hash` int(10) unsigned NOT NULL DEFAULT '0',
  `speaking_url` text COLLATE utf8_unicode_ci,
  `speaking_url_hash` int(10) unsigned NOT NULL DEFAULT '0',
  `request_variables` text COLLATE utf8_unicode_ci,
  `expire` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`),
  KEY `pathq1` (`rootpage_id`,`original_url_hash`,`expire`),
  KEY `pathq2` (`rootpage_id`,`speaking_url_hash`,`expire`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tx_rsaauth_keys`;
CREATE TABLE `tx_rsaauth_keys` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `crdate` int(11) NOT NULL DEFAULT '0',
  `key_value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `crdate` (`crdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tx_scheduler_task`;
CREATE TABLE `tx_scheduler_task` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `disable` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `nextexecution` int(10) unsigned NOT NULL DEFAULT '0',
  `lastexecution_time` int(10) unsigned NOT NULL DEFAULT '0',
  `lastexecution_failure` text COLLATE utf8_unicode_ci,
  `lastexecution_context` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `serialized_task_object` blob,
  `serialized_executions` blob,
  `task_group` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `index_nextexecution` (`nextexecution`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tx_scheduler_task_group`;
CREATE TABLE `tx_scheduler_task_group` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tstamp` int(10) unsigned NOT NULL DEFAULT '0',
  `crdate` int(10) unsigned NOT NULL DEFAULT '0',
  `cruser_id` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sorting` int(10) unsigned NOT NULL DEFAULT '0',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupName` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- 2018-10-29 15:56:32
