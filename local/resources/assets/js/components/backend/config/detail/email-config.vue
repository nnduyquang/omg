<template>
    <form @submit.prevent="updateConfig()">
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label>Email Nhận Thông Tin</label>
                    <input v-model="formInfo.config_email_receive" type="text" name=""
                           placeholder="Email Nhận Thông Tin" class="form-control">
                </div>
                <div class="form-group">
                    <label>Tiêu Đề Email Khách Hàng Nhận Phản Hồi</label>
                    <input v-model="formInfo.config_email_sender_subject" type="text" name=""
                           placeholder="Tiêu Đề Email Khách Hàng Nhận Phản Hồi" class="form-control">
                </div>
                <div class="form-group">
                    <label>From Email Khách Hàng Nhận Phản Hồi</label>
                    <input v-model="formInfo.config_email_sender_from" type="text" name=""
                           placeholder="From Email Khách Hàng Nhận Phản Hồi" class="form-control">
                </div>
                <div class="form-group">
                    <label>Tiêu Đề Email Nhận Thông Tin Từ Khách Hàng</label>
                    <input v-model="formInfo.config_email_receive_subject" type="text" name=""
                           placeholder="Tiêu Đề Email Nhận Thông Tin Từ Khách Hàng" class="form-control">
                </div>
                <div class="form-group">
                    <label>From Email Nhận Thông Tin Từ Khách Hàng</label>
                    <input v-model="formInfo.config_email_receive_from" type="text" name=""
                           placeholder="From Email Nhận Thông Tin Từ Khách Hàng" class="form-control">
                </div>
                <div class="form-group">
                    <label>Nội Dung Gửi Cho Khách Hàng</label>
                    <text-area height="300" id="content-to-customer" :form="formInfo"></text-area>
                </div>
                <div class="form-group">
                    <label>Chữ Ký Mail</label>
                    <text-area height="300" id="content-signatures" :form="formInfo"></text-area>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <button type="submit" class="btn btn-success">Lưu Cấu Hình</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</template>
<script>
    export default {
        data: function () {
            return {
                formInfo: {}
            }
        },
        methods: {
            updateConfig() {
                Fire.$emit('UpdateConfig', this.formInfo);
            },
        },
        mounted() {
            console.log('Component mounted.')
        },
        created() {
            Fire.$on('InsertTextarea', ($content) => {
                if ($content.id == 'content-to-customer')
                    this.formInfo.config_email_content_to_customer = $content.data;
                if ($content.id == 'content-signatures')
                    this.formInfo.config_email_signatures = $content.data;
            });
            Fire.$on('SetInfoConfig', ($content) => {
                this.formInfo = $content
            });

        }
    }
</script>
