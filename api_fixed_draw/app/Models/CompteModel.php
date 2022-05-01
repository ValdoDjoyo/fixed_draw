<?php

namespace App\Models;

use CodeIgniter\Model;

class CompteModel extends Model
{
    protected $DBGroup          = 'default';
    protected $table            = 'compte';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $insertID         = 0;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = [
        'pass',
        'date_activation',
        'date_expiration',
        'validite'
    ];

}
