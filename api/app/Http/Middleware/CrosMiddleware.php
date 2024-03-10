<?php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class CrosMiddleware {
    protected $request;
    
    public function __construct(Request $request)
    {
        $this->request = $request;
    }

	public function handle(Request $request,Closure $next) {
        $headers = [
            'Access-Control-Allow-Origin'      => '*',
            'Access-Control-Allow-Methods'     => 'HEAD, POST, GET, OPTIONS, PATCH, PUT, DELETE',
            'Access-Control-Allow-Credentials' => 'true',
            'Access-Control-Max-Age'           => '86400',
            'Access-Control-Allow-Headers'     => 'Content-Type, Authorization, X-Requested-With'
        ];

        if ($request->isMethod('OPTIONS'))
        {
            return response()->json('{"method":"OPTIONS"}', 200, $headers);
        }

        $response = $next($request);
        foreach($headers as $key => $value)
        {
            $response->headers->set($key, $value);
        }

        return $response;
	}
}
