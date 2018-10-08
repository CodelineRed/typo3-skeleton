<?php
namespace Skeleton\Composer;

use Composer\Script\Event;

class Setup {
    
    /**
     * Generates AdditionalConfiguration.php and set up database
     * 
     * @param Event $event
     */
    public static function run(Event $event) {
        $arrConfig = array();

        if (!file_exists(__DIR__ . "/../../web/typo3conf/AdditionalConfiguration.php")) {
            $arrConfig['database'] = array();

            // Ask for database name
            echo self::getColoredString("Please enter database name (default: ", 'green') . self::getColoredString("imhh_typo3_8", 'yellow') . self::getColoredString("): ", 'green');
            $strHandle = fopen("php://stdin", "r");
            echo "\n";

            $strDbName = trim(fgets($strHandle));
            fclose($strHandle);

            if (empty($strDbName)) {
                $arrConfig['database']['dbname'] = "imhh_typo3_8";
            } else {
                $arrConfig['database']['dbname'] = $strDbName;
            }
            fclose($strHandle);

            // ask for database host
            echo self::getColoredString("Please enter database host (default: ", 'green') . self::getColoredString("127.0.0.1", 'yellow') . self::getColoredString("): ", 'green');
            $strHandle = fopen("php://stdin", "r");
            echo "\n";

            $strHost = trim(fgets($strHandle));
            fclose($strHandle);

            if (empty($strHost)) {
                $arrConfig['database']['host'] = "127.0.0.1";
            } else {
                $arrConfig['database']['host'] = $strHost;
            }

            // ask for database port
            echo self::getColoredString("Please enter database port (default: ", 'green') . self::getColoredString("3306", 'yellow') . self::getColoredString("): ", 'green');
            $strHandle = fopen("php://stdin", "r");
            echo "\n";

            $intPort = (int)trim(fgets($strHandle));
            fclose($strHandle);

            if (empty($intPort)) {
                $arrConfig['database']['port'] = 3306;
            } else {
                $arrConfig['database']['port'] = $intPort;
            }

            // ask for database user
            echo self::getColoredString("Please enter database user (default: ", 'green') . self::getColoredString("root", 'yellow') . self::getColoredString("): ", 'green');
            $strHandle = fopen("php://stdin", "r");
            echo "\n";

            $strUser = trim(fgets($strHandle));
            fclose($strHandle);

            if (empty($strUser)) {
                $arrConfig['database']['user'] = "root";
            } else {
                $arrConfig['database']['user'] = $strUser;
            }

            // ask for database password
            echo self::getColoredString("Please enter database password: ", 'green');
            $strHandle = fopen("php://stdin", "r");
            echo "\n";

            $strPassword = trim(fgets($strHandle));
            fclose($strHandle);

            if (empty($strPassword)) {
                $arrConfig['database']['password'] = "";
            } else {
                $arrConfig['database']['password'] = $strPassword;
            }

            // write AdditionalConfiguration.php
            file_put_contents(__DIR__ . "/../../web/typo3conf/AdditionalConfiguration.php", '<?php'."\n".'$GLOBALS[\'TYPO3_CONF_VARS\'][\'DB\'][\'database\'] = "' . $arrConfig['database']['database'] . '";'."\n".'$GLOBALS[\'TYPO3_CONF_VARS\'][\'DB\'][\'host\'] = "' . $arrConfig['database']['host'] . '";'."\n".'$GLOBALS[\'TYPO3_CONF_VARS\'][\'DB\'][\'password\'] = "' . $arrConfig['database']['password'] . '";'."\n".'$GLOBALS[\'TYPO3_CONF_VARS\'][\'DB\'][\'port\'] = ' . $arrConfig['database']['port'] . ';'."\n".'$GLOBALS[\'TYPO3_CONF_VARS\'][\'DB\'][\'username\'] = "' . $arrConfig['database']['user'] . '";'."\n".'$GLOBALS[\'TYPO3_CONF_VARS\'][\'DB\'][\'socket\'] = "";'."\n");

            static::createDatabase($arrConfig['database']);
        } else {
            // ask for import
//            echo "Should the data be importet (y/n): ";
//            $strHandle = fopen("php://stdin", "r");
//            echo "\n";
//
//            $answer = trim(fgets($strHandle));
//
//            if ($answer == 'y' || $answer == 'yes' || $answer == 'Y' || $answer == 'Yes') {
//                require_once __DIR__ . "/../../web/typo3conf/AdditionalConfiguration.php";
//                static::importDatabase(array(
//                    'database'      => $GLOBALS['TYPO3_CONF_VARS']['DB']['dbname'],
//                    'host'          => $GLOBALS['TYPO3_CONF_VARS']['DB']['host'],
//                    'port'          => $GLOBALS['TYPO3_CONF_VARS']['DB']['port'],
//                    'user'          => $GLOBALS['TYPO3_CONF_VARS']['DB']['username'],
//                    'password'      => $GLOBALS['TYPO3_CONF_VARS']['DB']['password']
//                ));
//            }
        }
    }
    
    /**
     * @param array $configuration
     */
    protected static function createDatabase($configuration) {
        $mysql = new \mysqli($configuration['host'], $configuration['user'], $configuration['password'], '', $configuration['port']);

        if ($mysql->connect_error) {
            die("Connection failed: " . $mysql->connect_error);
        }

        $sql = "CREATE DATABASE IF NOT EXISTS `". $configuration['dbname'] . "` CHARACTER SET utf8 COLLATE utf8_general_ci;";

        if ($mysql->query($sql) === TRUE) {
            self::getColoredString("Database created successfully\n", 'green');
        } else {
            echo self::getColoredString("Error creating database: " . $mysql->error . "\n", 'red');
        }

        $mysql->close();

//        static::importDatabase($configuration);
    }
    
    /**
     * @param array $configuration
     */
    protected static function importDatabase($configuration) {
        $mysql = new \mysqli($configuration['host'], $configuration['user'], $configuration['password'], $configuration['dbname'], $configuration['port']);

        if ($mysql->connect_error) {
            die("Connection failed: " . $mysql->connect_error);
        }

        // Temporary variable, used to store current query
        $templine = '';
        // Read in entire file
        $lines = file(__DIR__ . "/../dump.sql");
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
    
    /**
     * Returns colored text for CLI
     * 
     * @param string $string
     * @param string $foregroundColor
     * @param string $backgroundColor
     * @return string
     */
    protected static function getColoredString($string, $foregroundColor = null, $backgroundColor = null) {
        $foregroundColors = [
            'default' => '0',
            'black' => '0;30',
            'dark_gray' => '1;30',
            'blue' => '0;34',
            'light_blue' => '1;34',
            'green' => '0;32',
            'light_green' => '1;32',
            'cyan' => '0;36',
            'light_cyan' => '1;36',
            'red' => '0;31',
            'light_red' => '1;31',
            'purple' => '0;35',
            'light_purple' => '1;35',
            'brown' => '0;33',
            'yellow' => '0;33',
            'light_gray' => '0;37',
            'white' => '1;37',
        ];
        
        $backgroundColors = [
            'black' => '40',
            'red' => '41',
            'green' => '42',
            'yellow' => '43',
            'blue' => '44',
            'magenta' => '45',
            'cyan' => '46',
            'light_gray' => '47'
        ];

        $coloredString = "";

        // if given foreground color exists
        if (isset($foregroundColors[$foregroundColor])) {
            $coloredString .= "\033[" . $foregroundColors[$foregroundColor] . "m";
        }
        // if given background color exists
        if (isset($backgroundColors[$backgroundColor])) {
            $coloredString .= "\033[" . $backgroundColors[$backgroundColor] . "m";
        }

        // set default color at the end
        $coloredString .= $string . "\033[0m";

        return $coloredString;
    }
}
