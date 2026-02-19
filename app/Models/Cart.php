<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Product;
use App\Models\Order;
class Cart extends Model
{
    use HasFactory;
    const STATUS_ACTIVE = 'active';
    const STATUS_COMPLETED = 'completed';
    const STATUS_CANCELED = 'canceled';
    protected $fillable = ['user_id', 'status'];
    public function products(){
        return $this->belongsToMany(Product::class)
                                            ->withPivot('quantity')
                                            ->withTimestamps();
    }

    public function order(){
        return $this->hasOne(Order::class);
    }
}
