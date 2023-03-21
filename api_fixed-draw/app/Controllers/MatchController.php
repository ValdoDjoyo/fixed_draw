<?php



namespace App\Controllers;



use App\Controllers\BaseController;

use App\Models\AffrontementModel;
use App\Models\CompteModel;

class MatchController extends BaseController

{

    public function index()

    {

        //

    }
    public function viewDash()

    {
        return view("dashboard");
    }
    public function viewAddVip()

    {
        return view("add_match_vip");
    }
    public function viewAddSimple()

    {
        return view("add_simple_match");
    }
    public function viewGenererPass()

    {
        return view("generer_pass");
    }
    public function viewListeMatch()

    {
        $data['match'] = $this->getMatchAfter();
        return view("liste_match",$data);
    }

    public function getMatchVip()

    {

        $match = new AffrontementModel();

        $data = $match->where("type_vip", 1)
                ->where("date", date("Y-m-d"))

            ->get()->getResult();

        return $this->response->setJSON($data);
    }

    public function getMatchSimple()
    {

        $match = new AffrontementModel();

        $data = $match->where("type_vip", 0)

            ->where("date", date("Y-m-d"))->get()->getResult();

        return $this->response->setJSON($data);
    }

    public function getMatchAfter()
    {

        $match = new AffrontementModel();

        $data = $match->findAll();

        return $data;
    }
    public function getMatchVipAfter()
    {

          $match = new AffrontementModel();
        /*$match->select("DISTINCT(date)");
        $data = $match->get()->getResult();
        $i = 0;
        foreach ($data as $row) {
            $item = $match->where('date', $row->date);
            $data[$i]->item = $item->get()->getResult();
            $i++;
        }*/
          $data = $match->where("type_vip", 1)

            ->where("date<", date("Y-m-d"))->get()->getResult();

        return $this->response->setJSON($data);
    }
    public function addMatchVip()
    {
        $match = new AffrontementModel();
        $data = [
            "domicile" => $this->request->getPost("domicile"),
            "exterieur" => $this->request->getPost("exterieur"),
            "pronostic" => $this->request->getPost("pronostic"),
            "date" => $this->request->getPost("date"),
            "type_vip" => 1
        ];
        try {
            $match->save($data);
            return redirect()->to('add_match_vip')->with('success', 'Match VIP ajouté avec success');
        } catch (\Throwable $th) {
            return redirect()->to('add_match_vip')->with('danger', $th->getMessage());
        }
    }
    public function addSimpleMatch()
    {
        $match = new AffrontementModel();
        $data = [
            "domicile" => $this->request->getPost("domicile"),
            "exterieur" => $this->request->getPost("exterieur"),
            "pronostic" => $this->request->getPost("pronostic"),
            "date" => $this->request->getPost("date"),
            "type_vip" => 0
        ];
        try {
            $match->save($data);
            return redirect()->to('add_simple_match')->with('success', 'Match ajouté avec success');
        } catch (\Throwable $th) {
            return redirect()->to('add_simple_match')->with('danger', $th->getMessage());
        }
    }
    public function activerPass()
    {
        $validite = $this->request->getPost('validite');
        $pass = $this->request->getPost('pass');
        $oldDate = date('Y-m-d');
        $date_expiration = date("Y-m-d", strtotime($oldDate.'+ '.$validite.' days'));
        $data = [
            'pass' => $pass,
            'date_expiration' => $date_expiration,
            'date_activation' =>$oldDate,
            'validite' => $validite
        ]; 
        var_dump($data);
        $compte = new CompteModel();
        $compte->save($data);
        return $data;

       // $pass = $this->genererChaineAleatoire(6);
    }
    public function genererPass($longueur = 6)
    {
        $caracteres = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $longueurMax = strlen($caracteres);
        $chaineAleatoire = '';
        for ($i = 0; $i < $longueur; $i++) {
            $chaineAleatoire .= $caracteres[rand(0, $longueurMax - 1)];
        }
        $data = $chaineAleatoire;
       // return $this->response->setJSON($chaineAleatoire);
        return $data;
    }
}
