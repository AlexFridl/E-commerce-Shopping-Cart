<?php

namespace App\Providers;

use App\Models\Category;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use Inertia\Inertia;
use App\Models\Cart;
use App\Models\Order;
class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);
        Inertia::share([
            'menuCategories' => function(){
                return Category::select('id','name')->get();
            },
            'cartStatus' => function () {
                if(!auth()->check()) return null;
                return $cart_status = Cart::where('user_id',auth()->id())
                                    ->select('status')
                                    ->latest()
                                    ->first();
            },
            'hasOrder' => function () {
                if(!auth()->check()) return false;
                $cart = Cart::where('user_id', auth()->id())
                                ->latest()
                                ->first();
                if(!$cart || $cart->status == 'active') return false;
                return Order::with('products')
                            ->where('user_id',auth()->id())
                            ->where('status','recieved')
                            ->first();
            },
            'flash' => function () {
                return [
                    'success' => session('success'),
                    'error' => session('error'),
                ];
            },
        ]);
    }
}

