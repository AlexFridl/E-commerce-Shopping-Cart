<script setup>
    import MainLayout from '@/Layouts/MainLayout.vue';
    import { Link } from '@inertiajs/vue3';

</script>

<template>
    <MainLayout>
        <section class="main w-full px-4 py-5 lg:px-8 sm:px-6">
            <div class="flex frex-wrap py-5">
                <div class="w-full md:w-1/3 lg:w-1/2 py-5">
                    <p class="m-0 text-gray break-words">Organic products</p>
                    <h1 class="text-gray break-words">Fresh Organic</h1>
                    <div class="border-b border-white my-4"></div>
                    <p class="text-gray break-words">Organic food is food and drinks produced by methods complying with the standards of organic farming.
                        Standards vary worldwide, but organic farming features practices cycle resources.
                    </p>
                    <Link class="bg-green-600 inline-flex items-center text-white py-2 my-3 px-4 rounded hover:bg-green-700"
                            :href="route('products.index')"
                    >
                        Shop now
                    </Link>
                </div>
            </div>
        </section>
    </MainLayout>
</template>

<style>
.main{
        background: url('img/food/m1.jpg') no-repeat; /* = background-image: url('imgs/m1.jpg'); background-repeat:  no-repeat; */
        background-size: cover;
        height: 120vh;
        width:100%;
    }
    .main h1{
        font-size: 5rem;
        font-family: 'Righteous',cursive;
    }
    .main p:nth-child(1){
        font-size: 18px;
        font-weight: 500;
        padding-top: 1 0px;
    }
    .main p:nth-child(2){
        font-size: 18px;
        color:gray;
    }
    .mbtn2{
        height: 50px;
        width: 25%;
        outline: none;
        color:rgb(20,219,20);
        border: 1px solid rgb(20,219,20);
        background-color: transparent ;
        border-radius: 50px;
        transition: all 0.4s;
    }
    .mbtn2:hover{
        background-color: rgb(20,219,20);
        color: white;
        font-weight: 400;
        border: none;
    }
    .line{
        height: 6px;
        width: 30%;
        background:rgb(20,219,20);
        display: inline-block;
    }
</style>
