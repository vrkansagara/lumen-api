<?php

namespace App\Http\Middleware;

use Closure;

class XClacksOverheadMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $response = $next($request);
        $response->header('X-Clacks-Overhead','GNU Terry Pratchett');
        return $response;
    }
}
