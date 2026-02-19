<script setup>
    import MainLayout from '@/Layouts/MainLayout.vue';
    import { Inertia } from '@inertiajs/inertia';
    import { Link } from '@inertiajs/vue3';
import { isInteger } from 'lodash';
    import { reactive } from 'vue';

    const props = defineProps({
        products: {
            type: Object,
            required: true,
        },
        category:{
            type: String,
            required:true,
        },
        category_id:{
            type: Number,
            required:true,
        }
    });
    const quantity = reactive({});
    //initialization
    props.products.data.forEach(product => {
        quantity[product.id] = 1;
    });


    const increase = (id) => {
        quantity[id]++;
    }
    const decrease = (id) =>{
        if(quantity[id] > 1) quantity[id] --;
    }

    const addToOrder = (productId) => {
        Inertia.post(`/cart/add`,{
            productId: productId,
            quantity: quantity[productId]
        })
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
        <section class="product bg-white">
            <div class="flex flex-col items-center">
                <p class="py-3">Green Agriculture</p>
                <h1 class="font-bold text-5xl"> Our Best Product</h1>
                <p class="py-3 text-center">We call it ultimate because we simpy believe every website. We call it ultimate because we
                    simply believe every website needs to be well presented at the ...
                </p>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mx-3">
                <div v-for="product in props.products.data" :key="product.id" class="border p-3 rounded shadow border-green-600">
                    <Link :href="route('category.index', {category: product.category.id })"
                            class="text-orange-500 font-semibold">
                        {{ product.category.name ?? '' }}
                    </Link>
                    <img :src="`/img/food/${ product.image }`" class="max-w-100 h-auto" alt="orange"/>
                    <h4 class=" text-xl font-medium ">{{ product.name }}</h4>
                    <p class="text-gray-800">2 x 454g / 16oz</p>
                    <h4 class="text-xl font-medium">{{ product.price }}eur</h4>
                    <div class="flex items-center gap-3">
                        <div class="flex items-center border rounded">
                            <button @click="decrease(product.id)" class="px-3 py-1">-</button>
                            <span class="px-4">{{ quantity[product.id]}}</span>
                            <button @click="increase(product.id)" class="px-3 py-1">+</button>
                        </div>
                         <button @click="addToOrder(product.id)"
                                class="h-[50px] w-1/3 block mx-auto outline:none border-0 text-white
                                    bg-green-500 rounded-[50px] transition-all duration-400 my-4
                                    hover:bg-green-600">
                             ADD TO CART
                        </button>
                    </div>
                </div>
            </div>
            <div v-if="products.total > 3" class="flex gap-2 mt-6 justify-center">
                <Link v-for="link in products.links"
                        :key="link.label"
                        :href="link.url"
                        v-html="link.label"
                        class="px-3 py-1 border rounded mb-3"
                        :class="{
                            'bg-green-500 text-white' : link.active,
                            'text-gray-400 pointer-events-none' : !link.url
                        }"
                />
            </div>
        </section>
    </MainLayout>

</template>

<style>
    /*  product*/
.product p:nth-child(1){
    font-size: 18px;
    font-weight: 500;
    padding-top: 1 0px;
}
.product p:nth-child(2){
    font-size: 18px;
    color:gray;
}
</style>
