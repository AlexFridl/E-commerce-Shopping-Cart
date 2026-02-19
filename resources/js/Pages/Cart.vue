<script setup>
    import MainLayout from '@/Layouts/MainLayout.vue';
    import { ShoppingBagIcon } from 'lucide-vue-next';
    import { Inertia } from '@inertiajs/inertia';
    import { computed, ref } from 'vue';
    import { isInteger } from 'lodash';

    const props = defineProps({
        products: {
            type: Array,
            required: true,
        },
        cart_id: {
            type: Number,
            required: true
        },
    })
    const quantity = {};

    props.products.forEach(product => {
        quantity[product.id] =  ref(product.pivot.quantity ?? ref(1)) ;
    });
    const increase = (cart_id, id) => {
        quantity[id].value++;
        changeQuantity(cart_id, id, quantity[id].value);
    }
    const decrease = (cart_id, id) => {
        if(quantity[id].value > 1) {
            quantity[id].value--;
        }
        changeQuantity(cart_id, id, quantity[id].value);
    }
    const changeQuantity = (cart_id, id) => {
        Inertia.patch(route('cart.increase_decrease', { cart_id: cart_id, id: id }),
            { quantity: quantity[id].value  });
    }
    const totalPrice = computed(() => {
        return props.products.reduce((total, item) => {
            return total + (quantity[item.id].value * item.price)
        },0)
    })

    const removeFromCart = (id) => {
        Inertia.delete(route('cart.delete', { product_id:id }));
    }
    const proceedToOrder = (cart_id) => {
        Inertia.post(route('order.store', { cart: cart_id }))
    }
    const cancelCart = (cart_id) => {
        Inertia.delete(route('cart.cancel',cart_id));
    }

</script>
<template>
    <MainLayout>
        <div v-if="flash?.error" class="bg-red-100 text-red-700 px-4 py-2 rounded mb-4">
            {{ flash.error }}
        </div>
        <div v-if="flash?.success" class="bg-green-600 text-green-800 px-4 py-2 rounded mb-4">
            {{ flash.success }}
        </div>
        <div class="flex gap-10">
            <div class="max-w-8xl mx-auto bg-white my-5 p-6 rounded-xl shadow">
                <div class="flex items-center pr-3">
                    <h1 class="text-2xl font-bold mb-6">
                            <ShoppingBagIcon class="w-10 h-10 mt-4 ml-4 cursor-pointer hover:text-green-500 transition"/>
                            Shopping Cart
                    </h1>
                    <button type="button" class="ml-auto p-2 bg-green-600 text-white text-lg font-semibold
                                            rounded-lg hove:bg-green-300 focus:outline-none
                                            focus:ring-2 focus:ring-green-500 transition"
                            @click="cancelCart(cart_id)">
                        Cancel Cart
                    </button>
                </div>

                <!-- CART ITEMS -->
                <div v-if="products">
                    <div v-for="item in products" :key="item.id" class="my-3 w-full">
                        <div class="flex gap-24 flex-nowrap grid-cols-5 ">
                            <div class="w-2/3 justify-center items-center text-center
                                        rounded-lg text-black-800 p-2 pt-5">
                                <h1 class="text-xl font-bold">{{ item.name }}</h1>
                            </div>
                            <div class="w-50 border-3 flex-shrink border-color-300 p-1 pt-4 rounded ">
                                <img :src=" `/img/food/${item.image}` " :alt=" item.name "
                                    class="text-m w-40 h-10 object-cover "/>
                            </div>
                            <div class="w-100 flex items-center flex-shrink justify-center text-center border-1
                                        border-color-300 rounded bg-white text-black-800 mt-2">
                                <button @click="decrease(cart_id, item.id)" class="px-3 py-1">-</button>
                                <b class="shrink">Quantity: {{ quantity[item.id]}}</b>
                                <button @click="increase(cart_id, item.id)" class="px-3 py-1">+</button>
                            </div>
                            <div class="w-1/3 bg-white justify-center items-center text-black-800 flex-shrink w-50 mt-5
                             text-right">
                                <span class="text-base">Sum: {{ quantity[item.id].value}} * {{ item.price}}</span><br>
                                <span class="text-base"> {{ quantity[item.id].value * item.price}} EUR</span>
                            </div>
                            <button type="button" class="bg-green-600 inline-flex font-bold rounded-full items-center
                                                        text-white text-lg py-3 my-3 px-5 rounded-l-full hover:bg-green-700"
                                @click="removeFromCart(item.id)">
                                Remove
                            </button>
                        </div>
                    </div>
                </div>
                <p v-else> Cart is empty!</p>
                <hr class="my-3">
                <!-- TOTAL -->
                <div class="flex justify-between items-center mt-6 border-t pt-4">
                    <span class="text-xl font-semibold">Total Price:</span>
                    <span class="text-xl font-bold">{{ totalPrice }} EUR</span>
                </div>
                <div class="flex justify-center ">
                    <button type="button" class="bg-green-600 inline-flex font-bold
                            rounded-full items-center text-white text-lg py-3 my-3
                            px-5 rounded-l-full hover:bg-green-700"
                            @click="proceedToOrder(cart_id)">
                            Proceed to Order
                    </button>
                </div>
            </div>
        </div>

    </MainLayout>
</template>


<!-- const syncQuantity = (productId) => {
    Inertia.patch(route('cart.update'), {
        product_id: productId,
        quantity: quantity[productId]
    }, {
        preserveScroll: true,
        preserveState: true
    })
} -->


const decrease = (id) => {
    if (quantity[id] > 1) {
        quantity[id]--
        syncQuantity(id)
    }
}
