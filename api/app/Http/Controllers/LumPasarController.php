<?php

namespace App\Http\Controllers;

use App\Models\Pasar;
// use Illuminate\Http\Client\Request;
use Illuminate\Http\Request;
use Laravel\Lumen\Routing\Controller as BaseController;

class LumPasarController extends BaseController
{
    public function getlonlan(Request $request){
        $pasar = Pasar::getLonLan();
        return response()->json($pasar);
    }

    public function index()
    {
        $pasar = Pasar::all();
        return response()->json($pasar);
    }

    public function show($id)
    {
        $pasar = Pasar::findOrFail($id);
        return response()->json($pasar);
    }
}
