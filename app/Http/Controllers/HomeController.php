<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use App\Models\Product;
use App\Models\Category;
class HomeController extends Controller
{
    public function index(){
        $categories = Category::get();

        return Inertia::render('Home',[
            'canLogin' => Route::has('login'),
            'canRegister' => Route::has('register'),
            'categories'    => $categories
        ]);
    }
    public function search($search){
        $products = Product::with('category')
                    ->where('name','LIKE',"%$search%")
                    ->paginate(3);

        return Inertia::render('Products',[
            'products' =>   $products,
        ]);
    }
}
