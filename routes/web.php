<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\CategoryController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
//Home
Route::get('/',[HomeController::class,'index'])->name('home');
Route::get('/search/{search?}',[HomeController::class,'search'])->name('home.search');

//Product

Route::get('/products',[ProductController::class,'index'])->name('products.index');
Route::get('/category/{category?}',[CategoryController::class,'index'])->name('category.index');

Route::middleware(['auth'])->group(function(){
    //Cart
    Route::get('/cart',[CartController::class, 'index'])->name('cart.index');
    Route::post('/cart/add',[CartController::class,'store'])->name('cart.store');
    Route::patch('/cart/increase_decrease/{cart_id}/{id}',[CartController::class,'increase_decrease'])->name('cart.increase_decrease');
    Route::patch('/cart/resume/{cart_id}', [CartController::class,'update'])->name('cart.update');
    Route::delete('cart/cancel/{cart_id}',[CartController::class,'destroy'])->name('cart.cancel');
    Route::delete('cart/delete/{product_id}',[CartController::class,'delete_product'])->name('cart.delete');

//Order
    Route::get('/order/{order}',[OrderController::class,'index'])->name('order.index');
    Route::post('/order/{cart}',[OrderController::class,'store'])->name('order.store');
    Route::patch('/order/{order}/send',[OrderController::class,'send'])->name('order.send');
    Route::delete('/order/cancel/{order}',[OrderController::class,'destroy'])->name('order.cancel');

});





// Route::get('/dashboard', function () {
//     return Inertia::render('Dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

// Route::middleware('auth')->group(function () {
//     Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
//     Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
//     Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

// });

require __DIR__.'/auth.php';
