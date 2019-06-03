<template>
    <div>
        <div v-show="showIndex" class="row">
            <div class="col-md-12 mt-5">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Quản Lý Bài Viết</h3>

                        <div class="card-tools">
                            <button class="btn btn-success" @click.prevent="insertPost">Thêm Mới <i
                                    class="fas fa-plus fa-fw"></i></button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0 dd">
                        <table class="table table-hover dd-list">
                            <tbody>
                            <tr>
                                <th>ID</th>
                                <th>Bài Viết</th>
                                <th>Đường Dẫn</th>
                                <th>Ngày Tạo</th>
                                <th>Tình Trạng</th>
                                <th>Hành Động</th>
                            </tr>
                            <tr v-for="post in posts"
                                :key="post.id">
                                <td>{{post.id}}</td>
                                <td>{{post.title}}</td>
                                <td>{{post.slug}}</td>
                                <td>{{post.created_at | myDate}}</td>
                                <td v-if="post.is_active==1"><i style="color:green;"
                                                                class="fas fa-circle"></i>
                                </td>
                                <td v-if="post.is_active==0"><i style="color:red;"
                                                                class="fas fa-circle"></i>
                                </td>
                                <td>
                                    <a href="#" @click="editPost(post)"><i class="fa fa-edit"></i></a>
                                    /
                                    <a href="#" @click="deletePost(post.id)"><i style="color:red" class="fa fa-trash"></i></a>
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
        <insert-post v-show="showUpdate" :editMode="editMode"></insert-post>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                showUpdate:false,
                showIndex:true,
                posts: {},
                editMode: false,
            }
        },
        methods: {
            loadPosts() {
                // if (this.$gate.isAdminOrAuthor()) {
//                axios.get('api/user').then(({data}) => (this.users = data.data));
                axios.get('api/post').then(({data}) => (this.posts = data));

                // }
            },
            insertPost(){
                this.showUpdate=true;
                this.showIndex=false;
                this.editMode=false;
            },
            editPost(post){
                this.showUpdate=true;
                this.showIndex=false;
                this.editMode=true;
                Fire.$emit('UpdatePost',post);
            },
            deletePost(id){
                Fire.$emit('DeletePost',id);
//                swal.fire({
//                    title: 'Bạn Có Chắc Muốn Xóa Bài Viết Này Không?',
//                    text: "Bạn sẽ mất bài viết này vĩnh viễn",
//                    type: 'warning',
//                    showCancelButton: true,
//                    confirmButtonColor: '#3085d6',
//                    cancelButtonColor: '#d33',
//                    confirmButtonText: 'Vâng, Hãy xóa nó!'
//                }).then((result) => {
//                    console.log(result);
//                    if (result.value) {
//                        this.$Progress.start();
//                        this.delete('api/post/' + id).then(() => {
//                            swal.fire(
//                                'Đã xóa!',
//                                'Bài viết đã xóa.',
//                                'success'
//                            )
//                            this.loadPosts();
////                            Fire.$emit('ReloadTable');
//                        }).catch(() => {
//                            this.$Progress.fail();
//                            swal.fire(
//                                'Xóa thất bại!',
//                                'Đã xảy ra sai xót gì đó.',
//                                'warning'
//                            )
//                        });
//                        this.$Progress.finish();
//                    }
//                })
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
            Fire.$on('InsertSuccess', () => {
                this.showUpdate=false;
                this.showIndex=true;
                this.loadPosts();
            });
            this.loadPosts();
        },
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>