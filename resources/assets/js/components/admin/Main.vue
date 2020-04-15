<template>
    <div class="row">
        <div class="col-md-4 product-box d-flex align-content-center justify-content-center flex-wrap big-text">
            <a href='/admin/orders'>Orders ({{orders.length}})</a>
        </div>
        <hr>
        <div class="col-md-4 product-box d-flex align-content-center justify-content-center flex-wrap big-text">
            <a href='/admin/products'>Products ({{products.length}})</a>
        </div>
        <div class="col-md-4 product-box d-flex align-content-center justify-content-center flex-wrap big-text">
            <a href='/admin/users'>Users ({{users.length}})</a>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                user : null,
                orders : [],
                products : [],
                users : []
            }
        },
        mounted() {
            let headers = {
                "Content-Type":"application/json",
                "Authorization":"Bearer " + localStorage.getItem('sellify.jwt')
            };
            fetch('/api/users/',{headers:headers}).then(response => response.json()).then(response => this.users = response.data)
            fetch('/api/products/',{headers:headers}).then(response => response.json()).then(response => this.products = response.data)
            fetch('/api/orders/',{headers:headers}).then(response => response.json()).then(response => this.orders = response)
        }
    }
</script>

<style scoped>
    .big-text { font-size: 28px; }
    .product-box { border: 1px solid #cccccc; padding: 10px 15px; height: 20vh }
</style>