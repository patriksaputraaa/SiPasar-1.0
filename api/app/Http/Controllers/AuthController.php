<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class AuthController extends Controller
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

            $user = new User();

            $userGet = $user->where("username", $username)->first();

            if(!$userGet) {
                $out = [
                    "error_message" => "User tidak ditemukan"
                ];
                return response()->json($out);
            } else {
                if (Hash::check($password, $userGet->password)) {
                    $token = Str::random(40);
                    $userGet->update(['token' => $token]);
                    $out = [
                        "success_message" => [
                            'nama' => $userGet->nama,
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

        $user = new User();
        $userGet = $user->where("token", $token)->first();

        return response()->json($userGet);
    }
}
