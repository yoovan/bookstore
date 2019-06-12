layui.use(['table', 'layer', 'element'], function () {
    var table = layui.table,
        layer = layui.layer,
        element = layui.element;
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
});