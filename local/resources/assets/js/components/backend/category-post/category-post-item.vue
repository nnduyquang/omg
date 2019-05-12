<template>
    <!--<div>-->
        <!--<li class="dd-item"><div class="dd-handle">haha</div></li>-->
    <!--</div>-->
    <ol class="dd-list">
        <!--vòng lặp-->
        <li :key="category.id" v-for="category in listChild" class="dd-item" :data-id="category.id">
            <div class="dd-handle">
                <span>{{category.title}}</span>
            </div>
                <category-post-item v-if="category.children.length!=0"
                                    :listChild="category.children"></category-post-item>
        </li>
        <!--kết thúc vòng lạp-->
    </ol>

</template>
<script>
    export default {
        props:['listChild'],
        data() {
            return {
                categories: {},
            }
        },
        created: function () {
            console.log('user data from parent component:')
//            console.log('haha'+this.listChild) //prints out an empty string
        },
        methods:{

        }
    }
    </script>