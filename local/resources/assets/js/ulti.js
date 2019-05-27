var token = $('meta[name="csrf-token"]').attr('content');
module.exports =  {
    getBaseURL:function() {
        var url = location.href;  // entire url including querystring - also: window.location.href;
        var baseURL = url.substring(0, url.indexOf('/', 14));
        if (baseURL.indexOf('http://localhost') != -1) {
            // Base Url for localhost
            var url = location.href;  // window.location.href;
            var pathname = location.pathname;  // window.location.pathname;
            var index1 = url.indexOf(pathname);
            var index2 = url.indexOf("/", index1 + 1);
            var baseLocalUrl = url.substr(0, index2);
            return baseLocalUrl + "/";
        }
        else {
            // Root Url for domain name
            return baseURL + "/";
        }
    },

    integratedCKEDITOR:function(elementID, height) {
        if ($('#' + elementID).length) {
            var editor1 = CKEDITOR.replace(elementID, {
                height: height,
                language: 'vi',
                format_tags: 'p;h1;h2;h3;pre',
                filebrowserBrowseUrl: this.getBaseURL(),
                filebrowserImageBrowseUrl: this.getBaseURL() + 'js/filemanager/dialog.php?type=1&editor=ckeditor&fldr=',
                extraAllowedContent: 'div',
            });
        }
    },
    responsive_filemanager_callback:function(field_id) {
        switch (field_id){
            // case 'multi_image_id':
            //     this.handle_multi_image_responsive_file_manager(field_id);
            //     break;
            case 'one_image_id':
                this.handle_one_image_responsive_file_manager(field_id);
                break;
            // case 'seo_image_id':
            //     this.handle_seo_image_responsive_file_manager(field_id);
            //     break;
        }

    },
    // async handle_seo_image_responsive_file_manager(field_id){
    //     var list_url = jQuery('#' + field_id).val();
    //     if (IsJsonString(list_url)) {
    //         var obj = JSON.parse(list_url);
    //         $('#showHinhMXH').show();
    //         $('#showHinhMXH').fadeIn("fast").attr('src', obj[0]);
    //         $('#pathImageMXH').val(obj[0]);
    //     }else{
    //         var path = list_url;
    //         $('#showHinhMXH').show();
    //         $('#showHinhMXH').fadeIn("fast").attr('src', path);
    //         $('#pathImageMXH').val(path);
    //     }
    // },
    // async handle_multi_image_responsive_file_manager(field_id){
    //     var list_url = jQuery('#' + field_id).val();
    //     if (IsJsonString(list_url)) {
    //         var obj = JSON.parse(list_url);
    //         obj.forEach(async function (data) {
    //             if (isImageExistsInTable(data)) {
    //                 return;
    //             }
    //             var path = data;
    //             var name = data.substr(data.lastIndexOf('/') + 1);
    //             let img = await getMeta(data);
    //             let width = img.width;
    //             let height = img.height;
    //             var obj_image = JSON.stringify({
    //                 path: path,
    //                 name: name,
    //                 width: width,
    //                 height: height
    //             }).replace(/"/g, "&quot;");
    //             var tr = '<tr class="data">'
    //                 + '<td><img src="' + path.replace('origins', 'thumbs') + '"></td>'
    //                 + '<td>' + name + '</td>'
    //                 + '<td>' + width + 'x' + height + '</td>'
    //                 + '<td><button class="remove_img" onclick="return false;">Xóa</button></td>'
    //                 + '   <input name="image_info[]" type="hidden" value="' + obj_image + '">'
    //                 + '</tr>';
    //             $('#add-image .table-img tbody').append(tr);
    //             $('#add-image tbody tr.data td button.remove_img').click(function (e) {
    //                 $(this).parent().parent().remove();
    //             });
    //         });
    //     } else {
    //         var path = list_url;
    //         if (!isImageExistsInTable(path)) {
    //             var name = list_url.substr(list_url.lastIndexOf('/') + 1);
    //             let img = await getMeta(list_url);
    //             let width = img.width;
    //             let height = img.height;
    //             var obj_image = JSON.stringify({
    //                 path: path,
    //                 name: name,
    //                 width: width,
    //                 height: height
    //             }).replace(/"/g, "&quot;");
    //             var tr = '<tr class="data">'
    //                 + '<td><img src="' + path.replace('origins', 'thumbs') + '"></td>'
    //                 + '<td>' + name + '</td>'
    //                 + '<td>' + width + 'x' + height + '</td>'
    //                 + '<td><button class="remove_img" onclick="return false;">Xóa</button></td>'
    //                 + '<input name="image_info[]" type="hidden" value="' + obj_image + '">'
    //                 + '</tr>'
    //             $('#add-image .table-img tbody').append(tr);
    //             $('#add-image tbody tr.data td button.remove_img').click(function (e) {
    //                 $(this).parent().parent().remove();
    //             });
    //         }
    //     }
    // },
    handle_one_image_responsive_file_manager(field_id){
        var list_url = jQuery('#' + field_id).val();
        if (IsJsonString(list_url)) {
            var obj = JSON.parse(list_url);
            $('#showHinh').show();
            $('#showHinh').fadeIn("fast").attr('src', obj[0]);
            $('#pathImage').val(obj[0]);
        }else{
            var path = list_url;
            $('#showHinh').show();
            $('#showHinh').fadeIn("fast").attr('src', path);
            $('#pathImage').val(path);
        }
    }
}