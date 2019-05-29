<template>
    <div id="seo-part" class="col-md-12 p-0">
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">SEO</h3>
            </div>
            <div class="card-body pad table-responsive">
                <div class="form-group">
                    <input @change="changeTitleSeo" type="text" name="title"
                           placeholder="Tiêu đề SEO" class="form-control" :value="title">
                </div>
                <div class="form-group">
                            <textarea @change="changeDescriptionSeo" id="description" name="description" placeholder="Mô tả ngắn về bài viết"
                                      class="form-control" :value="description">
                            </textarea>
                </div>
                <div class="form-group">
                    <main-image :pathImage="pathImage" idShow="showHinhMXH" idInputPath="pathImageMXH" idInputHidden="seo_image_id"></main-image>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Kiểm Tra SEO</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: ['title','description','pathImage'],
        methods:{
            changeTitleSeo(event){
                Fire.$emit('UpdateTitleSeo',event.target.value);
            },
            changeDescriptionSeo(event){
                Fire.$emit('UpdateDescriptionSeo',event.target.value);
            },

        },
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
