<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PasarKios extends Model
{
    protected $table = 'pasarkios';
    protected $primaryKey = 'id_pasar_kios';

    protected $fillable = [
        'nama_kios',
        'lokasi_kios',
        'gedung',
        'lantai',
        'kode_svg',
        'sumber',
        'id_pasar',
        'id_pasar_lantai',
        'nama_pasar',
        'foto_kios'
    ];

    public static function getAll()
    {
        return self::all();
    }

    public static function getByDescription($idpasar, $idlantai, $idsvg)
    {
        return self::where('id_pasar', $idpasar)
                    ->where('lantai', $idlantai)
                    ->where('kode_svg', $idsvg)
                    ->first();
    }
}
