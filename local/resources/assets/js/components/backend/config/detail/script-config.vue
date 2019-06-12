<template>
    <form @submit.prevent="updateConfig()">
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label>Cài Đặt Code Trong header</label>
                    <textarea rows="10" v-model="formInfo.config_script_header" name="description"
                              placeholder="Cài Đặt Code Trong Header" class="form-control">
                        </textarea>
                </div>
                <div class="form-group">
                    <label>Cài Đặt Code Trước Thẻ /body</label>
                    <textarea rows="10" v-model="formInfo.config_script_body" name="description"
                              placeholder="Cài Đặt Code Trong Header" class="form-control">
                        </textarea>
                </div>
                <div class="col-md-12 text-center">
                    <button type="submit" class="btn btn-primary">Lưu Cấu Hình</button>
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

        }
    }
</script>
