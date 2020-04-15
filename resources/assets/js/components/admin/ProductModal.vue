<template>
    <!-- Modal -->
    <div class="modal fade" id="productModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle" name="header" v-html="data.name" ></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="exampleInputName">Name:</label>
                        <input type="text" class="form-control"  v-model="data.name" id="exampleInputName"  placeholder="Enter name">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputUnits">Units:</label>
                        <input type="text" class="form-control"  v-model="data.units" id="exampleInputUnits"  placeholder="Enter units">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPrice">Price:</label>
                        <input type="text" class="form-control"  v-model="data.price" id="exampleInputPrice"  placeholder="Enter price">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControldescription">Description:</label>
                        <textarea class="form-control" id="exampleFormControldescription" v-model="data.description" placeholder="Enter description" rows="3"></textarea>
                    </div>
                    <span >
                            <div class="text-center">
                                <img :src="data.image" v-show="data.image != null" style="height:170px; width:150px;" class="rounded float-center" >
                                <input type="file" id="file" name="image" class="flex"  @change="attachFile">
                            </div>
                    </span>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" @click="uploadFile" >Save</button>
                </div>
            </div>
        </div>
    </div>
</template>



<script>
    export default {
        props: ['product'],
        data() {
            return {
                attachment: null,

            }
        },
        computed: {
            data() {
                if (this.product != null) {
                    return this.product
                }else{
                    return this.product
//                    return {
//                        name:  null ,
//                        units:  "" ,
//                        price:  "" ,
//                        description: "",
//                        image:  ""
//                    };
                }

            }
        },
        methods: {
            attachFile(event) {
                this.attachment = event.target.files[0];
            },
            uploadFile(event) {
                //console.log(this.product);
                if (this.attachment != null) {
                    var formData = new FormData();
                    formData.append("image", this.attachment);

                    let headers = {'Content-Type': 'multipart/form-data'};

                    axios.post("/api/upload-file", formData, {headers}).then(response => {

                        let link = response.data.link;
                        this.product.image = link;
                        this.$emit('close', this.product)
                    })
                } else {
                    this.$emit('close', this.product)
                }
            }
        }
    }
</script>