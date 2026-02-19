<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Cart;
use App\Models\Category;
use App\Models\Order;
class Product extends Model
{
    use HasFactory;

    public function category(){
        return $this->belongsTo(Category::class);
    }
    public function carts(){
        return $this->belongsToMany(Cart::class)
                                    ->withPivot('quantity')
                                    ->withTimestamps();
    }
    public function orders(){
        return $this->belongsToMany(Order::class);
    }


}
