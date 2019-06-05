<template>
    <div>
        <div v-show="showIndex" class="row">
            <div class="col-md-12 mt-5">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Quản Lý Sản Phẩm</h3>

                        <div class="card-tools">
                            <button class="btn btn-success" @click.prevent="insertProduct">Thêm Mới <i
                                    class="fas fa-plus fa-fw"></i></button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0 dd">
                        <table class="table table-hover dd-list">
                            <tbody>
                            <tr>
                                <th>ID</th>
                                <th>Sản Phẩm</th>
                                <th>Đường Dẫn</th>
                                <th>Ngày Tạo</th>
                                <th>Tình Trạng</th>
                                <th>Hành Động</th>
                            </tr>
                            <tr v-for="product in products"
                                :key="product.id">
                                <td>{{product.id}}</td>
                                <td>{{product.title}}</td>
                                <td>{{product.slug}}</td>
                                <td>{{product.created_at | myDate}}</td>
                                <td v-if="product.is_active==1"><i style="color:green;"
                                                                class="fas fa-circle"></i>
                                </td>
                                <td v-if="product.is_active==0"><i style="color:red;"
                                                                class="fas fa-circle"></i>
                                </td>
                                <td>
                                    <a href="#" @click="editProduct(product)"><i class="fa fa-edit"></i></a>
                                    /
                                    <a href="#" @click="deletePost(product.id)"><i style="color:red" class="fa fa-trash"></i></a>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                    <!-- /.card-body -->
                    <!--<div class="card-footer">-->
                    <!--<pagination :data="categories" @pagination-change-page="getResults"></pagination>-->
                    <!--</div>-->
                </div>
                <!-- /.card -->
            </div>
        </div>
        <insert-update-product v-show="showUpdate" :editMode="editMode"></insert-update-product>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                showUpdate:false,
                showIndex:true,
                products: {},
                editMode: false,
            }
        },
        methods: {
            loadProducts() {
                axios.get('api/product').then(({data}) => (this.products = data));
            },
            insertProduct(){
                this.showUpdate=true;
                this.showIndex=false;
                this.editMode=false;
            },
            editProduct(post){
                this.showUpdate=true;
                this.showIndex=false;
                this.editMode=true;
                Fire.$emit('UpdateProduct',post);
            },
            deletePost(id){
                Fire.$emit('DeleteProduct',id);
            },
        },
        created() {
            Fire.$on('searching', () => {
                let query = this.$parent.search;
                axios.get('api/findUser?q=' + query).then((data) => {
                    this.users = data.data;
                }).catch(() => {

                })
            });
            Fire.$on('InsertSuccessProduct', () => {
                this.showUpdate=false;
                this.showIndex=true;
                this.loadProducts();
            });
            this.loadProducts();
        },
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>