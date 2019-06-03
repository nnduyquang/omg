<template>
    <div id="treeview_container" class="hummingbird-treeview" style="height: 230px; overflow-y: scroll;">
        <ul id="treeview" class="hummingbird-base">
            <loop-li-post v-if="category.level==0" :key="index" v-for="(category,index) in categories" :level="0"
                          :category="category"></loop-li-post>
        </ul>
    </div>
</template>

<script>
    export default {
        props: ['form'],
        data() {
            return {
                categories: {},
            }
        },
        methods: {
            loadCategories() {
                axios.get('api/category-post').then(({data}) => (this.categories = data));
            },
        },
        created() {
            this.loadCategories();
            Fire.$on('UpdateTreeView', ($content) => {
                $.each($content,function (key,value) {
                    $("#treeview").hummingbird("checkNode",{attr:"id",name: value,expandParents:false});
                })

            });
        },

        mounted() {

        },
        updated() {
            $("#treeview").hummingbird();
            $("#treeview").hummingbird("expandAll");
            $("#treeview").on("CheckUncheckDone", function () {
                let List = {"id": [], "dataid": [], "text": []};
                $("#treeview").hummingbird("getChecked", {list: List, onlyEndNodes: true});
                Fire.$emit('UpdateListIdCategory', List.id.join(","));
            });

        }
    }
</script>
