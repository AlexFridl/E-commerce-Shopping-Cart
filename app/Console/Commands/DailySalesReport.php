<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use App\Mail\DailySalesReportMail;
use App\Models\User;
class DailySalesReport extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'report:daily-sales';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send daily sales repor to admin';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        // dd(config('mail.default'),config('mail.mailers.smtp'));
        $today = Carbon::today();
        $orders = Order::with('products')
                        ->whereDate('created_at', $today)
                        ->where('status', 'sent')
                        ->get();
        $reportData = [];
        foreach($orders as $order){
            foreach($order->products as $product){
                $reportData[] = [
                    'order_id'              => $order->id,
                    'total_order_price'     => $order->total_price,
                    'product_name'          => $product->name,
                    'quantity'              => $product->pivot->quantity,
                    'price'                 => $product->price,

                ];
            }
        }
        $admin_email = User::where('name','admin')->first();
        if(!$admin_email){
            $this->error('Admin user with email not found.');
            return;
        }
        Mail::to($admin_email)
            ->queue(new DailySalesReportMail($reportData));

        $this->info('Daily sales report sent successfully.');

    }
}
