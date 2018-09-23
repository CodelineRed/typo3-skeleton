<?php
namespace Application\Composer;

use Composer\Script\Event;

class Setup {
    public static function postUpdateInstall(Event $event) {
        $arrConfig = array();

        if (!file_exists(__DIR__ . "/../../web/typo3conf/AdditionalConfiguration.php")) {
            $arrConfig['database'] = array();

            // Ask for database name
            echo "Please enter database name: ";
            $strHandle = fopen("php://stdin", "r");
            echo "\n";

            $arrConfig['database']['database'] = trim(fgets($strHandle));
            fclose($strHandle);

            // ask for database host
            echo "Please enter database host (default: \"127.0.0.1\"): ";
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
            echo "Please enter database port (default: 3306): ";
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
            echo "Please enter database user (default: \"root\"): ";
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
            echo "Please enter database password (default: \"\"): ";
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
//                    'database'      => $GLOBALS['TYPO3_CONF_VARS']['DB']['database'],
//                    'host'          => $GLOBALS['TYPO3_CONF_VARS']['DB']['host'],
//                    'port'          => $GLOBALS['TYPO3_CONF_VARS']['DB']['port'],
//                    'user'          => $GLOBALS['TYPO3_CONF_VARS']['DB']['username'],
//                    'password'      => $GLOBALS['TYPO3_CONF_VARS']['DB']['password']
//                ));
//            }
        }
    }

    protected static function createDatabase($configuration) {
        $mysql = new \mysqli($configuration['host'], $configuration['user'], $configuration['password'], '', $configuration['port']);

        if ($mysql->connect_error) {
            die("Connection failed: " . $mysql->connect_error);
        }

        $sql = "CREATE DATABASE IF NOT EXISTS `". $configuration['database'] . "` CHARACTER SET utf8 COLLATE utf8_general_ci;";

        if ($mysql->query($sql) === TRUE) {
            echo "Database created successfully";
        } else {
            echo "Error creating database: " . $mysql->error;
        }

        $mysql->close();

//        static::importDatabase($configuration);
    }

    protected static function importDatabase($configuration) {
        $mysql = new \mysqli($configuration['host'], $configuration['user'], $configuration['password'], $configuration['database'], $configuration['port']);

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
}
