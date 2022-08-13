<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\User;
use App\Personal;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


use Illuminate\Support\Facades\Log;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        
        return Validator::make($data, [
        /*    'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        */]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
        ]);


        $birthday = new \DateTime($data['birthday']);

        $pers = new Personal;
        $pers->user_id = $user->id;
        $pers->name = $data['fio_name'];
        $pers->surname = $data['fio_surname'];
        $pers->gender = ($data['gender'] == 'man');
        $pers->birthday = $birthday;
        $pers->profession = $data['profession'];
        $pers->phone = $data['tel'];
        $pers->national = $data['national'];
        $pers->city = $data['city'];
        $pers->portfolio = $user->id;
        $pers->info = $data['info'];
        $pers->save();

        return $user;
    }

    protected function upload(Request $request, User $user)
    {
        if($request->hasFile('uploadfile')) {
            $file_arr = $request->file('uploadfile');

            $str_file ='';
            foreach ($file_arr as $file) {
                $filename = $file->getClientOriginalName();   
                
                $file->move(public_path() . '/upload/'.$user->id, $filename);
                $str_file = $str_file . '/upload/'.$user->id . '/' . $filename . ';';
            }

            if ($str_file) {
                $pers = Personal::where('user_id', $user->id)->first();
                if ($pers) {
                    $pers->portfolio = $str_file;
                    $pers->save();
                }

            }
        }
    }
}
