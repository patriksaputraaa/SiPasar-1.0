<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\DB;

class Pasar extends Model
{
    use HasFactory;

    protected $table = 'pasar';
    protected $primaryKey = 'id_pasar';
    public $timestamps = true;

    protected $fillable = [
        'nama_pasar',
        'kelas_pasar',
        'alamat_pasar',
        'kecamatan_pasar',
        'lonlan',
        'kodepos',
        'instagram',
        'deskripsi_pasar',
        'sejarah_pasar',
        'jumlah_pedagang',
        'jumlah_lantai',
        'is_aktif',
        'is_denah',
    ];

    protected $casts = [
        'lonlan' => 'array',
    ];

    public static function getLonLan()
    {
        return DB::select("SELECT id_pasar, nama_pasar, ST_X(lonlan) as latitude, ST_Y(lonlan) as longitude FROM pasar WHERE is_aktif=?", [1]);
    }
}
