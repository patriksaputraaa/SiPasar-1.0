<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Detail extends Model
{
    public static function getDetail($id)
    {
        $data['pasar'] = DB::select("SELECT id_pasar, nama_pasar, deskripsi_pasar, sejarah_pasar, ST_X(lonlan) as latitude, ST_Y(lonlan) as longitude, is_denah FROM pasar WHERE id_pasar=?", [$id])[0];
        $data['keterangan'] = DB::select('SELECT id_pasar, keterangan FROM pasarketerangan WHERE id_pasar=?', [$id]);
        $data['tag'] = DB::select('SELECT pat.id_pasar, tag.tag, pat.sumber FROM pasartag pat, tag WHERE tag.id_tag=pat.id_tag AND pat.id_pasar=?', [$id]);
        $data['kios'] = DB::select("SELECT id_pasar, nama_kios, lokasi_kios, sumber FROM pasarkios WHERE id_pasar=? LIMIT 3", [$id]);
        $data['foto'] = DB::select("SELECT nama_file FROM pasarfoto WHERE id_pasar=? and is_sejarah =0", [$id]);
        $data['fasilitas'] = DB::select("SELECT fasilitas FROM pasarfasilitas WHERE id_pasar=?", [$id]);
        $data['fotosejarah'] = DB::select("SELECT nama_file as nama_file_sejarah, caption as caption_sejarah FROM pasarfoto WHERE id_pasar=? and is_sejarah =1", [$id]);
        
        return $data;
    }
}