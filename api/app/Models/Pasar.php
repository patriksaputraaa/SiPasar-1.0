<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

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
}
