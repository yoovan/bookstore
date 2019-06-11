layui.use(['element', 'table', 'layer'], function () {
    var elelment = layui.element,
        table = layui.table,
        layer = layui.layer;
    table.render({
        elem: "#categoryList",
        page: true,
        cols: [[
            {type: 'checkbox'},
            {field: 'id', title: "id", sort: true},
            {field: 'name', title: "分类名称", sort: true},
            {field: 'pname', title: '父级分类'},
            {title: "操作", align: 'center', toolbar: '#toolbar'}
        ]],
        data: json.data,
        id: 'categoryTable'
    });
});