<script setup>
import { computed } from 'vue';
import { Link } from '@inertiajs/vue3';

</script>

<template>
    <section class="footer py-2 container-fluid">
        <div class="row">
            <div class="col-lg-9 pt-3">
                <p>Copyright 2026 Organic | Organic Store Template Exercise by AFridl</p>
            </div>
            <div class="col-lg-3">
                <div class="s1">
                    <i class="bi bi-youtube"></i>
                </div>
                <div class="s1">
                    <i class="bi bi-facebook"></i>
                </div>
                <div class="s1">
                    <i class="bi bi-instagram"></i>
                </div>
                <div class="s1">
                    <i class="bi bi-linkedin"></i>
                </div>
            </div>
        </div>
    </section>

</template>

<style>
    .footer{
        background: rgb(127, 123, 123);
    }
    .s1{
        color: white;
        height: 40px;
        width: 40px;
        background-color: transparent;
        border:1px solid white;
        border-radius: 50%;
        display: inline-block;
        text-align: center;
        padding-top: 9px;
        margin-left:10px;
        transition: all 0.3s;
        cursor: pointer;
    }
    .s1:hover{
        background-color: rgb(20,219,20);
        border: none;
    }
    .footer p{
        color:white;
    }
</style>
