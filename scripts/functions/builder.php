<?php

require_once __DIR__.'/../util.php';

echo "Building backend...";

$backendCommands = <<<CMD
cd /var/www/site &&
composer install &&
./artisan migrate
CMD;

Util::execute('webserver', $backendCommands);

echo "Building frontend";

$frontendCommands = <<<CMD
cd /var/www/site-front &&
npm install
npm run dev
CMD;


Util::runFront('nodejs', $frontendCommands);