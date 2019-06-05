<template>
    <div id="treeview_container" class="hummingbird-treeview" style="height: 230px; overflow-y: scroll;">
        <ul id="treeview" class="hummingbird-base">
            <tree-loop-li v-if="category.level==0" :key="index" v-for="(category,index) in categories" :level="0"
                          :category="category"></tree-loop-li>
        </ul>
    </div>
</template>

<script>
    export default {
        props: ['category_type'],
        data() {
            return {
                categories: {},
            }
        },
        methods: {
            loadCategories() {
                axios.get('api/category-post',{params:this.axiosParams}).then(({data}) => (this.categories = data));
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

        },
        computed: {
            axiosParams() {
                const params = new URLSearchParams();
                params.append('category_type', this.category_type);
                return params;
            }
        }
    }
</script>
