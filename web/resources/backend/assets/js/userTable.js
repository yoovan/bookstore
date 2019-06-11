layui.use(['element', 'table', 'layer', 'form'], function () {
    var element = layui.element;
    var table = layui.table;
    var layer = layui.layer;
    var $ = layui.jquery;
    var form = layui.form;
    table.render({
        elem: '#userList',
        url: 'all',
        page: true,
        // height: 550,
        id: 'tableList',
        cols: [[
            {type: 'checkbox', fixed: 'left'}
            , {field: 'id', title: 'ID', sort: true, fixed: 'left'}
            , {field: 'username', title: '用户名', sort: true}
            , {field: 'role_name', title: '角色', sort: true}
            , {field: 'phone', title: '手机号码'}
            , {title: '操作', fixed: 'right', align: 'center', toolbar: '#toolbar'}
        ]],
    });
    table.on('tool(test)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        var data = obj.data; //获得当前行数据
        var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
        var tr = obj.tr; //获得当前行 tr 的DOM对象

        if (layEvent === 'delete') { //删除
            layer.confirm('真的删除行么', function (index) {
                obj.del();
                $.ajax({
                    url: 'destroy',
                    type: 'post',
                    data: {
                      id: data.id
                    },
                    success: function (data) {
                        console.log("data: ", data);
                        if (data.code == 0) {
                            layer.close(index);
                        }
                        layer.msg(data.msg);
                    },
                    error: function (err) {
                        layer.msg(err.msg);
                    }
                });
            });
        } else if (layEvent === 'edit') { //编辑
            console.log("data: " + data.username);
            layer.open({
                type: 1,
                title: '编辑',
                content: $('#testDemo'),
                area: ['900px', '500px']
            });
            form.val("editForm", {
                username: data.username,
                phone: data.phone,
                role_type: data.role_type
            });
            form.render();
        }
    });
});
