<template>
    <div id="seo-part" class="col-md-12 p-0">
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">SEO</h3>
            </div>
            <div class="card-body pad table-responsive">
                <div class="form-group">
                    <input  @change="changeKeywordSeo" type="text" name="keywordSeo"
                           placeholder="Từ khóa cần SEO, tốt nhất là duy nhất 1 từ, nếu nhiều từ thì cách nhau dấu phẩy ','"
                           class="form-control">
                </div>
                <div class="form-group">
                    <input @change="changeTitleSeo" type="text" name="titleSeo"
                           placeholder="Tiêu đề SEO" class="form-control" :value="title">
                </div>
                <div class="form-group">
                            <textarea @change="changeDescriptionSeo" id="description" name="descriptionSeo" placeholder="Mô tả ngắn về bài viết"
                                      class="form-control" >
                            </textarea>
                </div>
                <div class="form-group">
                    <main-image v-show="!editMode" :pathImage="pathImage" idShow="showHinhMXH" idInputPath="pathImageMXH" idInputHidden="seo_image_id"></main-image>
                    <main-image v-show="editMode" :pathImage="pathImageSeo" idShow="showHinhMXH" idInputPath="pathImageMXH" idInputHidden="seo_image_id"></main-image>
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
        props: ['editMode','title','description','pathImage'],
//        props: {
//            title: {
//                type: Object
//            },
//            description: {
//                type: Object
//            },
//            pathImage: {
//                type: Object
//            }
//        },
        data(){
            return {
//                title: this.title,
//                description:this.description,
//                keywordSeo:'',
                pathImageSeo:''
            }

        },
        methods:{
            changeTitleSeo(event){
                Fire.$emit('UpdateTitleSeo',event.target.value);
            },
            changeDescriptionSeo(event){
                Fire.$emit('UpdateDescriptionSeo',event.target.value);
            },
            changeKeywordSeo(event){
                Fire.$emit('UpdateKeywordSeo',event.target.value);
            }

        },
        mounted() {
            console.log('Component mounted.')
        },
        created(){
            Fire.$on('UpdateSeo', ($content) => {
                $('input[name=keywordSeo]').val($content.seo_keyword);
                $('input[name=titleSeo]').val($content.seo_title);
                $('textarea[name=descriptionSeo]').val($content.seo_description);
//                this.title = $content.seo_title;
//                this.description = $content.seo_description;
//                this.keywordSeo = $content.seo_keyword;
                this.pathImageSeo = $content.seo_image;
            });
        }
    }
</script>
