<?php

namespace App\Controllers;

use App\Models\AdminModel;

class Home extends BaseController
{
    public function index()
    {
        return view('login');
    }
    public function login()
    {
        $email = $this->request->getPost('email');
        $password = $this->request->getPost('password');
        $admin = new AdminModel();
        $data = $admin->where('email',$email)
                        ->where('password',$password)
                        ->get()
                        ->getResult();
        if(count($data)>0)
        {
            return redirect()->to('dashboard');
        }
        else{
            return redirect()->to('/')->with('fail','login ou mot passe incorrect');
        }
    }
    public function download()
    {
        return view("download");
    }
}
