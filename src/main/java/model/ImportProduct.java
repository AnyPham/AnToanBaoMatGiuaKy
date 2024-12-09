package model;

import java.time.LocalDateTime;
import java.util.Date;

public class ImportProduct {
    private int id;
    private int productId;
    private int quantity;
    private LocalDateTime created_At;
    private int userId;
    private int price;

    public ImportProduct() {

    }

    public ImportProduct(int id, int productId, int quantity, int price, LocalDateTime created_At, int userId) {
        this.id = id;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
        this.created_At = created_At;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public LocalDateTime getCreated_At() {
        return created_At;
    }

    public void setCreated_At(LocalDateTime created_At) {
        this.created_At = created_At;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "ImportProduct{" +
                "id=" + id +
                ", productId=" + productId +
                ", quantity=" + quantity +
                ", created_At=" + created_At +
                ", userId=" + userId +
                ", price=" + price +
                '}';
    }
}
