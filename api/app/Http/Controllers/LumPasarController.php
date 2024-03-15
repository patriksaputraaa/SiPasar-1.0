<?php

namespace App\Http\Controllers;

use App\Models\Pasar;
// use Illuminate\Http\Client\Request;
use Illuminate\Http\Request;
use Laravel\Lumen\Routing\Controller as BaseController;

class LumPasarController extends BaseController
{
    public function getLonLan(){
        $pasar = Pasar::getLonLan();
        return response()->json($pasar);
    }

    public function getDesc($id){
        $data = Pasar::getDesc($id);
        return response()->json($data);
    }

    public function getKey(Request $request){
        // $data = Pasar::searchByKey($request);
        $key = $request->input('key');
        $key = array_filter(explode(" ", str_replace([" , ", " ,", ", ", ".", " . ", " .", ".  "], " ", $key)));

        $data['pasar'] = Pasar::searchbykey($key);

        return response()->json($data);
    }

    
}
