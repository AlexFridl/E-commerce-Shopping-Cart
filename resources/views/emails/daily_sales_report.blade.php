@component('mail::message')
# Daily Sales Report

@foreach($reportData as $item)
    - Order #{{ $item['order_id'] }}: {{ $item['product_name'] }}
    x {{ $item['quantity'] }} @ {{ $item['price'] }} =  eur
@endforeach


Thanks,<br>
{{ config('app.name') }}

@endcomponent
