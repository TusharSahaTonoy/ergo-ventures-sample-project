<?php

namespace App\Http\Middleware;

use Closure;

class CheckToken
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
        if( $request->method() == "POST" && $request->header('APP_KEY') != "TOKEN")
        {
            return response()->json(['mgs'=>"You are not authenticated"],401);   
        }
        return $next($request);
    }
}
