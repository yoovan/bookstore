layui.use(['table', 'layer', 'element'], function () {
    var table = layui.table,
        layer = layui.layer,
        element = layui.element,
        $ = layui.jquery;
    table.render({
        elem: "#carouselList",
        url: 'carouselList',
        page: true,
        id: "carouselTable",
        cols: [[
            {type: 'checkbox'},
            {field: 'title', title: "书名", sort: true},
            {field: 'author', title: '作者'},
            {title: '操作', toolbar: '#toolbar', align: 'center'}
        ]]
    });
    table.on("tool(carouselList)", function (obj) {
        var data = obj.data;
        var layEvent = obj.event;
        if (layEvent === "delete") {
            console.log(data);
            layer.confirm("确认取消轮播吗？", function (index) {
                $.ajax({
                    url: '/book_server/admin/product/status',
                    method: 'post',
                    data: {
                        id: data.id,
                        type: 0
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
});