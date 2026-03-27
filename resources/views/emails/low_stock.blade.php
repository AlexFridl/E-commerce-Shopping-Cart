<x-mail::message>
# Low Stock Alert

The product **{{ $productName }}** is running low in stock.

**Current stock:** {{ $stock }}

Please restock as soon as possible.

<x-mail::button :url="route('products.index')">
View Products
</x-mail::button>

Thanks,<br>
{{ config('app.name') }}
</x-mail::message>



