<?php
$http = new swoole_http_server('127.0.0.1', 80);

$http->on('start', function ($server) {
    echo 'Swoole http server is started at http://127.0.0.1:9501' . PHP_EOL;
});


$http->on('request', function ($request, $response)  {
    $response->header('Content-Type', 'text/plain');
    $response->end('Hello World' . PHP_EOL);
});


$http->start();

