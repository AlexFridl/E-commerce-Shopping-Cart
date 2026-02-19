<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Order;
use App\Models\Cart;
use App\Models\City;
use PDO;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\OrderRequest;

class OrderController extends Controller
{

    public function index(Order $order){
        $city = City::all();
        return Inertia::render('Order',[
            'cities'      => $city,
            'order'     => $order,
            'products'  => $order->products,
            'quantity'  => $order->products->map(function($product){
                return [
                    'quantity'  => $product->pivot->quantity
                ];
            }),
        ]);
    }

    public function store(Cart $cart){
        // dd($cart);
        $order = Order::create(
            ['user_id' => auth()->id(),
            'status'        => Order::STATUS_RECEIVED,
            'cart_id' => $cart->id,
        ]);
        foreach( $cart->products()->get() as $product){
           $order->products()->attach($product->id,
            [
                'quantity'      => $product->pivot->quantity,
                'price'         => $product->price,
            ]);
        }
           $cart->update([
            'status' => 'completed',
        ]);

        return redirect()->route('order.index',$order);
    }

    public function send(OrderRequest $request,Order $order){
        try{
            DB::transaction(function () use ($order, $request){
                if($order->status !==  Order::STATUS_RECEIVED ){
                    throw new \Exception("You cannot resend the order.");
                }
                $order->load('products');

                foreach($order->products as $product){
                    $qty = $product->pivot->quantity;

                    if($product->stock_quantity < $qty){
                        throw new \Exception("Not enough stock of ".$product->name.".");
                    }
                    $product->decrement('stock_quantity',$qty);
                }

                if($order->status == Order::STATUS_RECEIVED){
                    $order->status = Order::STATUS_SENT;
                    $order->address = $request->address;
                    $order->city_id = $request->cityId;
                    $order->total_price = $request->totalPrice;
                    $order->save();
                }
            });
                return redirect()->route('home')
                    ->with('success', 'Order sent.');

        }
        catch(\Exception $e){
            return redirect()->back()->withErrors([
                'order' => $e->getMessage()
            ]);
        }
    }

    public function destroy(Order $order){
        $products = $order->products()->detach();

        $order->status = Order::STATUS_CANCELED;
        $order->save();
        return redirect()->route('home')
            ->with('flash',[
                'success' => 'Order is canceled.']);
    }

}
