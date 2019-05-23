<template>
    <div>
        <div class="row mb-2">
            <div class="col-md-12">
                <h1>Thêm Mới Bài Viết</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="card card-primary card-outline">
                    <div class="card-body pad table-responsive">
                        <form @submit.prevent=""
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
                                      placeholder="Mô tả ngắn về bài viết"
                                      class="form-control"
                                      :class="{ 'is-invalid': form.errors.has('description') }">
                            </textarea>
                                    <has-error :form="form" field="description"></has-error>
                                </div>
                                <div class="form-group">
                            <vue-editor v-model="form.content">
                            </vue-editor>
                                    <has-error :form="form" field="description"></has-error>
                                </div>
                                <!--<div class="form-group">-->
                                <span>Kích hoạt</span>
                                <input name="is_active" type="checkbox"
                                       data-toggle="toggle">
                                <!--</div>-->

                            </div>
                            <div class="modal-footer">
                                <button v-show="editMode" type="submit" class="btn btn-success">Cập Nhật</button>
                                <button v-show="!editMode" type="submit" class="btn btn-primary">Tạo Mới</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.card -->
                </div>
            </div>
            <div class="col-md-4">
                <div class="card card-primary card-outline">
                    <div class="card-body pad table-responsive">

                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import {VueEditor} from 'vue2-editor'
    import { ImageDrop } from "quill-image-drop-module";
    import ImageResize from "quill-image-resize-module"
    export default {
        data() {
            return {
                stateTitle: false,
                hideSpanSlug: false,
                editMode: false,
                slug: '',
                formSort: new Form({
                    listSort: '',
                }),
                form: new Form({
                    id: '',
                    title: '',
                    slug: '',
                    description: '',
                    content:'',
                    is_active: 0,
                    type: 0
                }),
                customModulesForEditor: [
                    { alias: "imageDrop", module: ImageDrop },
                    { alias: "imageResize", module: ImageResize }
                ],
                editorSettings: {
                    modules: {
                        imageDrop: true,
                        imageResize: {}
                    }
                }

            }
        },
        methods: {
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
        },
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
