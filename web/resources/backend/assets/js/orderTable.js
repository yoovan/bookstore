layui.use(['element', 'table', 'layer'], function () {
    var element = layui.element,
        table = layui.table,
        layer = layui.layer;
    table.render({
        elem: '#orderList',
        cols: [[
            {type: 'checkbox'},
            {field: 'order_no', title: '订单编号', sort: true},
            {field: 'username', title: '下单用户'},
            {field: 'product_count', title: '商品数量'},
            {field: 'order_amount_total', title: '实付金额'},
            {field: 'status', title: '订单状态'},
            {title: '操作', align: 'center', toolbar: '#toolbar'}
        ]],
        data: json.data,
        page: true,
        id: 'orderTable'
    });
    table.on('tool(orderList)', function () {
        
    });
});