<template>
    <div class="form-group">
        <input :value="pathImage" class="form-control" :id="idInputPath" type="text" name="image">
        <input :id="idInputHidden" type="hidden" name="image">
        <a @click="openPopup('js/filemanager/dialog.php?type=1&popup=1&field_id=')" class="btn iframe-btn"
           type="button">Thêm Hình</a>
        <img :src="pathImage" :id="idShow" class="show-image" alt="">
    </div>
</template>

<script>
    var mylib = require('../../../ulti');
    export default {
        props: ['idInputHidden', 'idInputPath', 'idShow', 'pathImage'],

        methods: {
            openPopup(url) {
                var w = 880;
                var h = 570;
                var l = Math.floor((screen.width - w) / 2);
                var t = Math.floor((screen.height - h) / 2);
                var win = window.open(url + this.idInputHidden, 'ResponsiveFilemanager', "scrollbars=1,width=" + w + ",height=" + h + ",top=" + t + ",left=" + l);
            },
            changeImageSeo(event) {
                Fire.$emit('UpdateImageSeo', event.target.value);
            }
        },
        mounted() {
            if(this.idInputHidden=='one_image_id'){
                $("#" + this.idInputPath).change(function () {
                    let img = $(this).val().toString();
                    Fire.$emit('UpdateImgPrimary', img);
                    Fire.$emit('UpdateImageSeo', img);
                });
            }
        },
        updated(){
            if(this.idInputHidden=='seo_image_id') {
                $("#" + this.idInputPath).change(function () {
                    let img = $(this).val().toString();
                    Fire.$emit('UpdateImageSeo', img);
                });
            }
        },
        created(){
            Fire.$on('ResetMainImage', () => {
                // CKEDITOR.instances['content-post'].setData('');
            });
        }

    }
</script>
