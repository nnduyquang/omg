<template>
    <div class="card">
        <div class="card-header d-flex p-0">
            <h3 class="card-title p-3">Cấu Hình</h3>
            <ul class="nav nav-pills ml-auto p-2">
                <li class="nav-item"><a class="nav-link active show" href="#tab_1" data-toggle="tab">Thông Tin Doanh Nghiệp</a></li>
                <li class="nav-item"><a class="nav-link" href="#tab_2" data-toggle="tab">Cấu Hình Email</a></li>
                <li class="nav-item"><a class="nav-link" href="#tab_3" data-toggle="tab">Cài Đặt Script</a></li>
                <li class="nav-item"><a class="nav-link" href="#tab_4" data-toggle="tab">Slider</a></li>
            </ul>
        </div><!-- /.card-header -->
        <div class="card-body">
            <div class="tab-content">
                <div class="tab-pane active show" id="tab_1">
                   <info-config></info-config>
                </div>
                <!-- /.tab-pane -->
                <div class="tab-pane" id="tab_2">
                    <email-config></email-config>
                </div>
                <!-- /.tab-pane -->
                <div class="tab-pane" id="tab_3">
                   <script-config></script-config>
                </div>
                <div class="tab-pane" id="tab_4">
                    <slider-config></slider-config>
                </div>
                <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
        </div><!-- /.card-body -->
    </div>
</template>

<script>
    export default {
        data() {
            return {
                form: {},
            }
        },
        methods:{
            updateConfig($content) {
                this.$Progress.start();
                this.form=new Form($content);
                this.form.post('api/config').then(() => {
                    toast.fire({
                        type: 'success',
                        title: 'Cập nhật cấu hình thành công'
                    });
                    // this.form.reset();
                    Fire.$emit('LoadConfig');

                }).catch(() => {
                    this.$Progress.fail();
                });
                this.$Progress.finish();
            },
            loadConfigs() {
                axios.get('api/config-info').then(response=>{
                    this.form=response.data;
                    Fire.$emit('SetInfoConfig', this.form);
                    Fire.$emit('UpdateTextarea', {data: response.data.config_describe_contact,id: 'content-contact'});
                });
            },
        },
        mounted() {
            console.log('Component mounted.')
        },
        created() {
            this.loadConfigs();
            Fire.$on('LoadConfig', () => {
                this.loadConfigs();
            });
            Fire.$on('UpdateConfig', ($content) => {
                this.updateConfig($content);
            });

        }
    }
</script>
