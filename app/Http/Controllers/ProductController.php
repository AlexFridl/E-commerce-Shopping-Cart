<?php

namespace App\Http\Controllers;


use App\Models\Product;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\User;

class ProductController extends Controller
{
    public function index(Request $request){
        $products = Product::with('category')
                            ->where('stock_quantity','>',0)
                            ->paginate(3);

        return Inertia::render('Products',[
            'products'  => $products,
        ]);
    }


}
