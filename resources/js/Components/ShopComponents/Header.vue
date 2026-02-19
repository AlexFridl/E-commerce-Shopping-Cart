<script setup>
    import { computed } from 'vue';
    import { Link } from '@inertiajs/vue3';
    import NavLink from '@/Components/NavLink.vue';
    import { ShoppingBagIcon } from 'lucide-vue-next';
    import { Inertia } from '@inertiajs/inertia';
    import { ref } from 'vue';
    import { usePage } from '@inertiajs/vue3';

    //Category menu
    const page = usePage();
    const menuCategories = page.props.menuCategories;
    const isOpen = ref(false);

    const search = ref('');
    const searchProducts = () => {
        Inertia.get(route('home.search',{
            search: search.value
        }),{
            preserveState: true,
            replace: true
        })
    };

    const linkRoute = computed( () => {
        const status = page.props.cartStatus?.status;
        const orderId = page.props.hasOrder?.id;
        if(!page.props.auth?.user){
            return route('login');
        }
        if(status === 'active'){
            return route('cart.index');
        }
        if(status === 'completed' && orderId){
            return route('order.index',{order:orderId});
        }
        return route('home');
    })


</script>

<template>
    <!-- {{ props.categories }} -->
    <header class="bg-white border-b">
        <div class="max-w-7xa mx-auto px-6">
            <nav class="flex items-center h-20 bg-white pb-4">
                <!-- Logo -->
                <NavLink :href="route('home')" class="flex items-center mt-4">
                        <img src="/img/school/logoo.png" alt="logoo" class="h-12 w-auto">
                </NavLink>
                <!-- End Logo -->

                <!-- Hamburger -->
                <button
                    id="menuBtn"
                    class="lg:hidden text-2xl text-black focus:outline-none ml-auto"
                    aria-label="Toggle navigation"
                >
                    <i class="bi bi-list"></i>
                </button>

                <!-- Menu -->
                <div
                    id="menu"
                    class=" hidden ml-auto lg:flex lg:items-center lg:space-x-6 w-full lg:w-auto"
                >
                    <!-- Links -->
                     <nav class="flex flex-col lg:flex-row lg:items-center lg:space-x-6 mt-4" >
                        <NavLink
                            class="uppercase font-semibold text-black hover:text-green-500 transition"
                            :href="route('home')"
                            :active="route().current('home')"
                        >
                            Home
                        </NavLink>
                        <NavLink
                            class="uppercase font-semibold text-black hover:text-green-500 transition"
                            :href="route('products.index')"
                            :active="route().current('products.index')"
                        >
                            Shop
                        </NavLink>
                        <button @click = "isOpen = !isOpen"
                            class="inline-flex items-center px-1 pt-1 text-sm font-medium hover:underline
                                underline-offset-4 decoration-2
                                hover:decoration-gray-400 hover:border-gray-500 transition
                                uppercase  focus:border-bottom-gray
                                focus:outline-none">
                            Category
                        </button>
                        <div v-if="isOpen">
                            <NavLink
                                v-for="category in menuCategories" :key="category.id"
                                class="uppercase font-semibold text-black hover:font-bold hover:text-gray-700 transation"
                                :href="route('category.index',{category: category.id})"
                                :active="route().current('category.index')"
                                @click="isOpen = false"
                            >
                                {{ category.name }}
                            </NavLink>
                        </div>
                        <NavLink v-if="!$page.props.auth.user"
                            class="uppercase font-semibold text-black hover:text-green-500 transition"
                            :href="route('login')"
                            :active="route().current('login')"
                        >
                            Login
                        </NavLink>
                        <NavLink v-if="!$page.props.auth.user"
                            class="uppercase font-semibold text-black hover:text-green-500 transition"
                            :href="route('register')"
                            :active="route().current('register')"
                        >
                            Register
                        </NavLink>
                        <NavLink v-if="$page.props.auth.user"
                            class="uppercase font-semibold text-black hover:text-green-500 transition"
                            :href="route('logout')"
                            :active="route().current('logout')"
                            method="post"
                            as="button">
                            Logout
                        </NavLink>
                    </nav>

                    <div class="mt-4" v-if="$page.props.auth.user">
                        <span class="font-semibold p-2 rounded text-white text-center bg-green-600 ">
                            Welcome {{ $page.props.auth.user.name }}</span>
                    </div>

                    <!-- Search -->
                    <form class="flex items-center mt-4 lg:mt-0" @submit.prevent="searchProducts">

                        <input
                            type="search"
                            v-model="search"
                            placeholder="Search"
                            class="h-[45px] px-3 border-2 border-green-500 rounded-l-full outline-none bg-transparent"
                        >
                        <button
                            type="submit"
                            class="h-[45px] px-6 bg-green-500 text-white rounded-r-full hover:bg-green-600 transition"
                        >
                            Search
                        </button>

                     </form>
                    <Link v-if="$page.props.auth"
                            :href="linkRoute">
                        <ShoppingBagIcon class="w-7 h-7 mt-4  cursor-pointer hover:text-green-500 transition"/>
                    </Link>

                </div>
            </nav>
        </div>

    </header>

</template>

