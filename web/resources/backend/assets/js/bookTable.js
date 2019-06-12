layui.use(['element', 'form', 'table', 'layer', 'upload'], function () {
    var element = layui.element,
        form = layui.form,
        table = layui.table,
        layer = layui.layer,
        upload=layui.upload,
        $ = layui.jquery;
    var requestTable = {
        elem: '#bookList',
        url: 'all',
        page: true,
        id: 'bookTable',
        cols: [[
            {type: 'checkbox'},
            {field: 'title', title: "书名", sort: true},
            {field: 'author', title: '作者'},
            {field: 'publishing_house', title: '出版社'},
            {field: 'publishing_time', title: '出版时间'},
            {field: 'upper_time', title: '上架时间'},
            {title: '操作', toolbar: '#toolbar', align: 'center'}
        ]]
    };
    table.render(requestTable);
    var layEdit;
    table.on('tool(bookList)', function (obj) {
        console.log(obj);
        var data = obj.data;
        var layEvent = obj.event;
        if (layEvent === "edit") {
            layEdit = layer.open({
                type: 1,
                title: '编辑',
                content: $('#editForm'),
                area: ['900px', '500px']
            });
            form.val("editForm", {
                id: data.id,
                isbn: data.isbn,
                title: data.title,
                author: data.author,
                price: data.price,
                series: data.series,
                type: data.type,
                category_id: data.category_id,
                publishing_house: data.publishing_house,
                publishing_time: data.publishing_time,
                upper_time: data.upper_time,
                format: data.format,
                page_size: data.page_size,
                edition: data.edition,
                summary: data.summary,
                catalogue: data.catalogue
            });
            form.render();
        } else if (layEvent === 'delete') {
            layer.confirm("确定删除这个商品吗？", function (index) {
                $.ajax({
                    url: 'remove',
                    method: 'post',
                    data: {
                        id: data.id
                    },
                    success: function (data) {
                        obj.del();
                        layer.msg(data.msg);
                    },
                    error: function (err) {
                        console.log(err);
                        layer.msg("操作失败");
                    }
                });
            });
        }
    });
    //执行实例
    var uploadThumb = upload.render({
        elem: '#thumb', //绑定元素,
        // auto: false,
        url: 'upload', //上传接口
        done: function (res) {
            //上传完毕回调
            console.log(res);
            var filename = res.data[0];
            $("input[type=hidden][name=thumb]").val("/resources/upload/" + filename);
            layer.msg("上传成功");
        }
        , error: function () {
            //请求异常回调
            layer.msg("上传失败");
        }
    });
    var uploadCarousel = upload.render({
        elem: '#carousel', //绑定元素,
        // auto: false,
        url: 'upload', //上传接口
        done: function (res) {
            //上传完毕回调
            var filename = res.data[0];
            $("input[type=hidden][name=carousel]").val("/resources/upload/" + filename);
            layer.msg("上传成功");
        }
        , error: function () {
            //请求异常回调
            layer.msg("上传失败");
        }
    });
    form.on("submit(submitBtn)", function (data) {
        $.ajax({
            url: 'edit',
            method: "post",
            data: data.field,
            success: function (data) {
                layer.close(layEdit);
                layer.msg(data.msg);
                table.render(requestTable);
            },
            error: function (err) {
                console.log(err);
                layer.msg("操作失败");
            }
        });
    });
});