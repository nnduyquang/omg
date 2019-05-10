<template>
    <div>
        <div class="row">
            <div class="col-md-12 mt-5">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Quản Lý Chuyên Mục Bài Viết</h3>

                        <div class="card-tools">
                            <button class="btn btn-success" @click.prevent="newModal">Thêm Mới <i
                                    class="fas fa-plus fa-fw"></i></button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <th>ID</th>
                                <th>Tên Chuyên Mục</th>
                                <th>Đường Dẫn</th>
                                <th>Ngày Tạo</th>
                                <th>Tình Trạng</th>
                                <th>Hành Động</th>
                            </tr>

                            <tr v-for="category in categories" :key="category.id">
                                <td>{{category.id}}</td>
                                <td>{{category.title}}</td>
                                <td>{{category.slug}}</td>
                                <td>{{category.created_at | myDate}}</td>
                                <td v-if="category.is_active==1"><i style="color:green;" class="fas fa-circle"></i></td>
                                <td v-if="category.is_active==0"><i style="color:red;"class="fas fa-circle"></i></td>
                                <td>
                                    <a href="#" @click="editModal(category)"><i class="fa fa-edit"></i></a>
                                    /
                                    <a href="#" @click="deleteCategory(category.id)"><i style="color:red" class="fa fa-trash"></i></a>
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
        <div class="modal fade" id="addNew" tabindex="-1" role="dialog" aria-labelledby="addNewLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editMode" class="modal-title" id="addNewLabel">Thêm Mới Chuyên Mục</h5>
                        <h5 v-show="editMode" class="modal-title" id="updateLabel">Cập Nhật Chuyên Mục</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editMode? updateCategory():createCategory()"
                          @keydown="form.onKeydown($event)">
                        <div class="modal-body">
                            <div class="form-group">
                                <input @change="showSlug" v-model="form.title" type="text" name="title"
                                       placeholder="Tiêu đề"
                                       class="form-control" :class="{ 'is-invalid': form.errors.has('title') }">
                                <has-error :form="form" field="title"></has-error>
                            </div>
                            <div class="form-group">
                                <span v-show="stateTitle">
                                <span>Slug: <span v-show="!hideSpanSlug">{{slug}}</span></span><input ref="someName"
                                                                                                      @change="changeInputSlug"
                                                                                                      v-show="hideSpanSlug"
                                                                                                      type="text"
                                                                                                      v-model="form.slug"
                                                                                                      class="form-control"><a
                                        href="#" v-show="!hideSpanSlug"
                                        @click="changeSlug">Đổi</a><a href="#" v-show="hideSpanSlug"
                                                                      @click="cancelSlug">Hủy</a><a
                                        href="#" v-show="hideSpanSlug" @click="applySlug">Đồng ý</a></span>
                                <span style="color: red" v-if="form.errors.has('slug')">Đường dẫn đã tồn tại</span>
                            </div>
                            <div class="form-group">
                            <textarea id="description" v-model="form.description" name="description"
                                      placeholder="Mô tả ngắn về chuyên mục"
                                      class="form-control"
                                      :class="{ 'is-invalid': form.errors.has('description') }">
                            </textarea>
                                <has-error :form="form" field="description"></has-error>
                            </div>
                            <!--<div class="form-group">-->
                            <span>Kích hoạt</span>
                            <input name="is_active" type="checkbox"
                                   data-toggle="toggle">
                            <!--</div>-->

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            <button v-show="editMode" type="submit" class="btn btn-success">Cập Nhật</button>
                            <button v-show="!editMode" type="submit" class="btn btn-primary">Tạo Mới</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


</template>

<script>
    export default {
        data() {
            return {
                stateTitle: false,
                hideSpanSlug: false,
                editMode: false,
                categories: {},
                slug: '',
                form: new Form({
                    id: '',
                    title: '',
                    slug: '',
                    description: '',
                    is_active: 0,
                    type: 0
                })
            }
        },
        methods: {
            checkActive(state) {
                console.log('Trạng thái' + state);
            },
            changeInputSlug(event) {
                if (!this.hideSpanSlug) {
                    this.slug = ChangeToSlug(event.target.value);
                    this.form.slug = ChangeToSlug(event.target.value);
                }

            },
            applySlug() {
                this.changeInputSlug();
                this.hideSpanSlug = false;
                this.slug = ChangeToSlug(this.$refs.someName.value);
                this.form.slug = ChangeToSlug(this.$refs.someName.value);

            },
            cancelSlug() {
                this.hideSpanSlug = false;
                this.form.slug = this.slug;
            },
            changeSlug() {
                this.hideSpanSlug = true;

            },
            showSlug(event) {
                if (event.target.value) {
                    this.stateTitle = true;
//
                    this.slug = ChangeToSlug(event.target.value);
                    this.form.slug = ChangeToSlug(event.target.value);
                } else {
                    this.stateTitle = false;
                    this.slug = '';
                    this.form.slug = '';
                }
            },
            // getResults(page = 1) {
            //     axios.get('api/category-post?page=' + page)
            //         .then(response => {
            //             this.categories = response.data;
            //         });
            // },
            updateCategory() {
                this.$Progress.start();
                this.form.put('api/category-post/' + this.form.id).then(() => {
                    this.stateTitle = false;
                    this.hideSpanSlug = false;
                    $('#addNew').modal('hide');
                    toast.fire({
                        type: 'success',
                        title: 'Danh mục bài viết đã được cập nhật'
                    });
                    Fire.$emit('ReloadTable');
                }).catch(() => {
                    this.$Progress.fail();
                });
                this.$Progress.finish();
            },
            newModal() {
                this.editMode = false;
                this.form.reset();
                this.slug='';
                this.stateTitle = false;
                this.hideSpanSlug = false;
                $('input[type=checkbox]').bootstrapToggle('off')
                $('#addNew').modal('show');
            },
            editModal(category) {
                this.editMode = true;
                this.hideSpanSlug = false;
                this.stateTitle = true;
                this.slug = category.slug;
                this.form.reset();
                $('#addNew').modal('show');
                this.form.fill(category);
                if(category.is_active==1){
                    $('input[type=checkbox]').bootstrapToggle('on')
                }else{
                    $('input[type=checkbox]').bootstrapToggle('off')
                }
            },
            deleteCategory(id) {
                swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.value) {
                        this.$Progress.start();
                        this.form.delete('api/category-post/' + id).then(() => {
                            swal.fire(
                                'Deleted!',
                                'Your file has been deleted.',
                                'success'
                            )
                            Fire.$emit('ReloadTable');
                        }).catch(() => {
                            this.$Progress.fail();
                            swal.fire(
                                'Failed!',
                                'There was something wrong.',
                                'warning'
                            )
                        });
                        this.$Progress.finish();
                    }
                })
            },
            loadCategories() {
                // if (this.$gate.isAdminOrAuthor()) {
//                axios.get('api/user').then(({data}) => (this.users = data.data));
                axios.get('api/category-post').then(({data}) => (this.categories = data));
                // }
            },
            createCategory() {
                this.$Progress.start();
                this.form.post('api/category-post').then(() => {
                    Fire.$emit('ReloadTable');
                    $('#addNew').modal('hide');
                    toast.fire({
                        type: 'success',
                        title: 'User created in successfully'
                    });

                }).catch(() => {
                    this.$Progress.fail();
                });
                this.$Progress.finish();
            }
        },
        created() {
            Fire.$on('searching', () => {
                let query = this.$parent.search;
                axios.get('api/findUser?q=' + query).then((data) => {
                    this.users = data.data;
                }).catch(() => {

                })
            });
            this.loadCategories();
            Fire.$on('ReloadTable', () => {
                this.loadCategories();
            });
            Fire.$on('checkActive', (data) => {
                this.form.is_active = data;
            });
            // $('input[type=checkbox]').bootstrapToggle({
            //     size:"large"
            // });
//            setInterval(()=>this.loadUsers(),3000);
        },
        mounted() {
            $('input[type=checkbox]').bootstrapToggle({
                size: "normal",
                on: 'Có',
                off: 'Không',
                width: '100px'
            });
            $('input[type=checkbox]').change(function () {
                if ($(this).prop('checked')) {
                    Fire.$emit('checkActive', 1)
                } else {
                    Fire.$emit('checkActive', 0)
                }
            });
        }
    }
</script>
