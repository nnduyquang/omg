<template>
    <form @submit.prevent="updateConfig()">
        <div class="row">
            <div class="col-md-12 ">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">Giới Thiệu Công Ty</h3>
                            </div>
                            <div class="card-body pad table-responsive">
                                <div class="form-group">
                                    <input @change="changeTitle" v-model="formInfo.config_title" type="text" name=""
                                           placeholder="Tên Doanh Nghiệp" class="form-control">
                                </div>
                                <div class="form-group">
                <textarea @change="changeDescription" v-model="formInfo.config_descrtiption" name="description"
                          placeholder="Mô tả ngắn về doanh nghiệp" class="form-control">
                </textarea>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">Logo Công Ty</h3>
                            </div>
                            <div class="card-body pad table-responsive">
                                <main-image :pathImage="formInfo.config_logo" idShow="showHinh" idInputPath="pathImage"
                                            idInputHidden="one_image_id"></main-image>
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="card card-primary card-outline">
                        <div class="card-header">
                            <h3 class="card-title">Mô Tả Liên Hệ</h3>
                        </div>
                        <div class="card-body pad table-responsive">
                            <text-area :form="formInfo"></text-area>
                        </div>
                    </div>
                </div>
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">Thông Tin Liên Hệ</h3>
                    </div>
                    <div class="card-body pad table-responsive">
                        <div class="form-group">
                            <input v-model="formInfo.config_address" type="text" name="" placeholder="Địa Chỉ"
                                   class="form-control">
                        </div>
                        <div class="form-group">

                            <input v-model="formInfo.config_phone" type="text" name="" placeholder="Điện Thoại Liên Hệ"
                                   class="form-control">

                        </div>
                        <div class="form-group">
                            <input v-model="formInfo.config_hotline_show" type="text" name=""
                                   placeholder="Số Hotline Trên Mobile(duy nhất 1 số)" class="form-control">
                        </div>
                        <div class="form-group">
                            <input v-model="formInfo.config_info_email" type="text" name="" placeholder="Email Công Ty"
                                   class="form-control">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <seos :form="formInfo" :type=1></seos>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <button type="submit" class="btn btn-primary">Lưu Cấu Hình</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</template>

<script>
    export default {
        data: function ()  {
            return {
                formInfo:{}
            }
        },
        methods: {
            updateConfig() {
                Fire.$emit('UpdateConfig', this.formInfo);
            },
            changeTitle(event) {
                Fire.$emit('UpdateTitleSeo', event.target.value);
            },
            changeDescription(event) {
                Fire.$emit('UpdateDescriptionSeo', event.target.value);
            },
        },
        mounted() {
            console.log('Component mounted.')
        },
        created() {
            Fire.$on('UpdateImgPrimary', ($content) => {
                this.formInfo.config_logo = $content
            });
            Fire.$on('UpdateImageSeo', ($content) => {
                this.formInfo.seo_image = $content
            });
            Fire.$on('UpdateTitleSeo', ($content) => {
                this.formInfo.seo_title = $content
            });
            Fire.$on('UpdateDescriptionSeo', ($content) => {
                this.formInfo.seo_description = $content
            });
            Fire.$on('InsertTextarea', ($content) => {
                this.formInfo.config_describe_contact = $content
            });
            Fire.$on('SetInfoConfig', ($content) => {
                this.formInfo = $content
            });

        }
    }
</script>
