<template>
     <textarea id="content-post" v-model="form.content" name="description"
               placeholder=""
               class="form-control"
               :class="{ 'is-invalid': form.errors.has('description') }">
                            </textarea>
</template>

<script>
    var mylib = require('../../../ulti');
    export default {
        props: ['form'],
        mounted() {
            mylib.integratedCKEDITOR('content-post', 800);
            CKEDITOR.instances['content-post'].on('change', function () {
                Fire.$emit('InsertTextarea',CKEDITOR.instances['content-post'].getData());
            });
        },
        created(){
            Fire.$on('ResetTextarea', () => {
                CKEDITOR.instances['content-post'].setData('');
            });
            Fire.$on('UpdateTextarea', ($content) => {
                CKEDITOR.instances['content-post'].setData($content);
            });
        }
    }
</script>
