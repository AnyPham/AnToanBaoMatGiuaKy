package cart;

import model.Product;
import service.ProductService;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    Map<Integer, CartProduct> data = new HashMap<>();
    public boolean add(int id){
        return add(id, 1);
    }
    public boolean add(int id, int quantity){

        Product p = ProductService.getInstance().getById(id);
        if (p==null) return  false;
        CartProduct cartProduct = null;
        if (data.containsKey(id)){
            cartProduct = data.get(id);
            cartProduct.increaseQuantity(quantity);
        }
        else{
            cartProduct = new CartProduct(quantity, p);
        }
        data.put(id, cartProduct);
        return true;

    }
    public boolean remove(int id){
        if (!data.containsKey(id)) return false;
        data.remove(id);
        return true;
    }
    public int getTotal(){
        return data.size();
    }

    public Map<Integer, CartProduct> getData() {
        return data;
    }

    public void setData(Map<Integer, CartProduct> data) {
        this.data = data;
    }
}
