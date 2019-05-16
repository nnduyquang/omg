<template>
    <li class="dd-item" :data-id="category.id" v-if="category.level==level">
        <div class="dd-handle">
            <span>{{category.title}}</span>
        </div>
        <ol v-if="category.children.length!=0" class="dd-list">
            <loop-li v-for="(children,index) in category.children" :key="index" :category="children" :level="children.level"></loop-li>
        </ol>

    </li>
</template>
<script>
    export default {
        props: ['category','level'],
        data() {
            return {
                categories: {},
            }
        },
        created: function () {
            console.log('user data from parent component:')
//            console.log('haha'+this.listChild) //prints out an empty string
        },
        methods: {}
    }
</script>