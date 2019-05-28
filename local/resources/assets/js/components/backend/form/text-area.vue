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
                Fire.$emit('UpdateTextarea',CKEDITOR.instances['content-post'].getData());
            });
        },
        created(){

        }
    }
</script>
