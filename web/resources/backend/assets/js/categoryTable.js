layui.use(['element', 'table', 'layer', 'form'], function () {
    var elelment = layui.element,
        table = layui.table,
        layer = layui.layer,
        form = layui.form,
        $ = layui.jquery;
    var requestTable = {
        elem: "#categoryList",
        url: 'all',
        page: true,
        id: 'categoryTable',
        cols: [[
            {type: 'checkbox'},
            {field: 'id', title: "id", sort: true},
            {field: 'name', title: "分类名称", sort: true},
            {field: 'pname', title: '父级分类'},
            {title: "操作", align: 'center', toolbar: '#toolbar'}
        ]]
    };
    table.render(requestTable);
    var layerEdit;
    table.on("tool(categoryList)", function (obj) {
        var data = obj.data;
        var layEvent = obj.event;
        if (layEvent === 'edit') {
            console.log(data);
            layerEdit = layer.open({
                type: 1,
                title: '编辑',
                content: $("#editForm"),
                area: ['900px', '500px']
            });
            form.val("editForm", {
                name: data.name,
                pid: data.pid,
                type: data.type
            });
            form.render();
        } else if (layEvent === 'delete') {
            layer.confirm("确定删除这个分类吗？", function (index) {
                $.ajax({
                    url: 'remove',
                    method: 'post',
                    data: {
                        id: data.id
                    },
                    success: function (data) {
                        layer.msg(data.msg);
                        table.render(requestTable);
                    },
                    error: function (err) {
                        console.log(err);
                        layer.msg("操作失败");
                    }
                });
            })
        }
    });
});