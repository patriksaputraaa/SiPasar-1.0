<?php

namespace App\Http\Controllers;

use App\Models\Pasar;
use App\Models\User;
use Illuminate\Http\Request;
// use Illuminate\Support\Facades\DB;
use Laravel\Lumen\Routing\Controller as BaseController;

class PasarController extends BaseController
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

    public function getlonlan()
    {
        // $data['pasar'] = DB::select("SELECT id_pasar, nama_pasar, ST_X(lonlan) as latitude, ST_Y(lonlan) as longitude FROM pasar WHERE is_aktif=?", [1]);
        // return response()->json($data);
        $pasar["pasar"] = Pasar::getLonLan();
        return response()->json($pasar);
    }

    public function getdesc($id)
    {
        // $data['pasar'] = DB::select("SELECT id_pasar, nama_pasar, kelas_pasar, alamat_pasar, kecamatan_pasar, kodepos, instagram FROM pasar WHERE id_pasar=?", [$id])[0];
        // $data['nama_lain'] = DB::select("SELECT id_pasar, nama_pasar, nama_lain FROM pasarnamalain WHERE id_pasar=?", [$id]);
        // return response()->json($data);
        $data = Pasar::getDesc($id);
        return response()->json($data);
    }

    public function getkey(Request $request)
    {
        // $key = $request->input('key');
        // $key = array_filter(explode(" ", str_replace([" , ", " ,", ", ", ".", " . ", " .", ".  "], " ", $key)));

        // $sql = "SELECT DISTINCT pas.id_pasar, pas.alamat_pasar, pas.nama_pasar, ST_X(pas.lonlan) as latitude, ST_Y(pas.lonlan) as longitude"
        //         ." FROM pasar AS pas"
        //         ." LEFT OUTER JOIN pasarnamalain AS pan ON pas.id_pasar=pan.id_pasar"
        //         ." LEFT OUTER JOIN pasarkios AS pak ON pas.id_pasar=pak.id_pasar"
        //         ." LEFT OUTER JOIN pasarkiostag AS pkt"
        //             ." INNER JOIN pasarkios AS pakk ON pakk.id_pasar_kios=pkt.id_pasar_kios"
        //             ." INNER JOIN pasartag AS patt"
        //                 ." INNER JOIN tag AS taggg ON taggg.id_tag=patt.id_tag"
        //                 ." ON patt.id_pasar_tag=pkt.id_pasar_tag"
        //             ." ON pas.id_pasar=pkt.id_pasar"
        //         ." LEFT OUTER JOIN pasartag AS pat"
        //             ." INNER JOIN tag AS tagg ON tagg.id_tag=pat.id_tag"
        //             ." ON pas.id_pasar=pat.id_pasar"
        //         ." WHERE";
        // foreach ($key as $no => $val) {
        //     if($no == 0) {
        //         $sql .= " ( (pas.nama_pasar LIKE '%".$val."%' OR tagg.tag LIKE '%".$val."%' OR pan.nama_lain LIKE '%".$val."%' OR pak.nama_kios LIKE '%".$val."%')";
        //     } else {
        //         $sql .= " OR (pas.nama_pasar LIKE '%".$val."%' OR tagg.tag LIKE '%".$val."%' OR pan.nama_lain LIKE '%".$val."%' OR pak.nama_kios LIKE '%".$val."%')";
        //     }
        // }
        // $sql .= " )";
        // $data['pasar'] = DB::select($sql);

        // $sql = "SELECT DISTINCT pak.*, tag.tag"
        //         ." FROM pasarkios AS pak"
        //         ." INNER JOIN pasarkiostag AS pkt"
        //             ." INNER JOIN pasartag AS pat"
        //                 ." INNER JOIN tag ON tag.id_tag=pat.id_tag"
        //                 ." ON pat.id_pasar_tag=pkt.id_pasar_tag"
        //             ." ON pak.id_pasar_kios=pkt.id_pasar_kios"
        //         ." WHERE";
        // foreach ($key as $no => $val) {
        //     if($no == 0) {
        //         $sql .= " pak.nama_kios LIKE '%".$val."%'";
        //     } else {
        //         $sql .= " OR pak.nama_kios LIKE '%".$val."%'";
        //     }
        // }
        // $data['kios'] = DB::select($sql);

        // $sql = "SELECT DISTINCT pat.id_pasar, tag.tag"
        //         ." FROM tag, pasartag AS pat"
        //         ." WHERE tag.id_tag=pat.id_tag";
        // foreach ($key as $no => $val) {
        //     if($no == 0) {
        //         $sql .= " AND tag.tag LIKE '%".$val."%'";
        //     } else {
        //         $sql .= " OR tag.tag LIKE '%".$val."%'";
        //     }
        // }
        // $data['tags'] = DB::select($sql);

        // return response()->json($data);

        $key = $request->input('key');
            $key = array_filter(explode(" ", str_replace([" , ", " ,", ", ", ".", " . ", " .", ".  "], " ", $key)));
            $data["pasar"] = Pasar::searchByKey($key);
            return response()->json($data);
    }
}
