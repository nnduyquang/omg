<template>
    <li>
        <i class="fa fa-plus"></i>
        <label>
            <!--<input  id="xnode-0-1" :data-id="category.id" type="checkbox" /> {{category.title}}-->
            <input v-if="category.children.length==0" class="hummingbird-end-node"   :id="category.id" :data-id="category.id" type="checkbox" />
            <input v-else  :id="category.id" :data-id="category.id" type="checkbox" />
            {{category.title}}
        </label>
        <ul>
            <loop-li-post v-for="(children,index) in category.children" :key="index" :category="children" :level="children.level"></loop-li-post>
        </ul>
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
        },
        methods: {}
    }
</script>
