package model;

import java.time.LocalDateTime;

public class Order implements IModel{
    private int id;
    private int user_id;
    private String address;
    private String phone;
    private LocalDateTime order_date;
    private String status;
    private LocalDateTime received_date;
    private int total_money;
    private int voucher_id;

    private String name;

    public int getId() {
        return id;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", order_date=" + order_date +
                ", status='" + status + '\'' +
                ", received_date=" + received_date +
                ", total_money=" + total_money +
                ", voucher_id=" + voucher_id +
                ", name='" + name + '\'' +
                '}';
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public LocalDateTime getOrder_date() {
        return order_date;
    }

    public void setOrder_date(LocalDateTime order_date) {
        this.order_date = order_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getReceived_date() {
        return received_date;
    }

    public void setReceived_date(LocalDateTime received_date) {
        this.received_date = received_date;
    }

    public int getTotal_money() {
        return total_money;
    }

    public void setTotal_money(int total_money) {
        this.total_money = total_money;
    }

    public int getVoucher_id() {
        return voucher_id;
    }

    public void setVoucher_id(int voucher_id) {
        this.voucher_id = voucher_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Order() {
    }

    public Order(int id, int user_id, String address, String phone, LocalDateTime order_date, String status, LocalDateTime received_date, int total_money, int voucher_id, String name) {
        this.id = id;
        this.user_id = user_id;
        this.address = address;
        this.phone = phone;
        this.order_date = order_date;
        this.status = status;
        this.received_date = received_date;
        this.total_money = total_money;
        this.voucher_id = voucher_id;
        this.name = name;
    }

    @Override
    public String table() {
        return "order";
    }

    @Override
    public String beforeData() {
        return "";
    }

    @Override
    public String afterData() {
        return toString();
    }
}
