<?php

$router->get('/', function () use ($router) {
    $responseData = [
        'ack' => time(),
        'version' => $router->app->version(),
        'environment' => config('api.environment'),
    ];
    $headers = [
        'X-protection' => 1
    ];
    return response()->json($responseData)->withHeaders($headers);
});
