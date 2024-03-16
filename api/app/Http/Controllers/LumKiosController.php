<?php

namespace App\Http\Controllers;
use App\Models\PasarKios;
use Laravel\Lumen\Routing\Controller as BaseController;

class LumKiosController extends BaseController
{
    public function getAll()
    {
        $query = PasarKios::getAll();
        return response()->json($query);
    }

    public function getDesc($idpasar, $idlantai, $idsvg)
    {
        $query = PasarKios::getByDescription($idpasar, $idlantai, $idsvg);
        return response()->json($query);
    }
}
