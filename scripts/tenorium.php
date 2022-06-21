#!/usr/bin/env php
<?php

require "util.php";

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
    }
}