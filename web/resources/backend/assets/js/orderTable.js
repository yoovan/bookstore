layui.use(['element', 'table', 'layer'], function () {
    var element = layui.element,
        table = layui.table,
        layer = layui.layer;
    table.render({
        elem: '#orderList',
        url: 'all',
        cols: [[
            {type: 'checkbox'},
            {field: 'order_no', title: '订单编号', sort: true},
            {field: 'username', title: '下单用户'},
            {field: 'product_count', title: '商品数量'},
            {field: 'order_amount_total', title: '实付金额'},
            {field: 'status_name', title: '订单状态'}
        ]],
        page: true,
        id: 'orderTable'
    });
    table.on('tool(orderList)', function () {
        
    });
});