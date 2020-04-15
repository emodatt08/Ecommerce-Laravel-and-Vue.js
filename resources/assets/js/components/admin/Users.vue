<template>
    <div>
        <table class="table table-responsive table-striped">
            <thead>
            <tr>
                <td></td>
                <td>Name</td>
                <td>Email</td>
                <td>Joined</td>
                <td>Total Orders</td>
            </tr>
            </thead>
            <tbody>
            <tr v-for="(user,index) in users" @key="index">
                <td>{{index+1}}</td>
                <td>{{user.name}}</td>
                <td>{{user.email}}</td>
                <td>{{user.created_at}}</td>
                <td>{{user.relationship.orders.length}}</td>
            </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
    export default {
        data() {

            return {
                users : []
            }
        },
        beforeMount() {
            let headers = {
                "Content-Type":"application/json",
                "Authorization":"Bearer " + localStorage.getItem('sellify.jwt')
            };
            fetch('/api/users', {headers:headers}).then(response => response.json()).then(response => this.users = response.data)
        }
    }
</script>