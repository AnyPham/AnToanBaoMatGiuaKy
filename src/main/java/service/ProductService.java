package service;

import dao.ProductDAO;
import model.Product;

import java.util.List;

public class ProductService {
    private static ProductService instance;

    public static ProductService getInstance() {
        if (instance == null)
            instance = new ProductService();
        return instance;
    }

    public static List<Product> filterByTypeAndBrand(int brand, int type) {
        return ProductDAO.filterByTypeAndBrand(brand,type);
    }

    public List<Product> getAllLimit5() {
        return ProductDAO.getAllLimit5();
    }

    public Product getById(int id) {
        return ProductDAO.getById(id);
    }

    public List<Product> getLocNuocTheoDanhMuc(String category) {
        return ProductDAO.getLocNuocTheoDanhMuc(category);
    }

    public List<Product> getProductByName(String title){
        return ProductDAO.getProductByName(title);
    }
    public String getNameById(int id){
        return ProductDAO.getNameById(id);
    }
    public static void main(String[] args) {
        System.out.println(ProductService.getInstance().getProductByName("Máy lọc nước RO"));
    }

//    public boolean removeProductById(int productId) {
//        return ProductDAO.removeProductById( productId);
//    }

    public boolean changeInfoProduct(int idProduct,int category, String nameProduct, int availableProduct, int priceProduct, int discountPriceProduct, String imgProduct, String desProduct,int brand,int typeMachine) {
        return ProductDAO.changeInfoProduct(idProduct,category,nameProduct, availableProduct,priceProduct,discountPriceProduct,imgProduct,desProduct,brand,typeMachine);
    }

    public boolean addProduct(int selectedCategory, String nameProduct, int availableProduct, int priceProduct, int discountPriceProduct, String imgProduct, String desProduct,int type, int brand) {
        return ProductDAO.addProduct(selectedCategory,nameProduct, availableProduct,priceProduct,discountPriceProduct,imgProduct,desProduct,type,brand);
    }
}
