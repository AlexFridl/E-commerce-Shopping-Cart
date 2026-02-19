<script setup>
    import MainLayout from '@/Layouts/MainLayout.vue';
    import { ShoppingBagIcon } from 'lucide-vue-next';
    import { Inertia } from '@inertiajs/inertia';
    import { computed, ref } from 'vue';
    import { useForm } from '@inertiajs/vue3';

    const props = defineProps({
        products: {
            type: Array,
            required: true,
        },
        order:{
            type: Object,
            required: true,
        },
        cities: {
            type: Array,
            required: true,
        },
    })
    const quantity = {};
    const form = useForm({
        'address': '',
        'cityId': '',
        'totalPrice':null,
    });

    const selectedCity = computed ( () => {
        return props.cities.find(city => city.id == form.cityId);
    })

    const zip = computed( () => {
        return selectedCity.value ? selectedCity.value.zip : '';
    })
    props.products.forEach(product => {
        quantity[product.id] =  ref(product.pivot.quantity ?? ref(1)) ;
    });

    const totalPrice = computed(() => {
        return props.products.reduce((total, item) => {
            return total + (quantity[item.id].value * item.price)
        },0)
    })

    const resumeOrder = (id) => {
        Inertia.patch(route('cart.update',{ cart_id: id}));
    }

    const cancelOrder = (id) => {
        Inertia.delete(route('order.cancel', id));
    }
    const sendOrder = (orderId) => {
        form.totalPrice = totalPrice.value;

        form.patch(route('order.send',orderId),{
            onSuccess: () => {
                console.log('Order sent!');
            },
            onError: () => {
                console.log(form.errors);
            }

        });
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
         <div class="flex items-start pr-14 pt-4">
            <button type="button" class="p-2 ml-auto bg-green-600 text-white text-lg font-semibold
                                    rounded-lg hove:bg-green-300 focus:outline-none
                                    focus:ring-2 focus:ring-green-500 transition"
                    @click="cancelOrder(order.id)">
                Cancel Order
            </button>
        </div>
        <div class="flex gap-10">
            <div class=" max-w-3xl mx-auto bg-white my-5 p-6 rounded-xl shadow">
                <div class="flex items-center">
                    <h1 class="text-2xl font-bold mb-6">
                            <ShoppingBagIcon class="w-10 h-10 ml-4 cursor-pointer hover:text-green-500 transition"/>
                            Order
                    </h1>
                    <button type="button" class="ml-auto p-3 bg-green-600 text-white text-lg font-bold
                                            rounded-lg hove:bg-green-300 focus:outline-none
                                            focus:ring-2 focus:ring-green-500 transition"
                            @click="resumeOrder(order.cart_id)">
                        Resume Order
                    </button>
                </div>
                <!-- CART ITEMS -->
                <div v-if="products">
                    <div v-for="item in products" :key="item.id" class="my-3 w-full">

                        <div class="flex gap-24 flex-nowrap">
                            <div class="w-25 justify-center items-center bg-green-500 flex-shrink rounded text-black-800 p-3">
                                <h1 class="text-xl font-bold p-3">{{ item.name }}</h1>
                            </div>
                            <div class="w-25 border-3 flex-shrink border-color-300 p-1 pt-4 rounded ">
                                <img :src=" `/img/food/${item.image}` " :alt=" item.name "
                                class="text-m object-cover"/>
                            </div>
                            <div class="bg-white text-black-800 flex-shrink w-50 mt-3">
                                 <span class="text-base">Sum: {{ item.pivot.quantity}} * {{ item.price }}</span><br>
                                <span class="text-base"> = {{ item.pivot.quantity * item.price}} EUR</span>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="my-3">
                <!-- TOTAL -->
                <div class="flex justify-between items-center mt-6 border-t pt-4"
                    :value="totalPrice">
                    <span class="text-xl font-semibold">Total Price:</span>
                    <span class="text-xl font-bold">{{ totalPrice }} EUR</span>
                </div>
            </div>
            <!-- CONFIRM ORDER -->
            <div class="max-w-3xl w-1/3 mx-auto bg-white my-5 p-6 rounded-xl shadow">
                <h1 class="text-lg font-bold mb-6">
                    Confirm Order
                </h1>

                <form @submit.prevent="sendOrder(order.id)">
                    <div v-if="form.errors.order" class="text-red-500 mt-2">
                        {{ form.errors.order }}
                    </div>
                    <input type="text" v-model="form.address" name="tbAddress" id="tbAddress" class="w-full py-3 border border-gray-300 rounded-lg
                                            focus:outline-none focus:ring-2 focus:ring-green-500
                                            focus:border-green-500 transition mb-3"
                                            placeholder="Address"/>
                    <div v-if="form.errors.address" class="text-red-500 text-sm mb-3 mt-2">
                        {{ form.errors.address }}
                    </div>

                    <select name="ddlCity" v-model="form.cityId"
                                class="w-full py-3 border border-gray-300 rounded-lg
                                            focus:outline-none focus:ring-2 focus:ring-green-500
                                            focus:border-green-500 transition mb-3">
                        <option disabled value="">Select town</option>
                        <option v-for="city in props.cities" :key="city.id" :value="city.id">
                            {{ city.town }}
                        </option>
                    </select>
                    <div v-if="form.errors.cityId" class="text-red-500">
                        {{ form.errors.cityId }}
                    </div>

                    <input type="text" name="tbZip" id="tbZip" readonly placeholder="ZIP Code"
                                :value="zip"
                                class="w-full py-3 border border-gray-300 rounded-lg
                                focus:outline-none focus:ring-2 focus:ring-green-500
                                focus:border-green-500 transition mb-3"/>
                    <button type="submit"
                            class="w-full mt-4  bg-green-600 text-white text-lg font-bold
                                                py-3 rounded-lg hove:bg-green-300 focus:outline-none
                                                focus:ring-2 focus:ring-green-500 transition">
                        Send Order
                    </button>
                </form>


            </div>
        </div>

    </MainLayout>
</template>



