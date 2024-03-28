<?php

/** @var \Laravel\Lumen\Routing\Router $router */
use App\Models\User;
// use App\Model\Pasar;
use Illuminate\Support\Facades\Hash;

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/setuser', function () use ($router) {
    $user = new User();
    $user->username = "adminpasar";
    $user->password = Hash::make("adminpasar");
    $user->nama = "Admin Pasar";
    $user->save();
    echo "berhasil";
});
$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->group(['prefix'=>'pasar', 'middleware'=>'cros'],function() use ($router){
	$router->get('/getlonlan','PasarController@getlonlan');
    $router->get('/getdesc/{id}','PasarController@getdesc');
    $router->post('/getkey','PasarController@getkey');

    $router->get('/getpasarkios','KiosController@getAll'); //ada tambahan atribut telp dan deskripsi
    $router->get('/getpasarkiosdetail/{idpasar}/{idlantai}/{idsvg}','KiosController@getDesc');

    $router->group(['prefix'=>'detail','middleware'=>'cros'],function() use ($router){
        $router->get('/getone/{id}','DetailController@getOne');
    });

    $router->group(['prefix'=>'denah','middleware'=>'cros'],function() use ($router){
        $router->get('/getdenah/{idpasar}/{idlantai}','DenahController@getdenah');
        $router->get('/getdenahgedung/{idpasar}/{idlantai}/{gedung}','DenahController@getdenahgedung');
    });
});

$router->group(['prefix'=>'admin', 'middleware'=>'cros'],function() use ($router){
	$router->get('/getdashboard','AdminController@getdashboard');

    $router->get('/getkhas','AdminController@getkhas');
    $router->get('/getonekhas/{id}','AdminController@getonekhas');
    $router->post('/addkhas','AdminController@addkhas');
    $router->post('/editkhas','AdminController@editkhas');

    $router->get('/getkios','AdminController@getkios');
    $router->get('/getonekios/{id}','AdminController@getonekios');
    $router->post('/addkios','AdminController@addkios');
    $router->post('/editkios','AdminController@editkios');
    $router->get('/deletekios/{id}','AdminController@deletekios');//!!!

    $router->get('/getutama','AdminController@getutama');
    $router->get('/getoneutama/{id}','AdminController@getoneutama');
    $router->post('/addutama','AdminController@addutama');
    $router->post('/editutama','AdminController@editutama');

    $router->get('/getgedung','AdminController@getgedung');
    $router->post('/addgedung','AdminController@addgedung');
    $router->get('/deletegedung/{id}','AdminController@deletegedung');

    $router->get('/getfoto','AdminController@getfoto');
    $router->post('/addfoto','AdminController@addfoto');
    $router->get('/getonefoto/{id}','AdminController@getonefoto');
    $router->get('/deletefoto/{id}','AdminController@deletefoto');
});
$router->post('/login','AuthController@login');
$router->post('/getuser','AuthController@getuser');
