layui.use(['element', 'form', 'table', 'layer'], function () {
    var element = layui.element,
        form = layui.form,
        table = layui.table,
        layer = layui.layer,
        $ = layui.jquery;
    var requestTable = {
        elem: '#bookList',
        url: 'all',
        page: true,
        id: 'bookTable',
        cols: [[
            {type: 'checkbox'},
            {filed: 'book_no', title: '图书编号', sort: true},
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
                book_no: data.book_no,
                title: data.title,
                author: data.author,
                price: data.price,
                series: data.series,
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