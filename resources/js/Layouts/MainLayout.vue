<script setup>
    import Header from '@/Components/ShopComponents/Header.vue';
    import Footer from '@/Components/ShopComponents/Footer.vue';
    import { usePage } from '@inertiajs/vue3';

    const page = usePage();

</script>
<template>

    <div>
        <Header/>
        <!-- SUCCESS -->
        <div v-if="page.props.flash.success"
            class="bg-green-100 text-green-800 font-bold p-3 rounded mb-4"
        >
            {{ page.props.flash.success }}

        </div>
        <!-- ERROR -->
        <div v-if="page.props.flash.error"
            class="bg-red-100 text-red-800 p-3 font-bold rounded mb-4"
        >
            {{ page.props.flash.error }}

        </div>
            <main class="min-h-screen">
                <slot/>
            </main>
        <Footer/>
    </div>
</template>

<style>

html{
    font-size: 16px;
}
p{
    font-family: 'Montserrat', sans-serif;
}
.nav-item a{
    text-decoration: none;
    color: black;
    font-weight: 600;
    text-transform: uppercase;
    margin-right: 15px;
    transition: all 0.4s;
    font-family: 'Montserrat', sans-serif;
}
.nav-item a:hover{
    color: rgb(20,219,20);
}
.navbar-brand{
    height: 50px;
    width: 100px;
}
.search{
    height:45px;
    outline:none;
    border: 2px solid rgb(20,219,20);
    background-color: transparent;
    border-radius: 20px 0px 0px 20px;
    border-right:none;
}
/* .search:focus{
    outline:none;
    box-shadow: none;
    border:2px solid rgb(20,219,20);
    border-right:none;
} */
.btn1{
    height: 45px;
    outline: none;
    border: none;
    background-color:  rgb(20,219,20);
    color: white;
    border-radius: 0px 20px 20px 0px;
    transition: all 0.4s;
}
.btn1:hover{
    background-color: rgb(13,172,13);
}
.bi-bag-plus{
    font-size: 30px;
    color:black;
    cursor: pointer;
    padding-top: 5px;
    transition: all 0.4s;
}
.bi-bag-plus:hover{
    color: rgb(20,219,20);
}
.navbar-toggler{
    color: black;
    font-size: 23px;
}
.navbar-toggler:focus{
    outline: none;
    box-shadow: none;
}
</style>
