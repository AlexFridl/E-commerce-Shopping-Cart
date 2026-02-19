<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use Inertia\Inertia;
use App\Models\Product;

class CategoryController extends Controller
{
    public function index(Category $category){
        $products = Product::with('category')
                            ->where('category_id',$category->id)
                            ->paginate(3);


        return Inertia::render('Category',
        [
            'products' => $products,
            'category' => $category->name,
            'category_id'  => $category->id
        ]);
    }
}
