<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePasarTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pasar', function (Blueprint $table) {
            $table->bigIncrements('id_pasar');
            $table->string('nama_pasar', 100)->nullable();
            $table->integer('kelas_pasar')->nullable();
            $table->string('alamat_pasar', 255)->nullable();
            $table->string('kecamatan_pasar', 50)->nullable();
            $table->point('lonlan')->nullable();
            $table->char('kodepos', 5)->nullable();
            $table->string('instagram', 50)->nullable();
            $table->text('deskripsi_pasar')->nullable();
            $table->text('sejarah_pasar')->nullable();
            $table->integer('jumlah_pedagang')->nullable();
            $table->integer('jumlah_lantai')->nullable();
            $table->tinyInteger('is_aktif')->nullable();
            $table->tinyInteger('is_denah')->nullable();
            $table->timestamps();
        });
    }

    /*
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pasar');
    }
}
