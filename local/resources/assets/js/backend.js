$('#add-image tbody tr.data td button.remove_img').click(function (e) {
    $(this).parent().parent().remove();
});
async function getMeta(url) {
    return new Promise((resolve, reject) => {
        let img = new Image();
        img.onload = () => resolve(img);
        img.onerror = reject;
        img.src = url;
    });
}
function IsJsonString(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}
function isImageExistsInTable(path) {
    var checkExists = false;
    $('#add-image tbody tr.data').each(function () {
        var obj = $(this).find('input').first().val();
        if (path.includes(JSON.parse(obj).path) ) {
            checkExists = true;
            return false;
        }
    });
    return checkExists;
}



async function responsive_filemanager_callback(field_id) {
    switch (field_id){
        case 'multi_image_id':
            handle_multi_image_responsive_file_manager(field_id);
            break;
        case 'one_image_id':
            handle_one_image_responsive_file_manager(field_id);
            break;
        case 'seo_image_id':
            handle_seo_image_responsive_file_manager(field_id);
            break;
    }

}
async function handle_one_image_responsive_file_manager(field_id){
    var list_url = jQuery('#' + field_id).val();
    if (IsJsonString(list_url)) {
        var obj = JSON.parse(list_url);
        $('#showHinh').show();
        $('#showHinh').fadeIn("fast").attr('src', obj[0]);
        $('#pathImage').val(obj[0]).trigger('change');
    }else{
        var path = list_url;
        $('#showHinh').show();
        $('#showHinh').fadeIn("fast").attr('src', path);
        $('#pathImage').val(path).trigger('change');
    }
}
async function handle_seo_image_responsive_file_manager(field_id){
    var list_url = jQuery('#' + field_id).val();
    if (IsJsonString(list_url)) {
        var obj = JSON.parse(list_url);
        $('#showHinhMXH').show();
        $('#showHinhMXH').fadeIn("fast").attr('src', obj[0]);
        $('#pathImageMXH').val(obj[0]);
    }else{
        var path = list_url;
        $('#showHinhMXH').show();
        $('#showHinhMXH').fadeIn("fast").attr('src', path);
        $('#pathImageMXH').val(path);
    }
}
async function handle_multi_image_responsive_file_manager(field_id){
    var list_url = jQuery('#' + field_id).val();
    if (IsJsonString(list_url)) {
        var obj = JSON.parse(list_url);
        obj.forEach(async function (data) {
            if (isImageExistsInTable(data)) {
                return;
            }
            var path = data;
            var name = data.substr(data.lastIndexOf('/') + 1);
            let img = await getMeta(data);
            let width = img.width;
            let height = img.height;
            var obj_image = JSON.stringify({
                path: path,
                name: name,
                width: width,
                height: height
            }).replace(/"/g, "&quot;");
            var tr = '<tr class="data">'
                + '<td><img src="' + path.replace('origins', 'thumbs') + '"></td>'
                + '<td>' + name + '</td>'
                + '<td>' + width + 'x' + height + '</td>'
                + '<td><button class="remove_img" onclick="return false;">Xóa</button></td>'
                + '   <input name="image_info[]" type="hidden" value="' + obj_image + '">'
                + '</tr>';
            $('#add-image .table-img tbody').append(tr);
            $('#add-image tbody tr.data td button.remove_img').click(function (e) {
                $(this).parent().parent().remove();
            });
        });
    } else {
        var path = list_url;
        if (!isImageExistsInTable(path)) {
            var name = list_url.substr(list_url.lastIndexOf('/') + 1);
            let img = await getMeta(list_url);
            let width = img.width;
            let height = img.height;
            var obj_image = JSON.stringify({
                path: path,
                name: name,
                width: width,
                height: height
            }).replace(/"/g, "&quot;");
            var tr = '<tr class="data">'
                + '<td><img src="' + path.replace('origins', 'thumbs') + '"></td>'
                + '<td>' + name + '</td>'
                + '<td>' + width + 'x' + height + '</td>'
                + '<td><button class="remove_img" onclick="return false;">Xóa</button></td>'
                + '<input name="image_info[]" type="hidden" value="' + obj_image + '">'
                + '</tr>'
            $('#add-image .table-img tbody').append(tr);
            $('#add-image tbody tr.data td button.remove_img').click(function (e) {
                $(this).parent().parent().remove();
            });
        }
    }
}
// $("#add-image tbody").sortable({
//     items: "> tr:not(:first)",
//     appendTo: "parent",
//     helper: "clone"
// }).disableSelection();