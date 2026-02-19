<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Order;

class City extends Model
{
    use HasFactory;


    public function order(){
        return $this->hasMany(Order::class);
    }
}
