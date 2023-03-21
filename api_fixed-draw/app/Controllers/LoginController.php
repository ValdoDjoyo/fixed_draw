<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\CompteModel;

class LoginController extends BaseController
{
    public function login()
    {
        $compte = new CompteModel();
        $pass = $this->request->getPost('pass');
        $data = $compte->where('pass',$pass)->first();
        if(!empty($data)){
            if($data['date_expiration'] >= date("Y-m-d")){
                return $this->response->setJSON(['etat' => 1,'msg'=>'Acces autorisé']);
            }
            else
            {
                return $this->response->setJSON(['etat' => 2,'msg'=>'Ce Pass d\'accès est expiré! Veuillez acheter un nouveau']);

            }
        }
        else
        {
            return $this->response->setJSON(['etat' => 0,'msg'=>'Ce Pass n\'est pas disponible sur nos serveurs!']);
        }
    }
}
