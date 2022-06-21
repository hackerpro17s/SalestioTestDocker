<?php

class Util
{
    static function execute(string $service, string $command)
    {
        self::runCommand("docker-compose -p tenorium exec $service bash -c '$command'");
    }

    static function runFront(string $service, string $command)
    {
        self::runCommand("docker-compose -p tenorium -f frontend.docker.compose.yml run $service bash -c '$command'");
    }

    static function downContainers()
    {
        self::runCommand("docker-compose -p tenorium down");
    }

    static function upContainers()
    {
        self::runCommand("docker-compose -p tenorium up -d");
    }

    static function buildContainers()
    {
        self::runCommand("docker-compose -p tenorium build");
    }

    private static function runCommand($command)
    {
        $descriptorSpec = [
            ["pipe", "r"],
            ["pipe", "w"],
            ["pipe", "w"]
        ];
        //flush();

        $process = proc_open($command, $descriptorSpec, $pipes, realpath('.'));
        if (is_resource($process)) {
            while (($stdout = fgets($pipes[1])) || ($stderr = fgets($pipes[2]))) {
                if ($stdout) {
                    print $stdout;
                    continue;
                }

                print $stderr;

                //flush();
            }
        }
    }
}