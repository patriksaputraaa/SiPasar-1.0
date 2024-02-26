<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DenahController extends Controller
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
        $data['pasar'] = DB::select("SELECT id_pasar, nama_pasar, is_denah, jumlah_lantai FROM pasar WHERE id_pasar='".$idpasar."'")[0];
        return response()->json($data);
    }
    public function getdenahGedung($idpasar, $idlantai, $gedung)
    {
        $data['pasar'] = DB::select("SELECT id_pasar, nama_pasar, is_denah, jumlah_lantai FROM pasar WHERE id_pasar='".$idpasar."'")[0];
        $data['kios']  = DB::select("SELECT id_pasar_kios,nama_kios,lokasi_kios,kode_svg FROM pasarkios WHERE id_pasar = ".$idpasar." AND lantai = ".$idlantai." AND gedung = '".$gedung."' ");
        return response()->json($data);
    }
}
