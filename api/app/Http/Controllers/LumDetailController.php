<?php

namespace App\Http\Controllers;

use App\Models\Detail;
use Laravel\Lumen\Routing\Controller as BaseController;

class LumDetailController extends BaseController
{
    public function getOne($id)
    {
        $data = Detail::getDetail($id);
        return response()->json($data);
    }
}
