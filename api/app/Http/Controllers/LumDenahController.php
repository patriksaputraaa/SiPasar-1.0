<?php

namespace App\Http\Controllers;

// use Illuminate\Http\Request;
use App\Models\Denah;
use Laravel\Lumen\Routing\Controller as BaseController;

class LumDenahController extends BaseController
{
    public function getDenah($idpasar)
    {
        $data['pasar'] = Denah::getPasar($idpasar);
        return response()->json($data);
    }

    public function getDenahGedung($idpasar, $idlantai, $gedung)
    {
        $data['pasar'] = Denah::getPasar($idpasar);
        $data['kios']  = Denah::getDenahGedung($idpasar, $idlantai, $gedung);
        return response()->json($data);
    }
}
