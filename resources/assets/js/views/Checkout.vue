<template>
    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="order-box">
                    <img :src="product.image" :alt="product.name">
                    <h2 class="title" v-html="product.name"></h2>
                    <p class="small-text text-muted float-left" >$ {{product.price}}</p>
                    <p class="small-text text-muted float-right">Available Units: {{product.units}}</p>
                    <br>
                    <hr>
                    <label class="row"><span class="col-md-2 float-left">Quantity: </span><input type="number" name="units" min="1" :max="product.units" class="col-md-2 float-left" v-model="quantity" @change="checkUnits"></label>
                </div>
                <br>
                <div>
                    <div v-if="!isLoggedIn">
                        <h2>You need to login to continue</h2>
                        <button class="col-md-4 btn btn-primary float-left" @click="login">Login</button>
                        <button class="col-md-4 btn btn-danger float-right" @click="register">Create an account</button>
                    </div>




                    <div v-if="isLoggedIn">
                        <label class='control-label'>Card Number</label>
                        <input autocomplete='off' class='form-control card-number' size='20' type='text' v-model="card_no">
                    </div>
                </div>
                <div class='form-row'>
                    <div class='col-xs-4 form-group cvc required'>
                        <label class='control-label'>CVV</label>
                        <input autocomplete='off' class='form-control card-cvc' placeholder='ex. 311' size='4' type='text' v-model="cvvNumber">
                    </div>
                    <div class='col-xs-4 form-group expiration required'>
                        <label class='control-label'>Expiration</label>
                        <input class='form-control card-expiry-month' placeholder='MM' size='4' type='text' v-model="ccExpiryMonth">
                    </div>
                    <div class='col-xs-4 form-group expiration required'>
                        <label class='control-label'>Year</label>
                        <input class='form-control card-expiry-year' placeholder='YYYY' size='4' type='text' v-model="ccExpiryYear">
                    </div>
                </div>

                <div class="row">
                            <label for="address" class="col-md-3 col-form-label">Delivery Address</label>
                            <div class="col-md-9">
                                <input id="address" type="text" class="form-control" v-model="address" required>
                            </div>
                        </div>
                        <br>
                        <button class="col-md-4 btn btn-sm btn-success float-right" v-if="isLoggedIn" @click="placeOrder">Order</button>
                    </div>
                </div>
            </div>
</template>

<style scoped>
    .small-text { font-size: 18px; }
    .order-box { border: 1px solid #cccccc; padding: 10px 15px; }
    .title { font-size: 36px; }
</style>


<script>
    export default {
        props : ['pid'],
        data(){
            return {
                address : "",
                amount:"",
                card_no:"",
                cvvNumber:"",
                ccExpiryMonth:"",
                ccExpiryYear:"",
                quantity : 1,
                isLoggedIn : null,
                product : []
            }
        },
        mounted() {
            this.isLoggedIn = localStorage.getItem('sellify.jwt') != null
        },
        beforeMount() {
            fetch(`/api/products/${this.pid}`).then(response => response.json()).then(response => this.product = response.data);

            if (localStorage.getItem('sellify.jwt') != null) {
                this.user = JSON.parse(localStorage.getItem('sellify.user'));
            }
        },
        methods : {
            login() {
                this.$router.push({name: 'login', params: {nextUrl: this.$route.fullPath}})
            },
            register() {
                this.$router.push({name: 'register', params: {nextUrl: this.$route.fullPath}})
            },
            payWithStripe(order){
                let headers = {
                    "Content-Type":"application/json",
                    "Authorization":"Bearer " + localStorage.getItem('sellify.jwt')
                };

                let data = {
                    "amount":this.product.price * this.quantity,
                    "card_no":this.card_no,
                    "cvvNumber":this.cvvNumber,
                    "ccExpiryMonth":this.ccExpiryMonth,
                    "ccExpiryYear":this.ccExpiryYear,
                    "order_id":order
                };

                fetch('api/payments/stripe', {
                        method: "POST",
                        body: JSON.stringify(data),
                        headers:headers

                    }
                ).then(response => response.json()).then(response => {
                    console.log(response);
                    return true;
                })
            },
            placeOrder(e) {
                e.preventDefault();
                let headers = {
                    "Content-Type":"application/json",
                    "Authorization":"Bearer " + localStorage.getItem('sellify.jwt')
                };

                let address = this.address;
                let product_id = this.product.id;
                let quantity = this.quantity;
                let user_id = this.user.id;

                let data = {
                    "address": address,
                    "quantity":quantity,
                    "product_id":product_id,
                    "user_id":user_id
                };

                fetch('api/orders', {
                       method: "POST",
                       body: JSON.stringify(data),
                       headers:headers

                }
                ).then(response => response.json()).then(response => {
                    console.log(response);
                    //pay with stripe
                    this.payWithStripe( response.data.id);
                    //this.$router.push('/confirmation')
                })
            },
            checkUnits(e){
                if (this.quantity > this.product.units) {
                    this.quantity = this.product.units
                }
            }
        }
    }
</script>