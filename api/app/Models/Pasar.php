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

    public static function getDesc($id)
    {
        $data['pasar'] = self::select('id_pasar', 'nama_pasar', 'kelas_pasar', 'alamat_pasar', 'kecamatan_pasar', 'kodepos', 'instagram')
            ->where('id_pasar', $id)
            ->first();

        $data['nama_lain'] = DB::table('pasarnamalain')
            ->select('id_pasar', 'nama_pasar', 'nama_lain')
            ->where('id_pasar', $id)
            ->get();

        return $data;
    }

    public static function searchByKey($key)
    {
        $sql = "SELECT DISTINCT pas.id_pasar, pas.alamat_pasar, pas.nama_pasar, ST_X(pas.lonlan) as latitude, ST_Y(pas.lonlan) as longitude"
            ." FROM pasar AS pas"
            ." LEFT OUTER JOIN pasarnamalain AS pan ON pas.id_pasar=pan.id_pasar"
            ." LEFT OUTER JOIN pasarkios AS pak ON pas.id_pasar=pak.id_pasar"
            ." LEFT OUTER JOIN pasarkiostag AS pkt"
                ." INNER JOIN pasarkios AS pakk ON pakk.id_pasar_kios=pkt.id_pasar_kios"
                ." INNER JOIN pasartag AS patt"
                    ." INNER JOIN tag AS taggg ON taggg.id_tag=patt.id_tag"
                    ." ON patt.id_pasar_tag=pkt.id_pasar_tag"
                ." ON pas.id_pasar=pkt.id_pasar"
            ." LEFT OUTER JOIN pasartag AS pat"
                ." INNER JOIN tag AS tagg ON tagg.id_tag=pat.id_tag"
                ." ON pas.id_pasar=pat.id_pasar"
            ." WHERE";
        foreach ($key as $no => $val) {
            if($no == 0) {
                $sql .= " ( (pas.nama_pasar LIKE '%".$val."%' OR tagg.tag LIKE '%".$val."%' OR pan.nama_lain LIKE '%".$val."%' OR pak.nama_kios LIKE '%".$val."%')";
            } else {
                $sql .= " OR (pas.nama_pasar LIKE '%".$val."%' OR tagg.tag LIKE '%".$val."%' OR pan.nama_lain LIKE '%".$val."%' OR pak.nama_kios LIKE '%".$val."%')";
            }
        }
        $sql .= " )";

        return DB::select($sql);
    }
}
