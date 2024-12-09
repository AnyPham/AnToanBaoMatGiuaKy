package model;

public class OrderDetail implements IModel{
    private int id;
    private int order_id;
    private int product_id;
    private int price;
    private int quantity;
    private int total_money;

    public OrderDetail(int id, int order_id, int product_id, int price, int quantity, int total_money) {
        this.id = id;
        this.order_id = order_id;
        this.product_id = product_id;
        this.price = price;
        this.quantity = quantity;
        this.total_money = total_money;
    }

    public OrderDetail() {
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "id=" + id +
                ", order_id=" + order_id +
                ", product_id=" + product_id +
                ", price=" + price +
                ", quantity=" + quantity +
                ", total_money=" + total_money +
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

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotal_money() {
        return total_money;
    }

    public void setTotal_money(int total_money) {
        this.total_money = total_money;
    }

    @Override
    public String table() {
        return "order_details";
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
