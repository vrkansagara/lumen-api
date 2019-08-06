<?php

$router->get('/', function () use ($router) {
    $responseData = [
        'ack' => time(),
        'version' => $router->app->version(),
    ];
    return response()->json($responseData);
});
