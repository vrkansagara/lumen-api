<?php

$router->get('/', function () use ($router) {
    $responseData = [
        'ack' => time(),
        'version' => $router->app->version(),
    ];
    $headers = [
        'X-Powered-By' => 'Me',
        'X-protection' => 1
    ];
    return response()->json($responseData)->withHeaders($headers);
});
