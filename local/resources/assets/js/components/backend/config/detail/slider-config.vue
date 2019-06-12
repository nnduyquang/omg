<template>
    <form @submit.prevent="updateConfig()">
        <div class="row">
            <div class="col-md-12">
                <multi-image :form="formInfo"></multi-image>
            </div>
            <div class="col-md-12">
                <div class="col-md-12 text-center">
                    <button type="submit" class="btn btn-success">Lưu Cấu Hình</button>
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

            Fire.$on('SetInfoConfig', ($content) => {
                this.formInfo = $content
            });
            Fire.$on('InsertListImage', ($content) => {
                let arrayImageList = [];
                $.each($content, function (key, value) {
                    arrayImageList.push(value.obj_image)
                });
                if (arrayImageList.length == 0) {
                    this.formInfo.config_slider = '';
                } else {
                    this.formInfo.config_slider = arrayImageList;
                }
            });

        }
    }
</script>
