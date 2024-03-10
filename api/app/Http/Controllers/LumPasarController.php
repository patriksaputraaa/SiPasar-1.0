<?php

namespace App\Http\Controllers;

use App\Models\Pasar;
// use Illuminate\Http\Client\Request;
use Illuminate\Http\Request;
use Laravel\Lumen\Routing\Controller as BaseController;

class LumPasarController extends BaseController
{
    public function index()
    {
        // Logic to retrieve all Pasar records from the database
        $pasar = Pasar::all();
        return response()->json($pasar);
    }

    public function show($id)
    {
        // Logic to retrieve a single Pasar record by ID
        $pasar = Pasar::findOrFail($id);
        return response()->json($pasar);
    }

    public function getlonlan(Request $request){
        $pasar = Pasar::getLonLan();
        return response()->json($pasar);
    }
    
}
