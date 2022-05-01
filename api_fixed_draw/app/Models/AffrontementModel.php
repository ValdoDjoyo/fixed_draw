<?php

namespace App\Models;

use CodeIgniter\Model;

class AffrontementModel extends Model
{
    protected $DBGroup          = 'default';
    protected $table            = 'affrontement';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $insertID         = 0;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = [
        "domicile",
        "but_domicile",
        "exterieur",
        "but_exterieur",
        "date",
        "type_vip"
    ];

   
}
