<?php
namespace Skeleton\Composer;

use Composer\Script\Event;
use Symfony\Component\Console\Formatter\OutputFormatterStyle;
use TYPO3\CMS\Saltedpasswords\Salt\SaltFactory;

class Setup {
    
    /**
     * Generates AdditionalConfiguration.php and set up database
     * 
     * @param Event $event
     */
    public static function run(Event $event) {
        if (isset($_ENV['docker'])) {
            echo self::getColoredString("Skipped App\\Composer\\Setup in Docker environment.\n", 'green');
            return;
        }
        
        if (!file_exists(__DIR__ . "/../../web/typo3conf/LocalConfiguration.php") 
                && file_exists(__DIR__ . "/../../web/typo3conf/LocalConfiguration.dist.php")) {
            echo self::getColoredString("LocalConfiguration.php was created!\n", 'green');
            copy(__DIR__ . "/../../web/typo3conf/LocalConfiguration.dist.php", __DIR__ . "/../../web/typo3conf/LocalConfiguration.php");
        } elseif (!file_exists(__DIR__ . "/../../web/typo3conf/LocalConfiguration.dist.php")) {
            echo self::getColoredString("LocalConfiguration.dist.php is missing!\n", 'green');
        }
        
        $saltFactory = SaltFactory::getSaltingInstance(null, 'BE');
        $stringConfig = "<?php\n";
        $arrConfig = array();

        if (!file_exists(__DIR__ . "/../../web/typo3conf/AdditionalConfiguration.php")) {
            $arrConfig = [];

            echo self::getColoredString("Setup System\n", 'yellow', NULL, ['underscore']);
            // ask for database name
            echo self::getColoredString("Please enter site name (default: ", 'green') . self::getColoredString("New TYPO3 Website", 'yellow') . self::getColoredString("): ", 'green');
            $strHandle = fopen("php://stdin", "r");
            echo "\n";

            $strBuffer = trim(fgets($strHandle));
            fclose($strHandle);

            if (empty($strBuffer)) {
                $arrConfig['SYS']['sitename'] = "New TYPO3 Website";
            } else {
                $arrConfig['SYS']['sitename'] = $strBuffer;
            }

            echo self::getColoredString("Setup Database\n", 'yellow', NULL, ['underscore']);
            // ask for database name
            echo self::getColoredString("Please enter database name (default: ", 'green') . self::getColoredString("imhh_typo3", 'yellow') . self::getColoredString("): ", 'green');
            $strHandle = fopen("php://stdin", "r");
            echo "\n";

            $strBuffer = trim(fgets($strHandle));
            fclose($strHandle);

            if (empty($strBuffer)) {
                $arrConfig['DB']['dbname'] = "imhh_typo3";
            } else {
                $arrConfig['DB']['dbname'] = $strBuffer;
            }

            // ask for database host
            echo self::getColoredString("Please enter database host (default: ", 'green') . self::getColoredString("127.0.0.1", 'yellow') . self::getColoredString("): ", 'green');
            $strHandle = fopen("php://stdin", "r");
            echo "\n";

            $strBuffer = trim(fgets($strHandle));
            fclose($strHandle);

            if (empty($strBuffer)) {
                $arrConfig['DB']['host'] = "127.0.0.1";
            } else {
                $arrConfig['DB']['host'] = $strBuffer;
            }

            // ask for database port
            echo self::getColoredString("Please enter database port (default: ", 'green') . self::getColoredString("3306", 'yellow') . self::getColoredString("): ", 'green');
            $strHandle = fopen("php://stdin", "r");
            echo "\n";

            $strBuffer = trim(fgets($strHandle));
            fclose($strHandle);

            if (empty($strBuffer)) {
                $arrConfig['DB']['port'] = 3306;
            } else {
                $arrConfig['DB']['port'] = (int)$strBuffer;
            }

            // ask for database user
            echo self::getColoredString("Please enter database user (default: ", 'green') . self::getColoredString("root", 'yellow') . self::getColoredString("): ", 'green');
            $strHandle = fopen("php://stdin", "r");
            echo "\n";

            $strBuffer = trim(fgets($strHandle));
            fclose($strHandle);

            if (empty($strBuffer)) {
                $arrConfig['DB']['user'] = "root";
            } else {
                $arrConfig['DB']['user'] = $strBuffer;
            }

            // ask for database password
            echo self::getColoredString("Please enter database password: ", 'green');
            $strHandle = fopen("php://stdin", "r");
            echo "\n";

            $strBuffer = trim(fgets($strHandle));
            fclose($strHandle);

            if (empty($strBuffer)) {
                $arrConfig['DB']['password'] = "";
            } else {
                $arrConfig['DB']['password'] = $strBuffer;
            }

            // ask for database user
            echo self::getColoredString("Please enter database driver (default: ", 'green') . self::getColoredString("mysqli", 'yellow') . self::getColoredString("): ", 'green');
            $strHandle = fopen("php://stdin", "r");
            echo "\n";

            $strBuffer = trim(fgets($strHandle));
            fclose($strHandle);

            if (empty($strBuffer)) {
                $arrConfig['DB']['driver'] = "mysqli";
            } else {
                $arrConfig['DB']['driver'] = $strBuffer;
            }

            // ask for database user
            echo self::getColoredString("Please enter database charset (default: ", 'green') . self::getColoredString("utf8", 'yellow') . self::getColoredString("): ", 'green');
            $strHandle = fopen("php://stdin", "r");
            echo "\n";

            $strBuffer = trim(fgets($strHandle));
            fclose($strHandle);

            if (empty($strBuffer)) {
                $arrConfig['DB']['charset'] = "utf8";
            } else {
                $arrConfig['DB']['charset'] = $strBuffer;
            }

            echo self::getColoredString("Setup Backend\n", 'yellow', NULL, ['underscore']);
            // ask for install tool password
            echo self::getColoredString("Please enter install tool password (default: ", 'green') . self::getColoredString("generate random password", 'yellow') . self::getColoredString("): ", 'green');
            $strHandle = fopen("php://stdin", "r");
            echo "\n";

            $strBuffer = trim(fgets($strHandle));
            fclose($strHandle);

            if (empty($strBuffer)) {
                $arrConfig['BE']['installToolPassword'] = self::generateCode();
                echo self::getColoredString("Auto generated install tool password: ", 'green') . self::getColoredString($arrConfig['BE']['installToolPassword'] . "\n", 'yellow');
            } else {
                $arrConfig['BE']['installToolPassword'] = $strBuffer;
            }
            
            $arrConfig['BE']['installToolPassword'] = $saltFactory->getHashedPassword($arrConfig['BE']['installToolPassword']);

            // write AdditionalConfiguration.php
            $stringConfig .= "# System Config\n";
            $stringConfig .= "\$GLOBALS['TYPO3_CONF_VARS']['SYS']['sitename'] = '" . $arrConfig['SYS']['sitename'] . "';\n";
            $stringConfig .= "\n";
            $stringConfig .= "# Backend Config\n";
            $stringConfig .= "\$GLOBALS['TYPO3_CONF_VARS']['BE']['installToolPassword'] = '" . $arrConfig['BE']['installToolPassword'] . "';\n";
            $stringConfig .= "\n";
            $stringConfig .= "# Frontend Config\n";
            $stringConfig .= "\$GLOBALS['TYPO3_CONF_VARS']['FE']['pageNotFoundOnCHashError'] = FALSE;\n";
            $stringConfig .= "\$GLOBALS['TYPO3_CONF_VARS']['FE']['hidePagesIfNotTranslatedByDefault'] = TRUE;\n";
            $stringConfig .= "\n";
            $stringConfig .= "# Database Config\n";
            $stringConfig .= "\$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['dbname'] = '" . $arrConfig['DB']['dbname'] . "';\n";
            $stringConfig .= "\$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['host'] = '" . $arrConfig['DB']['host'] . "';\n";
            $stringConfig .= "\$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['port'] = " . $arrConfig['DB']['port'] . ";\n";
            $stringConfig .= "\$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['user'] = '" . $arrConfig['DB']['user'] . "';\n";
            $stringConfig .= "\$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['password'] = '" . $arrConfig['DB']['password'] . "';\n";
            $stringConfig .= "\$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['driver'] = '" . $arrConfig['DB']['driver'] . "';\n";
            $stringConfig .= "\$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['charset'] = '" . $arrConfig['DB']['charset'] . "';\n";
            $stringConfig .= "\n";
            $stringConfig .= "# Image Processing Config\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['GFX']['processor'] = 'ImageMagick';\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['GFX']['processor_allowTemporaryMasksAsPng'] = '';\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['GFX']['processor_colorspace'] = 'sRGB';\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['GFX']['processor_effects'] = '-1';\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['GFX']['processor_enabled'] = '1';\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['GFX']['processor_path'] = '/ImageMagick-7.0.7/bin/';\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['GFX']['processor_path_lzw'] = '/ImageMagick-7.0.7/bin/';\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['GFX']['jpg_quality'] = '80';\n";
            $stringConfig .= "\n";
            $stringConfig .= "# Debuging Config\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['SYS']['displayErrors'] = '1';\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['SYS']['devIPmask'] = '*';\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['SYS']['errorHandlerErrors'] = E_ALL ^ E_NOTICE;\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['SYS']['exceptionalErrors'] = E_ALL ^ E_NOTICE ^ E_WARNING ^ E_USER_ERROR ^ E_USER_NOTICE ^ E_USER_WARNING;\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['SYS']['systemLog'] = 'error_log';\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['SYS']['systemLogLevel'] = '4';\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['SYS']['enable_errorDLOG'] = '1';\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['SYS']['enable_exceptionDLOG'] = '1';\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['SYS']['enableDeprecationLog'] = 'console';\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['SYS']['sqlDebug'] = '1';\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['EXT']['extCache'] = '1';\n";
            $stringConfig .= "//\$GLOBALS['TYPO3_CONF_VARS']['BE']['debug'] = '1';\n";
            
            file_put_contents(__DIR__ . "/../../web/typo3conf/AdditionalConfiguration.php", $stringConfig);

            static::createDatabase();
        } else {
            static::importDatabase();
        }
        
        static::setBackendUser();
    }
    
    protected static function createDatabase() {
        require_once __DIR__ . "/../../web/typo3conf/AdditionalConfiguration.php";
        $configuration = $GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default'];
        $mysql = new \mysqli($configuration['host'], $configuration['user'], $configuration['password'], '', $configuration['port']);

        if ($mysql->connect_error) {
            die("Connection failed: " . $mysql->connect_error);
        }

        $sql = "CREATE DATABASE IF NOT EXISTS `". $configuration['dbname'] . "` CHARACTER SET utf8 COLLATE utf8_general_ci;";

        if ($mysql->query($sql) === TRUE) {
            echo self::getColoredString("Database created successfully\n", 'green');
        } else {
            echo self::getColoredString("Error creating database: " . $mysql->error . "\n", 'red');
        }

        $mysql->close();

        static::importDatabase();
    }
    
    protected static function importDatabase() {
        echo self::getColoredString("Should database reset to default records (default: ", 'green') . self::getColoredString("no", 'yellow') . self::getColoredString("): ", 'green');
        $strHandle = fopen("php://stdin", "r");
        echo "\n";

        $answer = strtolower(trim(fgets($strHandle)));
        fclose($strHandle);

        if ($answer === 'y' || $answer === 'yes') {
            require_once __DIR__ . "/../../web/typo3conf/AdditionalConfiguration.php";
            $configuration = $GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default'];
        
            $mysql = new \mysqli($configuration['host'], $configuration['user'], $configuration['password'], $configuration['dbname'], $configuration['port']);

            if ($mysql->connect_error) {
                die("Connection failed: " . $mysql->connect_error);
            }

            // Temporary variable, used to store current query
            $templine = '';
            // Read in entire file
            $lines = file(__DIR__ . "/../../sql/db-dump.sql");
            // Loop through each line
            foreach ($lines as $line) {
                // Skip it if it's a comment
                if (substr($line, 0, 2) == '--' || $line == '') {
                    continue;
                }

                // Add this line to the current segment
                $templine .= $line;
                // If it has a semicolon at the end, it's the end of the query
                if (substr(trim($line), -1, 1) == ';') {
                    // Perform the query
                    $mysql->query($templine) or print('Error performing query ' . $templine . '\': ' . $mysql->error . "\n");
                    // Reset temp variable to empty
                    $templine = '';
                }
            }

            $mysql->close();
        }
    }
    
    protected static function setBackendUser() {
        require_once __DIR__ . "/../../web/typo3conf/AdditionalConfiguration.php";
        $configuration = $GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default'];
        $mysql = new \mysqli($configuration['host'], $configuration['user'], $configuration['password'], $configuration['dbname'], $configuration['port']);
        $saltFactory = SaltFactory::getSaltingInstance(null, 'BE');
        $answer = 'no';

        if ($mysql->connect_error) {
            die("Connection failed: " . $mysql->connect_error);
        }
        
        $sql = "SELECT `username`, `password` FROM `be_users`WHERE `uid` = 1;";
        $result = $mysql->query($sql);
        while ($row = $result->fetch_assoc()) {
            $user = $row;
        }
        
        if (!empty($user['password'])) {
            echo self::getColoredString("Should backend user be overwritten (default: ", 'green') . self::getColoredString("no", 'yellow') . self::getColoredString("): ", 'green');
            $strHandle = fopen("php://stdin", "r");
            echo "\n";
            $answer = strtolower(trim(fgets($strHandle)));
            fclose($strHandle);
        }
        
        if (empty($user['password']) || $answer === 'y' || $answer === 'yes') {
            echo self::getColoredString("Setup Backend User\n", 'yellow', NULL, ['underscore']);
            
            // ask for backend user name
            do {
                echo self::getColoredString("Please enter backend user name: ", 'green');
                $strHandle = fopen("php://stdin", "r");
                echo "\n";

                $username = trim(fgets($strHandle));
                fclose($strHandle);

            } while (empty($username));

            // ask for backend user password
            do {
                echo self::getColoredString("Please enter backend user password: ", 'green');
                $strHandle = fopen("php://stdin", "r");
                echo "\n";
                
                // if is OS X or Linux - hide user input
                if (preg_match('/(darwin|linux)/i', PHP_OS)) {
                    system('stty -echo');
                    $password = trim(fgets($strHandle));
                    system('stty echo');
                } else {
                    $password = trim(fgets($strHandle));
                }
                
                fclose($strHandle);

            } while (empty($password));

            $password = $saltFactory->getHashedPassword($password);

            $sql = "UPDATE `be_users` SET `username` = '" . $username . "', `password` = '" . $password . "' WHERE `uid` = 1;";

            if ($mysql->query($sql) === TRUE) {
                echo self::getColoredString("Backend user created successfully\n", 'green');
            } else {
                echo self::getColoredString("Error: " . $mysql->error . "\n", 'red');
            }
        }

        $mysql->close();
    }
    
    /**
     * Generates random code
     * 
     * @param integer $length
     * @return string
     */
    public static function generateCode($length = 18) {
        $chars = 'abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.:;_-#@';
        srand((double)microtime()*1000000);
        $i = 0;
        $code = '' ;

        while ($i <= $length) {
            $num = rand() % 70;
            $tmp = substr($chars, $num, 1);
            $code = $code . $tmp;
            $i++;
        }

        return $code;
    }
    
    public static function clearCache(Event $event) {
        require_once __DIR__ . "/../../web/typo3conf/AdditionalConfiguration.php";
        $configuration = $GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default'];
        var_dump($configuration);
        $mysql = new \mysqli($configuration['host'], $configuration['user'], $configuration['password'], $configuration['dbname'], $configuration['port']);
        $webFolder = __DIR__ . '/../../web/';

        // Clear DB Cache here
        $mysql->query("TRUNCATE be_sessions;");
        $mysql->query("TRUNCATE cache_treelist;");
        $mysql->query("TRUNCATE cf_cache_hash;");
        $mysql->query("TRUNCATE cf_cache_hash_tags;");
        $mysql->query("TRUNCATE cf_cache_imagesizes;");
        $mysql->query("TRUNCATE cf_cache_imagesizes_tags;");
        $mysql->query("TRUNCATE cf_cache_news_category;");
        $mysql->query("TRUNCATE cf_cache_news_category_tags;");
        $mysql->query("TRUNCATE cf_cache_pages;");
        $mysql->query("TRUNCATE cf_cache_pagesection;");
        $mysql->query("TRUNCATE cf_cache_pagesection_tags;");
        $mysql->query("TRUNCATE cf_cache_pages_tags;");
        $mysql->query("TRUNCATE cf_cache_rootline;");
        $mysql->query("TRUNCATE cf_cache_rootline_tags;");
        $mysql->query("TRUNCATE cf_extbase_datamapfactory_datamap;");
        $mysql->query("TRUNCATE cf_extbase_datamapfactory_datamap_tags;");
        $mysql->query("TRUNCATE cf_extbase_object;");
        $mysql->query("TRUNCATE cf_extbase_object_tags;");
        $mysql->query("TRUNCATE cf_extbase_reflection;");
        $mysql->query("TRUNCATE fe_sessions;");
        $mysql->query("TRUNCATE index_config;");
        $mysql->query("TRUNCATE index_debug;");
        $mysql->query("TRUNCATE index_fulltext;");
        $mysql->query("TRUNCATE index_grlist;");
        $mysql->query("TRUNCATE index_phash;");
        $mysql->query("TRUNCATE index_rel;");
        $mysql->query("TRUNCATE index_section;");
        $mysql->query("TRUNCATE index_stat_search;");
        $mysql->query("TRUNCATE index_stat_word;");
        $mysql->query("TRUNCATE index_words;");
        $mysql->query("TRUNCATE sys_log;");
        $mysql->query("TRUNCATE sys_file_processedfile;");
        $mysql->query("TRUNCATE sys_history;");
        $mysql->query("TRUNCATE tx_extensionmanager_domain_model_extension;");
        $mysql->query("TRUNCATE tx_realurl_pathdata;");
        $mysql->query("TRUNCATE tx_realurl_uniqalias;");
        $mysql->query("TRUNCATE tx_realurl_uniqalias_cache_map;");
        $mysql->query("TRUNCATE tx_realurl_urldata;");

        // Clear file Cache
        if ($handle = opendir($webFolder . 'typo3conf')) {
            while (false !== ($file = readdir($handle))) {
                // if file name contains "temp_CACHED_"
                if (strpos($file, 'temp_CACHED_') !== FALSE) {
                    unlink($webFolder . 'typo3conf/' . $file);
                }
            }
            closedir($handle);
        }
        
        static::removeFolderContent($webFolder . 'typo3temp');
        echo self::getColoredString("Cache cleared successfully\n", 'green');

        $mysql->close();
    }
    
    /**
     * @param string $dir path to dir
     */
    private static function removeFolderContent($dir) {
        $files = array_diff(scandir($dir), array('.', '..', '.gitkeep', 'index.html'));
        
        foreach ($files as $file) {
            (is_dir("$dir/$file")) ? static::removeFolderContent("$dir/$file") : unlink("$dir/$file");
        }
    }
    
    /**
     * Returns colored text for CLI
     * 
     * @param string $text
     * @param string $foreground
     * @param string $background
     * @param array $options
     * @return string
     */
    protected static function getColoredString($text, $foreground = NULL, $background = NULL, array $options = []) {
        // skip colors on windows operating system
        if (strpos(strtolower(php_uname()), 'windows') !== FALSE) {
            return $text;
        }
        
        $output = new OutputFormatterStyle($foreground, $background, $options);
        return $output->apply($text);
    }
}
