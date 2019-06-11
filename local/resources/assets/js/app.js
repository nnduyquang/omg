
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

var globals = require('./config');

window.Vue = require('vue');



// IMPORT
import VueProgressBar from 'vue-progressbar';
import CKEditor from '@ckeditor/ckeditor5-vue';
import {Form, HasError, AlertError} from 'vform';
import swal from 'sweetalert2';
import moment from 'moment';

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */
//KHAI BÁO COMPONENT
Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)
Vue.component('pagination', require('laravel-vue-pagination'));
Vue.component('example-component', require('./components/ExampleComponent.vue'));
Vue.component(
    'user-manager',
    require('./components/backend/user/user.vue')
);
Vue.component(
    'category-manager',
    require('./components/backend/category-manager/category-manager.vue')
);
Vue.component(
    'category-loop-li',
    require('./components/backend/category-manager/category-loop-li.vue')
);
Vue.component(
    'post-index',
    require('./components/backend/post/post-index.vue')
);
Vue.component(
    'product-index',
    require('./components/backend/product/product-index.vue')
);
Vue.component(
    'text-area',
    require('./components/backend/form/text-area.vue')
);
Vue.component(
    'main-image',
    require('./components/backend/form/main-image.vue')
);
Vue.component(
    'seos',
    require('./components/backend/form/seo.vue')
);
Vue.component(
    'insert-update-post',
    require('./components/backend/post/insert-update-post.vue')
);
Vue.component(
    'insert-update-product',
    require('./components/backend/product/insert-update-product.vue')
);

Vue.component(
    'tree-view-category',
    require('./components/backend/form/tree-view-category/tree-view-category.vue')
);

Vue.component(
    'tree-loop-li',
    require('./components/backend/form/tree-view-category/loop-li.vue')
);
Vue.component(
    'multi-image',
    require('./components/backend/form/multi-image.vue')
);
Vue.component(
    'config-index',
    require('./components/backend/config/config-index.vue')
);
Vue.component(
    'email-config',
    require('./components/backend/config/detail/email-config.vue')
);
Vue.component(
    'info-config',
    require('./components/backend/config/detail/info-config.vue')
);
Vue.component(
    'script-config',
    require('./components/backend/config/detail/script-config.vue')
);
Vue.component(
    'seo-config',
    require('./components/backend/config/detail/seo-config.vue')
);
Vue.component(
    'slider-config',
    require('./components/backend/config/detail/slider-config.vue')
);


//USING
window.GloabalUrl=globals.config.base_url;
window.Form = Form;
window.swal = swal;
window.Fire=new Vue();
const toast = swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000
});

window.toast = toast
const options = {
    color: '#bffaf3',
    failedColor: '#874b4b',
    thickness: '5px',
    transition: {
        speed: '0.2s',
        opacity: '0.6s',
        termination: 300
    },
    autoRevert: true,
    location: 'top',
    inverse: false
}
Vue.use(VueProgressBar, options);
Vue.use( CKEditor );
Vue.filter('upText', function (text) {
    return text.charAt(0).toUpperCase() + text.slice(1)
});
Vue.filter('myDate', function (created) {
    return moment(created).format('MMMM Do YYYY')
});

const app = new Vue({
    el: '#app'
});
