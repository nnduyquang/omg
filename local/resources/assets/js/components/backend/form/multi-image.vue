<template>
    <div id="multi-image">
        <input id="multi_image_id" type="hidden">
        <a @click="openPopup('js/filemanager/dialog.php?type=1&popup=1&field_id=multi_image_id')" class="btn iframe-btn"
           type="button">Thêm Hình</a>
        <div class="form-group">
            <div id="add-image" class="row">
                <table class="table table-img">
                    <tbody>
                    <tr>
                        <th>Hình</th>
                        <th>Tên</th>
                        <th>Kích thước</th>
                        <th>Hành động</th>
                    </tr>
                    <tr class="data" v-for="image in list_images">
                        <td><img :src="image.path"></td>
                        <td>{{image.name}}</td>
                        <td>{{image.width}} x {{image.height}}</td>
                        <td>
                            <button class="remove_img" @click.prevent='removeItem(image)'>Xóa</button>
                        </td>
                        '
                        <input name="image_info[]" type="hidden" :value="image.obj_image">
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</template>

<script>
    export default {
        props: ['form', 'editMode'],
        data() {
            return {
                width: '',
                height: '',
                list_images: []
            }
        },
        methods: {
            openPopup(url) {

                var w = 880;
                var h = 570;
                var l = Math.floor((screen.width - w) / 2);
                var t = Math.floor((screen.height - h) / 2);
                var win = window.open(url, 'ResponsiveFilemanager', "scrollbars=1,width=" + w + ",height=" + h + ",top=" + t + ",left=" + l);
            },
            getMeta(url) {
                return new Promise((resolve, reject) => {
                    let img = new Image();
                    img.onload = () => resolve(img);
                    img.onerror = reject;
                    img.src = url;
                });
            },
            IsJsonString(str) {
                try {
                    JSON.parse(str);
                } catch (e) {
                    return false;
                }
                return true;
            },
            removeItem(image) {
                this.list_images.splice(this.list_images.indexOf(image), 1);
                Fire.$emit('InsertListImage',this.list_images);
            }
        },
        mounted() {
            $("#multi_image_id").change(function () {
                let list_img = $('#multi_image_id').val();
                if (IsJsonString(list_img)) {
                    $.each(JSON.parse(list_img), function (key, value) {
                        let img = getMeta(value).then(function (defs) {
                            Fire.$emit('UpdateImageDimension', [defs, value]);

                        });
                    });
                } else {
                    let img = getMeta(list_img).then(function (defs) {
                        Fire.$emit('UpdateImageDimension', [defs, list_img]);
                    });
                }
                // // let img=$('input[name*="image_info"]').val();
                // // console.log(img);
                // $('input[name^="image_info"]').each(function() {
                //     console.log($(this).val());
                // });
                // Fire.$emit('UpdateImageSeo', img);


            });

        },
        created() {
            Fire.$on('UpdateImageDimension', ($content) => {
                this.width = $content[0].width;
                this.height = $content[0].height;
                let name = $content[1].substr($content[1].lastIndexOf('/') + 1);
                let obj_image = JSON.stringify({
                    path: $content[1],
                    name: name,
                    width: this.width,
                    height: this.height
                });
                const image = {
                    path: $content[1].replace('origins', 'thumbs'),
                    name: name, //name here
                    width: this.width,
                    height: this.height,
                    obj_image: obj_image
                }
                this.list_images.push(image);
                Fire.$emit('InsertListImage',this.list_images);
            });
            Fire.$on('UpdateListImage',($content)=>{
                let list=[];
                $.each(JSON.parse($content), function (key, value) {
                    let obj_image = JSON.stringify({
                        path: value.path,
                        name: value.name,
                        width: value.width,
                        height: value.height
                    });

                    const image = {
                        path: value.path.replace('origins', 'thumbs'),
                        name: value.name, //name here
                        width: value.width,
                        height: value.height,
                        obj_image: obj_image
                    }
                    list.push(image);
                    console.log(list);
                });
                this.list_images=list;
            });
        },
    }
</script>
