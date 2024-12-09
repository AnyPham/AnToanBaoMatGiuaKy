package cart;

import model.Product;

public class CartProduct {
    int quantity;
    Product product;

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public CartProduct(int quantity, Product product) {
        this.quantity = quantity;
        this.product = product;
    }

    public CartProduct() {
    }
    public void increaseQuantity(int quantity){
        this.quantity += quantity;
    }
    public void decreaseQuantity(int quantity){
        this.quantity -= quantity;

    }
}
