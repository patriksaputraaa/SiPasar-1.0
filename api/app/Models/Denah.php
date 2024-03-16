<?php

namespace App\Models;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Denah extends Model
{
    public static function getPasar($idpasar)
    {
        return DB::select("SELECT id_pasar, nama_pasar, is_denah, jumlah_lantai FROM pasar WHERE id_pasar=?", [$idpasar])[0];
    }

    public static function getDenahGedung($idpasar, $idlantai, $gedung)
    {
        return DB::select("SELECT id_pasar_kios, nama_kios, lokasi_kios, kode_svg FROM pasarkios WHERE id_pasar = ? AND lantai = ? AND gedung = ?", [$idpasar, $idlantai, $gedung]);
    }
}
