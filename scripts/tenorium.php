#!/usr/bin/env php
<?php

require "util.php";

function printHelp() {
    echo <<<EOF
build - build front and back
build-docker - build docker containers
up - start containers
down - stop containers
restart - restart containers

EOF;

}

if ($argc > 1) {
    switch ($argv[1]) {
        case 'build':
            require("functions/builder.php");
            break;
        case "build-docker":
            Util::buildContainers();
            break;
        case 'up':
            Util::upContainers();
            break;
        case 'down':
            Util::downContainers();
            break;
        case 'restart':
            Util::downContainers();
            Util::upContainers();
            break;
        case '--help':
        default:
            printHelp();
    }

    return;
}

printHelp();