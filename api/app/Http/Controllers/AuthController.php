<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Laravel\Lumen\Routing\Controller as BaseController;
// use Illuminate\Support\Facades\Auth;

class AuthController extends BaseController
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

    public function login(Request $request)
    {
        $validator = $this->validate($request, [
            'username' => 'required',
            'password' => 'required|min:5',
        ]);
        if(!$validator) {
            return response()->json($validator);
        } else {
            $username = $request->username;
            $password = $request->password;

            // $user = new User();
            // $userGet = $user->where("username", $username)->first();
            $user = User::where("username", $username)->first();

            if(!$user) {//!$userGet
                $out = [
                    "error_message" => "User tidak ditemukan"
                ];
                return response()->json($out);
            } else {
                if (Hash::check($password, $user->password)) {
                    $token = Str::random(40);
                    $user->update(['token' => $token]);
                    $out = [
                        "success_message" => [
                            'nama' => $user->nama,
                            'token' => $token,
                        ]
                    ];
                    return response()->json($out);
                } else {
                    $out = [
                        "error_message" => "Username atau password salah"
                    ];
                    return response()->json($out);
                }
            }
        }
    }

    public function getuser(Request $request)
    {
        $token = $request->token;

        // $user = new User();
        // $userGet = $user->where("token", $token)->first();
        // return response()->json($userGet);
        $user = User::where("token", $token)->first();

        if (!$user) {
            return response()->json(['error_message' => 'User tidak ditemukan'], 404);
        }

        return response()->json($user);
    }
}
