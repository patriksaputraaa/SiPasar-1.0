<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class AdminController extends Controller
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

    public function getdashboard(Request $request)
    {
        $data['pasar'] = DB::select("SELECT id_pasar FROM pasar");
        $data['khas'] = DB::select("SELECT id_tag FROM tag");
        $data['pasar_aktif'] = DB::select("SELECT id_pasar FROM pasar WHERE is_aktif=?", [1]);
        return response()->json($data);
    }

    public function getkhas(Request $request)
    {
        $data['pasar'] = DB::select("SELECT id_pasar, nama_pasar FROM pasar");
        $data['pasar_tag'] = DB::select("SELECT pat.id_pasar_tag, pat.id_pasar, tag.tag FROM pasartag AS pat, tag WHERE tag.id_tag=pat.id_tag");
        $data['tag'] = DB::select("SELECT id_tag, tag FROM tag");
        return response()->json($data);
    }

    public function getkios(Request $request)
    {
        $data['pasar'] = DB::select("SELECT id_pasar, nama_pasar FROM pasar");
        $data['kios'] = DB::select("SELECT id_pasar_kios, id_pasar, nama_kios FROM pasarkios");
        $data['tag'] = DB::select("SELECT id_tag, tag FROM tag");
        return response()->json($data);
    }

    public function getutama(Request $request)
    {
        $data['pasar'] = DB::select("SELECT id_pasar, nama_pasar, kelas_pasar, alamat_pasar, kecamatan_pasar
                , kodepos, instagram, deskripsi_pasar, sejarah_pasar,jumlah_pedagang, jumlah_lantai
                , is_aktif, is_denah FROM pasar");
        return response()->json($data);
    }

    public function getgedung(Request $request)
    {
        $data['pasar'] = DB::select("SELECT id_pasar, nama_pasar, jumlah_lantai FROM pasar");
        $data['gedung'] = DB::select("SELECT pas.id_pasar, pas.nama_pasar, pal.id_pasar_lantai, pal.lantai, pal.nama_gedung FROM pasar AS pas, pasarlantai AS pal WHERE pas.id_pasar=pal.id_pasar");
        return response()->json($data);
    }

    public function getfoto(Request $request)
    {
        $sql = "SELECT pas.id_pasar, pas.nama_pasar, (SELECT COUNT(paf.id_pasar_foto) FROM pasarfoto AS paf WHERE paf.id_pasar=pas.id_pasar AND is_sejarah=?) AS jumlah_foto FROM pasar AS pas";
        $data['pasar'] = DB::select($sql, [0]);
        return response()->json($data);
    }

    public function getoneutama(Request $request, $id)
    {
        $data['pasar'] = DB::select("SELECT id_pasar, nama_pasar, kelas_pasar, alamat_pasar, kecamatan_pasar
                , kodepos, instagram, deskripsi_pasar, sejarah_pasar,jumlah_pedagang, jumlah_lantai
                , is_aktif, is_denah, ST_X(lonlan) as latitude, ST_Y(lonlan) as longitude FROM pasar WHERE id_pasar=?", [$id])[0];
        return response()->json($data);
    }

    public function getonefoto(Request $request, $id)
    {
        $sql = "SELECT id_pasar, nama_pasar FROM pasar WHERE id_pasar=?";
        $data['pasar'] = DB::select($sql, [$id])[0];

        $sql = "SELECT id_pasar_foto, nama_file FROM pasarfoto WHERE id_pasar=? AND is_sejarah=?";
        $data['foto'] = DB::select($sql, [$id, 0]);
        return response()->json($data);
    }

    public function getonekhas(Request $request, $id)
    {
        $sql = "SELECT tag.tag
            FROM tag, pasartag AS pat
            WHERE tag.id_tag=pat.id_tag AND pat.id_pasar=?";
        $data['pasar'] = ['id_pasar'=>$id];
        $data['tag'] = DB::select($sql, [$id]);
        return response()->json($data);
    }

    public function getonekios(Request $request, $id)
    {
        $data['kios'] = DB::select("SELECT id_pasar_kios, id_pasar, nama_kios, lokasi_kios, foto_kios FROM pasarkios WHERE id_pasar_kios=?", [$id])[0];

        $sql = "SELECT tag.tag
            FROM tag, pasartag AS pat, pasarkiostag AS pag, pasarkios AS pak
            WHERE tag.id_tag=pat.id_tag AND pag.id_pasar_tag=pat.id_pasar_tag AND pak.id_pasar_kios=pag.id_pasar_kios AND pak.id_pasar_kios=?";
        $data['tag'] = DB::select($sql, [$id]);
        return response()->json($data);
    }

    public function addkhas(Request $request)
    {
        $nama_pasar = $request->nama_pasar;
        $khas_pasar = $request->khas_pasar;

        foreach ($khas_pasar as $val) {
            $id = null;
            $exist = DB::select("SELECT * FROM tag WHERE tag=?", [$val]);
            if(empty($exist)) {
                DB::insert("INSERT INTO tag (tag) VALUES (?)", [$val]);
                $id = DB::select("SELECT MAX(id_tag) AS idnya FROM tag")[0]->idnya;
            } else{
                $id = $exist[0]->id_tag;
            }
            $exist = DB::select("SELECT * FROM pasartag WHERE id_tag=? AND id_pasar=?", [$id, $nama_pasar]);
            if(empty($exist)) {
                DB::insert("INSERT INTO pasartag (id_pasar, id_tag) VALUES (?, ?)", [$nama_pasar, $id]);
            } else {
                return response()->json("sudah ada");
            }
        }

        return response()->json("SUCCESS");
    }

    public function addkios(Request $request)
    {
        $nama_pasar = $request->nama_pasar;
        $khas_kios = $request->khas_pasar;
        $lokasi_kios = $request->lokasi_kios;
        $nama_kios = $request->nama_kios;
        $foto_extension = $request->foto_extension;

        $pasar = DB::select("SELECT * FROM pasar WHERE id_pasar=?", [$nama_pasar])[0];
        $kode_svg = strtolower(join(explode(" ", $pasar->nama_pasar)))."-".strtolower(join(explode(" ", $nama_kios)));
        $nama_foto = "";
        if(!is_null($foto_extension)){
            $nama_foto = $kode_svg.'.'.$foto_extension;
            $request->file('foto_kios')->move('fotokios/', $nama_foto);
        }

        $exist = DB::select("SELECT * FROM pasarkios WHERE id_pasar=? AND nama_kios=?", [$nama_pasar, $nama_kios]);
        if(empty($exist)) {
            DB::insert("INSERT INTO pasarkios (nama_kios, lokasi_kios, id_pasar, kode_svg, foto_kios) VALUES (?, ?, ?, ?, ?)", [$nama_kios, $lokasi_kios, $nama_pasar, $kode_svg, $nama_foto]);
            $id_kios = DB::select("SELECT MAX(id_pasar_kios) AS idnya FROM pasarkios")[0]->idnya;

            foreach ($khas_kios as $val) {
                $id = null;
                $exist = DB::select("SELECT * FROM tag WHERE tag=?", [$val]);
                if(empty($exist)) {
                    DB::insert("INSERT INTO tag (tag) VALUES (?)", [$val]);
                    $id = DB::select("SELECT MAX(id_tag) AS idnya FROM tag")[0]->idnya;
                } else{
                    $id = $exist[0]->id_tag;
                }
                $exist = DB::select("SELECT * FROM pasartag WHERE id_tag=? AND id_pasar=?", [$id, $nama_pasar]);
                if(empty($exist)) {
                    DB::insert("INSERT INTO pasartag (id_pasar, id_tag) VALUES (?, ?)", [$nama_pasar, $id]);
                    $id = DB::select("SELECT MAX(id_pasar_tag) AS idnya FROM pasartag")[0]->idnya;
                } else {
                    $id = $exist[0]->id_pasar_tag;
                }
                $exist = DB::select("SELECT * FROM pasarkiostag WHERE id_pasar_tag=? AND id_pasar=? AND id_pasar_kios=?", [$id, $nama_pasar, $id_kios]);
                if(empty($exist)) {
                    DB::insert("INSERT INTO pasarkiostag (id_pasar_tag, id_pasar, id_pasar_kios) VALUES (?, ?, ?)", [$id, $nama_pasar, $id_kios]);
                }
            }
        } else {
            return response()->json("sudah ada");
        }
        return response()->json("SUCCESS");
    }

    public function addfoto(Request $request)
    {
        $id_pasar = $request->id_pasar;
        $foto_extension = $request->foto_extension;

        $pasar = DB::select("SELECT * FROM pasar WHERE id_pasar=?", [$id_pasar])[0];
        $fotoTerakhir = DB::select('SELECT * FROM `pasarfoto` WHERE `id_pasar`=? AND `is_sejarah`=? ORDER BY `id_pasar_foto` DESC LIMIT 1;', [$id_pasar, 0]);

        if(!empty($fotoTerakhir)) {
            $fotoTerakhir = $fotoTerakhir[0];
            $nomorTerakhir = explode('.', $fotoTerakhir->nama_file)[0];
            $nomorTerakhir = explode('-', $nomorTerakhir);
            $nomorTerakhir = $nomorTerakhir[count($nomorTerakhir)-1];
            if(!is_numeric($nomorTerakhir)) {
                $nomorTerakhir = 0;
            }
            ++$nomorTerakhir;
        } else {
            $nomorTerakhir = 1;
        }

        $kode_svg = strtolower(join(explode(" ", $pasar->nama_pasar)))."-".$nomorTerakhir;
        $nama_foto = $kode_svg.'.'.$foto_extension;
        $request->file('foto_pasar')->move('fotopasar/', $nama_foto);

        DB::insert("INSERT INTO pasarfoto (id_pasar, nama_file, is_sejarah) VALUES (?, ?, ?)", [$id_pasar, $nama_foto, 0]);

        return response()->json("SUCCESS");
    }

    public function addgedung(Request $request)
    {
        $nama_pasar = $request->nama_pasar;
        $lantai_pasar = $request->lantai_pasar;
        $nama_gedung = $request->nama_gedung;

        $pasar = DB::select("SELECT * FROM pasar WHERE id_pasar=?", [$nama_pasar])[0];
        $kode_svg = strtolower(join(explode(" ", $pasar->nama_pasar)))."-".$lantai_pasar."-".strtolower(join(explode(" ", $nama_gedung)));

        $exist = DB::select("SELECT * FROM pasarlantai WHERE id_pasar=? AND lantai=? AND nama_gedung=?", [$nama_pasar, $lantai_pasar, $nama_gedung]);

        if(empty($exist)) {
            DB::insert("INSERT INTO pasarlantai (id_pasar, lantai, nama_gedung, kode_svg)
            VALUES (?, ?, ?, ?)",
            [$nama_pasar, $lantai_pasar, $nama_gedung, $kode_svg]);
        } else {
            return response()->json("sudah ada");
        }
        return response()->json("SUCCESS");
    }

    public function addutama(Request $request)
    {
        $nama_pasar = $request->nama_pasar;
        $kelas_pasar = $request->kelas_pasar;
        $alamat_pasar = $request->alamat_pasar;
        $kecamatan_pasar = $request->kecamatan_pasar;
        $kodepos_pasar = $request->kodepos_pasar;
        $instagram_pasar = $request->instagram_pasar;
        $deskripsi_pasar = $request->deskripsi_pasar;
        $sejarah_pasar = $request->sejarah_pasar;
        $jumlah_pedagang = $request->jumlah_pedagang;
        $jumlah_lantai = $request->jumlah_lantai;
        $latitude = $request->latitude;
        $longitude = $request->longitude;
        $is_aktif = $request->is_aktif;
        $is_denah = $request->is_denah;

        $exist = DB::select("SELECT * FROM pasar WHERE nama_pasar=?", [$nama_pasar]);

        if(empty($exist)) {
            DB::insert("INSERT INTO pasar (nama_pasar, kelas_pasar, alamat_pasar,
            kecamatan_pasar, kodepos, instagram, deskripsi_pasar,
            sejarah_pasar,jumlah_pedagang, jumlah_lantai, is_aktif, is_denah, lonlan)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, GeomFromText( CONCAT('POINT(', ?, ' ', ?, ')')))",
            [$nama_pasar, $kelas_pasar, $alamat_pasar, $kecamatan_pasar, $kodepos_pasar, $instagram_pasar
            ,$deskripsi_pasar, $sejarah_pasar, $jumlah_pedagang, $jumlah_lantai, $is_aktif, $is_denah, $latitude, $longitude]);

        } else {
            return response()->json("sudah ada");
        }
        return response()->json("SUCCESS");
    }

    public function editutama(Request $request)
    {
        $id_pasar = $request->id_pasar;
        $nama_pasar = $request->nama_pasar;
        $kelas_pasar = $request->kelas_pasar;
        $alamat_pasar = $request->alamat_pasar;
        $kecamatan_pasar = $request->kecamatan_pasar;
        $kodepos_pasar = $request->kodepos_pasar;
        $instagram_pasar = $request->instagram_pasar;
        $deskripsi_pasar = $request->deskripsi_pasar;
        $sejarah_pasar = $request->sejarah_pasar;
        $jumlah_pedagang = $request->jumlah_pedagang;
        $jumlah_lantai = $request->jumlah_lantai;
        $latitude = $request->latitude;
        $longitude = $request->longitude;
        $is_aktif = $request->is_aktif;
        $is_denah = $request->is_denah;

        DB::insert("UPDATE pasar SET nama_pasar=?, kelas_pasar=?, alamat_pasar=?,
        kecamatan_pasar=?, kodepos=?, instagram=?, deskripsi_pasar=?,
        sejarah_pasar=?, jumlah_pedagang=?, jumlah_lantai=?, is_aktif=?, is_denah=?, lonlan=GeomFromText( CONCAT('POINT(', ?, ' ', ?, ')'))
        WHERE id_pasar=?",
        [$nama_pasar, $kelas_pasar, $alamat_pasar, $kecamatan_pasar, $kodepos_pasar, $instagram_pasar
        ,$deskripsi_pasar, $sejarah_pasar, $jumlah_pedagang, $jumlah_lantai, $is_aktif, $is_denah, $latitude, $longitude, $id_pasar]);

        return response()->json("SUCCESS");
    }

    public function editkios(Request $request)
    {
        $id_kios = $request->id_kios;
        $nama_pasar = $request->nama_pasar;
        $khas_kios = $request->khas_pasar;
        $lokasi_kios = $request->lokasi_kios;
        $nama_kios = $request->nama_kios;
        $foto_extension = $request->foto_extension;

        $pasar = DB::select("SELECT * FROM pasar WHERE id_pasar=?", [$nama_pasar])[0];
        $kode_svg = strtolower(join(explode(" ", $pasar->nama_pasar)))."-".strtolower(join(explode(" ", $nama_kios)));
        $nama_foto="";
        if(!is_null($foto_extension)){
            $nama_foto = $kode_svg.'.'.$foto_extension;
            $request->file('foto_kios')->move('fotokios/', $nama_foto);
        }

        $sql = "SELECT pag.id_pasar_kios_tag, tag.tag, pak.id_pasar
            FROM tag, pasartag AS pat, pasarkiostag AS pag, pasarkios AS pak
            WHERE tag.id_tag=pat.id_tag AND pag.id_pasar_tag=pat.id_pasar_tag AND pak.id_pasar_kios=pag.id_pasar_kios AND pak.id_pasar_kios=?";
        $tags = DB::select($sql, [$id_kios]);

        foreach ($tags as $val) {
            $exist = false;
            foreach($khas_kios as $value) {
                if($val->tag == $value) {
                    $exist = true;
                }
            }
            if($exist == false || $nama_pasar != $val->id_pasar) {
                DB::delete("DELETE FROM pasarkiostag WHERE id_pasar_kios_tag=?", [$val->id_pasar_kios_tag]);
            }
        }

        foreach ($khas_kios as $val) {
            $id = null;
            $exist = DB::select("SELECT * FROM tag WHERE tag=?", [$val]);
            if(empty($exist)) {
                DB::insert("INSERT INTO tag (tag) VALUES (?)", [$val]);
                $id = DB::select("SELECT MAX(id_tag) AS idnya FROM tag")[0]->idnya;
            } else{
                $id = $exist[0]->id_tag;
            }
            $exist = DB::select("SELECT * FROM pasartag WHERE id_tag=? AND id_pasar=?", [$id, $nama_pasar]);
            if(empty($exist)) {
                DB::insert("INSERT INTO pasartag (id_pasar, id_tag) VALUES (?, ?)", [$nama_pasar, $id]);
                $id = DB::select("SELECT MAX(id_pasar_tag) AS idnya FROM pasartag")[0]->idnya;
            } else {
                $id = $exist[0]->id_pasar_tag;
            }
            $exist = DB::select("SELECT * FROM pasarkiostag WHERE id_pasar_tag=? AND id_pasar=? AND id_pasar_kios=?", [$id, $nama_pasar, $id_kios]);
            if(empty($exist)) {
                DB::insert("INSERT INTO pasarkiostag (id_pasar_tag, id_pasar, id_pasar_kios) VALUES (?, ?, ?)", [$id, $nama_pasar, $id_kios]);
            }
        }
        if($nama_foto!="")
            DB::update('UPDATE pasarkios SET nama_kios=?, lokasi_kios=?, id_pasar=?, kode_svg=?, foto_kios=? WHERE id_pasar_kios=?', [$nama_kios, $lokasi_kios, $nama_pasar, $kode_svg, $nama_foto, $id_kios]);
        else
            DB::update('UPDATE pasarkios SET nama_kios=?, lokasi_kios=?, id_pasar=?, kode_svg=? WHERE id_pasar_kios=?', [$nama_kios, $lokasi_kios, $nama_pasar, $kode_svg, $id_kios]);

        return response()->json("SUCCESS");
    }

    public function editkhas(Request $request)
    {
        $id_pasar = $request->id_pasar;
        $khas_pasar = $request->khas_pasar;

        $sql = "SELECT tag.tag, pat.id_pasar_tag
            FROM tag, pasartag AS pat
            WHERE tag.id_tag=pat.id_tag AND pat.id_pasar=?";
        $tags = DB::select($sql, [$id_pasar]);

        foreach ($tags as $val) {
            $exist = false;
            foreach($khas_pasar as $value) {
                if($val->tag == $value) {
                    $exist = true;
                }
            }
            if($exist == false) {
                DB::delete("DELETE FROM pasarkiostag WHERE id_pasar_tag=?", [$val->id_pasar_tag]);
                DB::delete("DELETE FROM pasartag WHERE id_pasar_tag=?", [$val->id_pasar_tag]);
            }
        }

        foreach ($khas_pasar as $val) {
            $id = null;
            $exist = DB::select("SELECT * FROM tag WHERE tag=?", [$val]);
            if(empty($exist)) {
                DB::insert("INSERT INTO tag (tag) VALUES (?)", [$val]);
                $id = DB::select("SELECT MAX(id_tag) AS idnya FROM tag")[0]->idnya;
            } else{
                $id = $exist[0]->id_tag;
            }
            $exist = DB::select("SELECT * FROM pasartag WHERE id_tag=? AND id_pasar=?", [$id, $id_pasar]);
            if(empty($exist)) {
                DB::insert("INSERT INTO pasartag (id_pasar, id_tag) VALUES (?, ?)", [$id_pasar, $id]);
            }
        }

        return response()->json("SUCCESS");
    }

    public function deletegedung(Request $request, $id)
    {
        DB::delete("DELETE FROM pasarlantai WHERE id_pasar_lantai=?", [$id]);
        return response()->json("SUCCESS");
    }

    public function deletekios(Request $request, $id)
    {
        DB::delete("DELETE FROM pasarkiostag WHERE id_pasar_kios=?", [$id]);
        DB::delete("DELETE FROM pasarkios WHERE id_pasar_kios=?", [$id]);
        return response()->json("SUCCESS");
    }

    public function deletefoto(Request $request, $id)
    {
        $sql = "SELECT * FROM pasarfoto WHERE id_pasar_foto=?";
        $data = DB::select($sql, [$id])[0];

        File::delete('fotopasar/'.$data->nama_file);

        DB::delete("DELETE FROM pasarfoto WHERE id_pasar_foto=?", [$id]);
        return response()->json("SUCCESS");
    }
}
