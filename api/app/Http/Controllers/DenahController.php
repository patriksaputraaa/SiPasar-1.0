<?php

namespace App\Http\Controllers;

use App\Models\Denah;
use Laravel\Lumen\Routing\Controller as BaseController;
// use Illuminate\Http\Request;
// use Illuminate\Support\Facades\DB;

class DenahController extends BaseController
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function getdenah($idpasar, $idlantai)
    {
        // $data['pasar'] = DB::select("SELECT id_pasar, nama_pasar, is_denah, jumlah_lantai FROM pasar WHERE id_pasar='".$idpasar."'")[0];
        // return response()->json($data);
        $data['pasar'] = Denah::getPasar($idpasar);
        return response()->json($data);
    }
    
    public function getdenahgedung($idpasar, $idlantai, $gedung)
    {
        // $data['pasar'] = DB::select("SELECT id_pasar, nama_pasar, is_denah, jumlah_lantai FROM pasar WHERE id_pasar='".$idpasar."'")[0];
        // $data['kios']  = DB::select("SELECT id_pasar_kios,nama_kios,lokasi_kios,kode_svg FROM pasarkios WHERE id_pasar = ".$idpasar." AND lantai = ".$idlantai." AND gedung = '".$gedung."' ");
        // return response()->json($data);
        $data['pasar'] = Denah::getPasar($idpasar);
        $data['kios']  = Denah::getDenahGedung($idpasar, $idlantai, $gedung);
        return response()->json($data);
    }
}
