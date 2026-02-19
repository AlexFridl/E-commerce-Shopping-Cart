<?php

namespace App\Http\Controllers;

use App\Models\OrderProduct;
use App\Models\Product;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ProductController extends Controller
{
    public function index(Request $request){
        $products = Product::with('category')
                            ->paginate(3);

        return Inertia::render('Products',[
            'products'  => $products,
        ]);
    }


}
