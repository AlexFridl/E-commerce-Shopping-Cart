<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;
use App\Models\Cart;
use App\Models\Order;
use App\Models\Product;

class CartController extends Controller
{
    public function index(){
        $cart = Cart::with('products')
                    ->where('user_id',auth()->id())
                    ->where('status', Cart::STATUS_ACTIVE)
                    ->orderBy('id','desc')
                    ->first();

        if($cart == null){
            return redirect()->route('products.index')
                            ->with('error','You have to add product in cart.');
        }
         if($cart->status == Cart::STATUS_COMPLETED){
            $order = Order::with('user','cart')
                            ->where('cart_id',$cart->id)
                            ->where('user_id',auth()->id())
                            ->where('status',Order::STATUS_RECEIVED)
                            ->first();
            return redirect()->route('order.index', $order)
                            ->with('error', 'You have an order in progress. Please finish it first.');
        }
        else{
            return Inertia::render('Cart',[
                'products'  => $cart?->products ?? [],
                'cart_id'   => $cart->id,
            ]);

        }

    }
    public function increase_decrease (Request $request, $cart_id, $id){
        $quantity = $request->quantity;

        $cart = Cart::with('products')
                    ->where('user_id',auth()->id())
                    ->where('id',$cart_id)
                    ->where('status',Cart::STATUS_ACTIVE)
                    ->first();

        $product = $cart->products->firstWhere('id',$id);

        if($cart->products()->where('product_id',$id)->exists()){
            $cart->products()->updateExistingPivot($id,[
                'quantity' => $quantity
            ]);
            return redirect()->route('cart.index')
            ->with('success','Quantity changed successfully for '.$product->name);
        }
        else{
            return redirect()->route('cart.index')
                ->with('error', 'You cannot change cart.');
        }
    }
    public function store(Request $request){
        $order = Order::with('user','cart')
                        ->where('user_id',auth()->id())
                        ->where('status',Order::STATUS_RECEIVED)
                        ->first();

        $product_id = $request->productId;
        $quantity_cart = $request->quantity;
        $cart = Cart::with('order')
                        ->where('user_id',auth()->id())
                        ->orderByDesc('created_at')
                        ->first();
        $product = Product::where('id',$product_id)->first();

        try{
            if($order == null){
                $cart = Cart::firstOrCreate([
                    'user_id' => auth()->id(),
                    'status'  => Cart::STATUS_ACTIVE,
                ]);
                if($cart->products()->where('product_id',$product_id)->exists()){
                    if($quantity_cart < $product->stock_quantity){
                        $pivot = $cart->products()
                                        ->where('product_id',$product_id)
                                        ->first();

                        $cart->products()->updateExistingPivot($product_id,[
                            'quantity' => $pivot->pivot->quantity + $quantity_cart
                        ]);
                        return redirect()->route('products.index')
                                            ->with('success', 'You added product to cart.');
                    }
                    else{
                        return redirect()->route('products.index')
                                    ->with('success', 'There is not enough stock for that product.');

                    }
                }
                else{
                    if($quantity_cart < $product->stock_quantity){
                        $cart->products()->attach($product_id, [
                            'cart_id' => $cart->id,
                            'quantity' => $quantity_cart,
                        ]);
                        return redirect()->route('products.index')
                                        ->with('success', 'You added product to cart.');
                    }
                    else{
                        return redirect()->route('products.index')
                                        ->with('success', 'There is not enough stock for that product.');
                    }
                }
            }
            else{
                return redirect()->route('products.index')
                    ->with('error', 'You have an order in progress. Please finish it first.');
            }

        }
        catch(Exception $e){
            return $e->getMessage();
        }
    }

    public function update(Request $request,$cart_id)
    {
        $cart = Cart::with('order','products')
                        ->where('user_id', auth()->id())
                        ->where('id',$cart_id)
                        ->orderBy('id','desc')
                        ->first();

        if(!$cart){
            return redirect()->route('home')
                ->with('error', 'Cart not found.');
        }
        if($cart->order){
            $order_id = $cart->order->id;
            Order::where('id',$order_id)->delete();
        }

        $cart->status = Cart::STATUS_ACTIVE;
        $cart->save();

        return redirect()->route('cart.index',[
            'products'  => $cart?->products ?? [],
            'cart_id'   => $cart->id,
        ]);
    }
    public function destroy($cart_id){
        $cart = Cart::with('products')
                    ->where('id',$cart_id)
                    ->first();
        $cart->products()->detach();
        $cart->status = Cart::STATUS_CANCELED;
        $cart->save();
        return redirect()->route('home')
            ->with('success', 'Cart is canceled.');
    }
    public function delete_product($product_id){
        $cart = Cart::where('user_id', auth()->id())
                    ->where('status',Cart::STATUS_ACTIVE)
                    ->first();

        try{
            $cart->products()->detach($product_id);

            return redirect()->back()->with('success', 'Product from cart is deleted!');
        }
        catch(Exception $e){
            return $e->getMessage();
        }
    }
}
