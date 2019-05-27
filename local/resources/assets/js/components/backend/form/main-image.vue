<template>
    <div class="form-group">
        <input id="pathImage" type="text" name="image">
        <input id="one_image_id" type="hidden" name="image">
        <a @click="openPopup('js/filemanager/dialog.php?type=1&popup=1&field_id=one_image_id')" class="btn iframe-btn" type="button">Thêm Hình</a>
        <img src="" id="showHinh" class="show-image" alt="">
    </div>
</template>

<script>
    var mylib = require('../../../ulti');
    export default {
        methods:{
          openPopup(url){
              var w = 880;
              var h = 570;
              var l = Math.floor((screen.width-w)/2);
              var t = Math.floor((screen.height-h)/2);
              var win = window.open(url, 'ResponsiveFilemanager', "scrollbars=1,width=" + w + ",height=" + h + ",top=" + t + ",left=" + l);
          }
        },
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
