<template>
    <div>
        <!-- <div class="container-fluid hero-section d-flex align-content-center justify-content-center flex-wrap ml-auto">
            <h2 class="title">Auction your products on Sellify</h2>
        </div> -->

        <div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle" name="header">Cart</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-striped text-left">
                            <tbody>
                            <tr v-for="(cart, n) in carts" v-bind:key="cart.id">
                                <td>{{cart.name}}</td>
                                <td>{{cart.price}}</td>
                                <td><img :src="cart.image" style="width:30px; height:30px;"></td>
                                <td width="100">
                                    <div class="form-group">

                                        <input type="text" readonly class="form-control"  v-model="quantity" >
                                    </div>
                                </td>
                                <td width="60"><button type="button" @click = "removeCart(n)" class="btn btn-sm btn-danger" ><i class="fa fa-close" ></i><a href="#" class="badge badge-primary">0</a></li>
                                </button></td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                    <div class="modal-footer">
                        Total : {{totalPrice}}
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal"> Checkout</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <li class="nav-link" data-toggle="modal" data-target="#cart"><button class = "btn btn-primary float-sm-right"><i class="fas fa-shopping-cart"></i><a href="#" class="badge badge-primary">{{badge}}</a></button></li>

            <div class="row">
                <div class="col-md-12">
                    <div class="row">

                        <div class="col-md-4 product-box" style= "margin-top:50px;" v-for="(product,index) in products" @key="index">

                                <img :src="product.image" :alt="product.name" style="height:170px; width:120px;">
                                <h5><span v-html="product.name"></span>
                                    <span class="small-text text-muted float-right">$ {{product.price}}</span>
                                </h5>
                                <button @click="addCart(product)" class="col-md-4 btn btn-sm btn-primary float-left">Add To Cart</button>
                            <router-link :to="{ path: '/products/'+product.id}">
                                <button class="col-md-4 btn btn-sm btn-primary float-right">Buy Now</button>
                            </router-link>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            console.log();
            return {
                products : [],
                carts:[],
                cartAdd:{
                        id:"",
                        name:  null ,
                        units:  "" ,
                        price:  "" ,
                        description: "",
                        image:  ""
                    },
                badge:0,
                quantity:'1',
                totalPrice:'0'

            }
        },
        created(){
            this.viewCart();
        },
        methods:{
            viewCart(){
                if(localStorage.getItem("carts")){
                    this.carts = JSON.parse(localStorage.getItem("carts"));
                    //console.log(this.carts);
                    this.badge = this.carts.length;
                    this.totalPrice = this.carts.reduce((total,item) => {
                        return total + this.quantity * item.price;
                    }, 0)
                }
            },
            addCart(product){
                //console.log(product.id);
                this.cartAdd.id = product.id;
                this.cartAdd.name = product.name;
                this.cartAdd.units = product.units;
                this.cartAdd.price = product.price;
                this.cartAdd.description = product.description;
                this.cartAdd.image = product.image;
                //console.log(this.cartAdd);
                this.carts.push(this.cartAdd);
                this.cartAdd= {};
                this.storeCart()

            },
            removeCart(product){
                this.carts.splice(product, 1);
                this.storeCart();

            },
            storeCart(){
               let parsed =  JSON.stringify(this.carts);
               localStorage.setItem("carts", parsed);
               this.viewCart();
            }

        },
        mounted(){

//            axios.get("api/products").then(
//                response => this.products = response.data)

            fetch("api/products").then(res => res.json()).then(res =>{
                console.log(res);
                this.products = res.data;
            }).catch(err => console.log(err))
        }
    }
</script>

<style scoped>
    .small-text {
        font-size: 14px;
    }
    .product-box {
        border: 1px solid #cccccc;
        padding: 10px 15px;
    }
    .hero-section {
        height: 30vh;
        background: #ababab;
        align-items: center;
        margin-bottom: 20px;
        margin-top: -20px;
    }
    .title {
        font-size: 60px;
        color: #ffffff;
    }
</style>