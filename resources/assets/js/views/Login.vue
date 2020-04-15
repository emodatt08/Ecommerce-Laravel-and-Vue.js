<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card card-default">
                    <div class="card-header">Login</div>
                    <div class="card-body">
                        <form>
                            <div class="form-group row">
                                <label for="email" class="col-sm-4 col-form-label text-md-right">E-Mail Address</label>
                                <div class="col-md-6">
                                    <input id="email" type="email" class="form-control" v-model="email" required autofocus>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                                <div class="col-md-6">
                                    <input id="password" type="password" class="form-control" v-model="password" required>
                                </div>
                            </div>
                            <div class="form-group row mb-0">
                                <div class="col-md-8 offset-md-4">
                                    <button type="submit" class="btn btn-primary" @click="handleSubmit">
                                        Login
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>


<script>
    export default {
        data() {
            return {
                email: "",
                password: ""
            }
        },
        methods: {
            handleSubmit(e) {
                e.preventDefault()
                if (this.password.length > 0) {
                    let email = this.email
                    let password = this.password
                    let data = {
                        "email": email,
                        "password": password
                    };
                    //console.log(email,password );
                    let headers = {
                        "Content-Type": "application/json",
                        "Access-Control-Origin": "*"
                    }


                    fetch('api/login', {
                        method: "POST",
                        body:  JSON.stringify(data), headers: headers

                    }).then(response => response.json()).then(response => {
                        //console.log(response);
                        let user = response.user
                        let is_admin = user.is_admin;
                        localStorage.setItem('sellify.user', JSON.stringify(user))
                        localStorage.setItem('sellify.jwt', response.token)

                        if (localStorage.getItem('sellify.jwt') != null) {
                            //console.log("im here");
                            this.$emit('loggedIn')
                            if (this.$route.params.nextUrl != null) {

                                this.$router.push(this.$route.params.nextUrl)

                            } else {
                                this.$router.push((is_admin == 1 ? 'admin' : 'dashboard'))
                            }
                        }
                    }).catch((err) => {
                        alert("User not found");
                        console.error(err);
                    });
                }
            }
        }
    }
</script>

