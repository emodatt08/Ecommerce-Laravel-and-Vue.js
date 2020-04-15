<template>
    <div>



        <table class="table table-responsive table-striped">
            <thead>
            <tr>
                <td></td>
                <td>Product</td>
                <td>Units</td>
                <td>Price</td>
                <td>Description</td>
            </tr>
            </thead>
            <tbody>
            <tr v-for="(product,index) in products" @key="index" @dblclick="openModal(product)">
                <td>{{index+1}}</td>
                <td v-html="product.name"></td>
                <td v-model="product.units">{{product.units}}</td>
                <td v-model="product.price">{{product.price}}</td>
                <td v-model="product.price">{{product.description}}</td>
            </tr>
            </tbody>
        </table>
        <modal @close="endEditing" :product="editingItem" v-show="editingItem != null"></modal>
        <modal @close="addProduct"   :product="addingProduct" v-show="addingProduct != null"></modal>

        <br>

        <button type="button" class="btn btn-primary" @click="newProduct" data-toggle="modal" data-target="#productModalLong">
            Add New Product
        </button>
    </div>

</template>

<script>

    import Modal from './ProductModal'
    export default {
        data() {
            return {
                products: [],
                addingData:null,
                editingItem: null,
                addingProduct: null,
                headers:{
                    "Content-Type":"application/json",
                    "Authorization":"Bearer " + localStorage.getItem('sellify.jwt')
                },

            }
        },
        components: {Modal},
        beforeMount() {
            fetch('/api/products/').then(response =>response.json()).then(response => this.products = response.data)
        },
        methods: {
            newProduct() {
                return this.addingProduct = {
                    name: null,
                    units: null,
                    price: null,
                    image: null,
                    description: null,
                }

            },
            openModal(product){
                this.editingItem = product;
                $("#productModalLong").modal();
            },
            endEditing(product) {
                this.editingItem = null;
                let index = this.products.indexOf(product);
                const  productData = {
                    "name" : product.name,
                    "units" : product.units,
                    "price" : product.price,
                    "description" : product.description,
                    "image" : product.image,
                    "index" : index
                };
                axios.put(`/api/products/${product.id}`, productData, {headers:this.headers}
                ).then(response => this.products[index] = product)
            },
            addProduct(product) {

                this.addingProduct = null;
                let index = this.products.indexOf(product);
                   const  productData = {
                        "name" : product.name,
                        "units" : product.units,
                        "price" : product.price,
                        "description" : product.description,
                        "image" : product.image,
                        "index" : index
                    };
                   // console.log(productData);
                    axios.post("/api/products",productData, {
                        headers: this.headers
                    })
                        .then(response => this.products.push(product));
                $("#productModalLong").modal("hide");
                }


        },
        productData(product){
            let index = this.products.indexOf(product);
            return {
                 "name" : product.name,
                 "units" : product.units,
                 "price" : product.price,
                 "description" : product.description,
                 "image" : product.image,
                 "index" : index
            }
        }
    }

</script>