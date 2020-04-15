import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

import App from './js/views/App.vue'
import Home from './js/views/Home.vue'
import Login from './js/views/Login.vue'
import Register from './js/views/Register.vue'
import SingleProduct from './js/views/SingleProduct.vue'
import Checkout from './js/views/Checkout.vue'
import Confirmation from './js/views/Confirmation.vue'
import UserBoard from './js/views/UserBoard.vue'
import Admin from './js/views/Admin.vue'

const router = new VueRouter({
        mode: 'history',
        routes: [
            {
                path: '/',
                name: 'home',
                component: Home
            },
            {
                path: '/login',
                name: 'login',
                component: Login
            },
            {
                path: '/register',
                name: 'register',
                component: Register
            },
            {
                path: '/products/:id',
                name: 'single-products',
                component: SingleProduct
            },
            {
                path: '/confirmation',
                name: 'confirmation',
                component: Confirmation
            },
            {
                path: '/checkout',
                name: 'checkout',
                component: Checkout,
                props: (route) => ({ pid: route.query.pid })
    },
    {
        path: '/dashboard',
        name: 'userboard',
        component: UserBoard,
        meta: {
            requiresAuth: true,
            is_user: true
        }
    },
    {
        path: '/admin/:page',
        name: 'admin-pages',
        component: Admin,
        meta: {
            requiresAuth: true,
            is_admin: true
        }
    },
    {
        path: '/admin',
        name: 'admin',
        component: Admin,
        meta: {
            requiresAuth: true,
            is_admin: true
        }
    },
],
})

router.beforeEach((to, from, next) => {
    if (to.matched.some(record => record.meta.requiresAuth)) {
    if (localStorage.getItem('sellify.jwt') == null) {
        next({
            path: '/login',
            params: { nextUrl: to.fullPath }
        })
    } else {
        let user = JSON.parse(localStorage.getItem('sellify.user'))
        if (to.matched.some(record => record.meta.is_admin)) {
            if (user.is_admin == 1) {
                next()
            }
            else {
                next({ name: 'userboard' })
            }
        }
    else if (to.matched.some(record => record.meta.is_user)) {
            if (user.is_admin == 0) {
                next()
            }
            else {
                next({ name: 'admin' })
            }
        }
        next()
    }
} else {
    next()
}
});


const app = new Vue({
    el: '#app',
    components: { App },
    router,
});