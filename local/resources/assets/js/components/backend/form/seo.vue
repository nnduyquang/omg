<template>
    <div id="seo-part" class="col-md-12 p-0">
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">SEO</h3>
            </div>
            <div class="card-body pad table-responsive">
                <div class="form-group">
                    <input v-model="form.seo_keyword"  @change="changeKeywordSeo" type="text" name="keywordSeo"
                           placeholder="Từ khóa cần SEO, tốt nhất là duy nhất 1 từ, nếu nhiều từ thì cách nhau dấu phẩy ','"
                           class="form-control">
                </div>
                <div class="form-group">
                    <input v-model="form.seo_title" @change="changeTitleSeo" type="text" name="titleSeo"
                           placeholder="Tiêu đề SEO" class="form-control">
                </div>
                <div class="form-group">
                            <textarea v-model="form.seo_description" @change="changeDescriptionSeo" id="description" name="descriptionSeo" placeholder="Mô tả ngắn về bài viết"
                                      class="form-control" >
                            </textarea>
                </div>
                <div class="form-group">
                    <main-image :pathImage="form.seo_image" idShow="showHinhMXH" idInputPath="pathImageMXH" idInputHidden="seo_image_id"></main-image>
                </div>
                <div v-if="type==0" class="modal-footer">
                    <button  type="submit" class="btn btn-success">Kiểm Tra SEO</button>
                </div>

            </div>
        </div>
    </div>
</template>

<script>
    export default {
        // props: ['form','type'],
        props: {
            form: Object,
            type:{
                type:Number,
                default: 0
            }
        },

        data(){
            return {

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
            // Fire.$on('UpdateSeo', ($content) => {
            //     $('input[name=keywordSeo]').val($content.seo_keyword);
            //     $('input[name=titleSeo]').val($content.seo_title);
            //     $('textarea[name=descriptionSeo]').val($content.seo_description);
            // });
        }
    }
</script>
