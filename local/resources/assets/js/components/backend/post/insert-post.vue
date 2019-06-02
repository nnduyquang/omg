<template>
    <div>
        <div class="row mb-2">
            <div class="col-md-12">
                <h1 v-show="!editMode">Thêm Mới Bài Viết</h1>
                <h1 v-show="editMode">Cập Nhật Bài Viết</h1>
            </div>
        </div>
        <form @submit.prevent="createPost"
              @keydown="form.onKeydown($event)">
            <div class="row">

                <div class="col-md-8">
                    <div class="card card-primary card-outline">
                        <div class="card-body pad table-responsive">

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
                                                                                                      class="form-control">
                                    <a href="#" v-show="!hideSpanSlug" @click="changeSlug">Đổi</a><a href="#"
                                                                                                     v-show="hideSpanSlug"
                                                                                                     @click="cancelSlug">Hủy</a>
                                    <a href="#" v-show="hideSpanSlug" @click="applySlug">Đồng ý</a></span>
                                    <span style="color: #dc3545;font-size: 80%"
                                          v-if="form.errors.has('slug')">{{form.errors.get('slug')}}</span>
                                </div>
                                <div class="form-group">
                            <textarea @change="changeDescription" id="description" v-model="form.description" name="description"
                                      placeholder="Mô tả ngắn về bài viết"
                                      class="form-control"
                                      :class="{ 'is-invalid': form.errors.has('description') }">
                            </textarea>
                                    <has-error :form="form" field="description"></has-error>
                                </div>
                                <div class="form-group">
                                    <text-area :form="form"></text-area>
                                    <has-error :form="form" field="description"></has-error>

                                </div>
                            </div>

                            <!--<div class="modal-footer">-->
                            <!--<button v-show="editMode" type="submit" class="btn btn-success">Cập Nhật</button>-->
                            <!--<button v-show="!editMode" type="submit" class="btn btn-primary">Tạo Mới</button>-->
                            <!--</div>-->

                        </div>
                        <!-- /.card -->
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-primary card-outline">
                        <div class="card-body pad table-responsive">
                            <span>Kích hoạt</span>
                            <input name="is_active" type="checkbox"
                                   data-toggle="toggle">
                        </div>
                        <!-- /.card -->
                    </div>
                    <div class="card card-primary card-outline">
                        <div class="card-header">
                            <h3 class="card-title">Hình Ảnh Đại Diện</h3>
                        </div>
                        <div class="card-body pad table-responsive">
                            <main-image :pathImage="form.img_primary" idShow="showHinh" idInputPath="pathImage"
                                        idInputHidden="one_image_id"></main-image>
                        </div>
                        <!-- /.card -->
                    </div>
                    <div class="card card-primary card-outline">
                        <div class="card-header">
                            <h3 class="card-title">Danh Mục Bài Viết</h3>
                        </div>
                        <div class="card-body pad table-responsive">
                            <tree-view-category-post class="form-control"
                                                     :class="{ 'is-invalid': form.errors.has('list_id_category') }"></tree-view-category-post>
                            <has-error :form="form" field="list_id_category"></has-error>
                        </div>

                        <!-- /.card -->
                    </div>
                    <div class="card card-primary card-outline">
                        <div class="card-body pad table-responsive">
                            <button v-show="editMode" type="submit" class="btn btn-success">Cập Nhật</button>
                            <button v-show="!editMode" type="submit" class="btn btn-primary">Tạo Mới</button>
                        </div>
                        <!-- /.card -->
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <seos :editMode="editMode" :pathImage="form.img_primary" :title="form.title" :description="form.description"></seos>
                </div>
            </div>
        </form>
    </div>
</template>

<script>
    export default {
        props: {
            editMode: {
                type: Boolean
            }
        },
        data() {
            return {
                stateTitle: false,
                hideSpanSlug: false,
                slug: '',
                formSort: new Form({
                    listSort: '',
                }),
                form: new Form({
                    id: '',
                    title: '',
                    slug: '',
                    description: '',
                    content: '',
                    is_active: 0,
                    img_primary: '',
                    type: 0,
                    list_id_category: '',
                    seo_title: '',
                    seo_keyword:'',
                    seo_description: '',
                    seo_image: ''
                }),
            }
        },

        methods: {
            createPost() {
                this.$Progress.start();
                this.form.post('api/post').then(() => {
                    toast.fire({
                        type: 'success',
                        title: 'Post created in successfully'
                    });
                    this.form.reset();
                    this.slug='';
                    this.hideSpanSlug = false;
                    this.stateTitle = false;
                    $('input[name=is_active]').prop('checked', false);
                    Fire.$emit('ResetTextarea');
                    Fire.$emit('ResetMainImage');
                    Fire.$emit('InsertSuccess');

                }).catch(() => {
                    this.$Progress.fail();
                });
                this.$Progress.finish();
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
                    Fire.$emit('UpdateTitleSeo',event.target.value);
                    this.stateTitle = true;
                    this.slug = ChangeToSlug(event.target.value);
                    this.form.slug = ChangeToSlug(event.target.value);

                } else {
                    this.stateTitle = false;
                    this.slug = '';
                    this.form.slug = '';
                }
            },
            changeDescription(event){
                Fire.$emit('UpdateDescriptionSeo',event.target.value);
            }
        },
        mounted() {
            $('input[name=is_active]').bootstrapToggle({
                on: 'Đăng',
                off: 'Không Đăng',
                width: '50%'
            });
            $('input[name=is_active]').change(function () {
                if ($(this).prop('checked'))
                    Fire.$emit('UpdateActive', 1);
                else
                    Fire.$emit('UpdateActive', 0);

            })
        },
        created() {
            Fire.$on('InsertTextarea', ($content) => {
                this.form.content = $content
            });
            Fire.$on('UpdateImgPrimary', ($content) => {
                this.form.img_primary = $content
            });
            Fire.$on('UpdateListIdCategory', ($content) => {
                this.form.list_id_category = $content.split(",");
            });
            Fire.$on('UpdateActive', ($content) => {
                this.form.is_active = $content
            });
            Fire.$on('UpdateTitleSeo', ($content) => {
                console.log('Title_seo');
                this.form.seo_title = $content
            });
            Fire.$on('UpdateDescriptionSeo', ($content) => {
                this.form.seo_description = $content
            });
            Fire.$on('UpdateImageSeo', ($content) => {
                this.form.seo_image = $content
            });
            Fire.$on('UpdateKeywordSeo', ($content) => {
                this.form.seo_keyword = $content
            });
            Fire.$on('UpdatePost', ($content) => {
                console.log($content);
                this.form.fill($content);
                if($content.is_active==1){
                    $('input[name=is_active]').prop('checked', true).change();
                }else{
                    $('input[name=is_active]').prop('checked', false).change();
                }
                Fire.$emit('UpdateTextarea',$content.description);
                Fire.$emit('UpdateSeo',$content.seos);
            });

        }
    }
</script>
