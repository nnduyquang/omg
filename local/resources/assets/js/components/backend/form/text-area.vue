<template>
    <textarea :id="id" name="description" placeholder="" class="form-control"></textarea>
</template>

<script>
    var mylib = require('../../../ulti');
    export default {
        props: ['form', 'id','height'],
        mounted() {
            var now_id = this.id;
            mylib.integratedCKEDITOR(this.id, this.height);
            CKEDITOR.instances[this.id].on('change', function () {
                Fire.$emit('InsertTextarea', {data: CKEDITOR.instances[now_id].getData(),id:now_id});
            });
        },
        created() {
            Fire.$on('ResetTextarea', () => {
                CKEDITOR.instances[this.id].setData('');
            });
//            Fire.$on('UpdateTextarea', ($content) => {
//                CKEDITOR.instances[this.id].setData($content);
//            });
            Fire.$on('UpdateTextarea', ($content) => {
                CKEDITOR.instances[$content.id].setData($content.data);
            });
        }
    }
</script>
