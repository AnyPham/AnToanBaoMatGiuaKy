package model;

import java.time.LocalDateTime;

public class Payment {
    private int id;
    private int order_id;
    private String payment_type;
    private LocalDateTime payment_date;
    private int total;

    public Payment(int id, int order_id, String payment_type, LocalDateTime payment_date, int total) {
        this.id = id;
        this.order_id = order_id;
        this.payment_type = payment_type;
        this.payment_date = payment_date;
        this.total = total;
    }

    public Payment() {
    }

    @Override
    public String toString() {
        return "Payment{" +
                "id=" + id +
                ", order_id=" + order_id +
                ", payment_type='" + payment_type + '\'' +
                ", payment_date=" + payment_date +
                ", total=" + total +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getPayment_type() {
        return payment_type;
    }

    public void setPayment_type(String payment_type) {
        this.payment_type = payment_type;
    }

    public LocalDateTime getPayment_date() {
        return payment_date;
    }

    public void setPayment_date(LocalDateTime payment_date) {
        this.payment_date = payment_date;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
