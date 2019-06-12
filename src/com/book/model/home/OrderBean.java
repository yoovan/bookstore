package com.book.model.home;

import java.sql.Date;

public class OrderBean {
    private int id;
    private String order_no;
    private int user_id;
    private String username;
    private int product_count;
    private float product_amount_total;
    private float order_amount_total;
    private float logistics_fee;
    private int address_id;
    private int order_logistics_id;
    private int status;
    private String status_name;
    private int pay_channel;
    private String pay_trade_no;
    private Date created_at;
    private Date pay_at;
    private Date send_at;
    private Date finish_at;
    private Date deleted_at;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getProduct_count() {
        return product_count;
    }

    public void setProduct_count(int product_count) {
        this.product_count = product_count;
    }

    public float getProduct_amount_total() {
        return product_amount_total;
    }

    public void setProduct_amount_total(float product_amount_total) {
        this.product_amount_total = product_amount_total;
    }

    public float getOrder_amount_total() {
        return order_amount_total;
    }

    public void setOrder_amount_total(float order_amount_total) {
        this.order_amount_total = order_amount_total;
    }

    public float getLogistics_fee() {
        return logistics_fee;
    }

    public void setLogistics_fee(float logistics_fee) {
        this.logistics_fee = logistics_fee;
    }

    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }

    public int getOrder_logistics_id() {
        return order_logistics_id;
    }

    public void setOrder_logistics_id(int order_logistics_id) {
        this.order_logistics_id = order_logistics_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getPay_channel() {
        return pay_channel;
    }

    public void setPay_channel(int pay_channel) {
        this.pay_channel = pay_channel;
    }

    public String getPay_trade_no() {
        return pay_trade_no;
    }

    public void setPay_trade_no(String pay_trade_no) {
        this.pay_trade_no = pay_trade_no;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getPay_at() {
        return pay_at;
    }

    public void setPay_at(Date pay_at) {
        this.pay_at = pay_at;
    }

    public Date getSend_at() {
        return send_at;
    }

    public void setSend_at(Date send_at) {
        this.send_at = send_at;
    }

    public Date getFinish_at() {
        return finish_at;
    }

    public void setFinish_at(Date finish_at) {
        this.finish_at = finish_at;
    }

    public Date getDeleted_at() {
        return deleted_at;
    }

    public void setDeleted_at(Date deleted_at) {
        this.deleted_at = deleted_at;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStatus_name() {
        return status_name;
    }

    public void setStatus_name(String status_name) {
        this.status_name = status_name;
    }
}
