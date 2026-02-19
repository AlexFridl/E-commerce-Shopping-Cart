<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\Product;
use App\Models\Cart;
use App\Models\City;


class Order extends Model
{
    use HasFactory;
    const STATUS_RECEIVED = 'recieved';
    const STATUS_SENT = 'sent';
    const STATUS_CANCELED = 'canceled';
    protected $fillable = ['user_id','address','city_id','total_price','status','cart_id'];
    public function user(){
        return $this->belongsTo(User::class);
    }

    public function products(){
        return $this->belongsToMany(Product::class)
                    ->withPivot('quantity','price')
                    ->withTimestamps();
    }

    public function cart(){
        return $this->belongsTo(Cart::class);
    }

    public function city(){
        return $this->belongsTo(City::class);
    }
}
