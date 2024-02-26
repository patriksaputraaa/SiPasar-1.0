<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class KiosController extends Controller
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

    public function getall(Request $request)
    {
        $sql = "SELECT * FROM pasarkios";
        $query = DB::select($sql);
        return response()->json($query);
    }

     
    public function getdesc($idpasar, $idlantai, $idsvg)
    {
        // $sql = "select pk.* from pasarlantai pl ".
        //     "inner join pasardenah pd on pl.id_pasarlantai = pd.id_pasarlantai ".
        //     "inner join pasarkios pk on pd.id_pasarkios = pk.id_pasar_kios ".
        //     "where pl.id_pasar = ".$idpasar." ".
        //     "and id_gedung = ".$idlantai." ".
        //     "and pd.id_svg = ".$idsvg;

        $sql = "SELECT pk.* FROM pasarkios pk ".
               "WHERE pk.lantai = ".$idlantai." ". 
               "and pk.kode_svg = '".$idsvg."' ".
               " and pk.id_pasar= ".$idpasar;
        $query = DB::select($sql);
        return response()->json($query[0]);
    }
}
