<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\AffrontementModel;

class MatchController extends BaseController
{
    public function index()
    {
        //
    }
    public function getMatchVip()
    {
        $match = new AffrontementModel();
        $data = $match->where("type_vip",1)
                ->where("date",date("Y-m-d"));
        return $this->response->setJSON($data);
    }
    public function getMatchSimple()
    {
        $match = new AffrontementModel();
        $data = $match->where("type_vip",0)
                ->where("date",date("Y-m-d"));
        return $this->response->setJSON($data);
    }
    public function getMatchAfter()
    {
        $match = new AffrontementModel();
        $data = $match->where("date < ",date("Y-m-d"));
        return $this->response->setJSON($data);
    }
}
