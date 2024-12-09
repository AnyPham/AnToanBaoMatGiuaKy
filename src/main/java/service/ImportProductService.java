package service;

import dao.ImportProductDao;
import model.ImportProduct;
import model.Product;

import java.util.List;

public class ImportProductService {
    private static ImportProductService instance;

    public static ImportProductService getInstance() {
        if (instance == null)
            instance = new ImportProductService();
        return instance;
    }
    public static List<ImportProduct> getAll(){
        return ImportProductDao.getAll();
    }
    public static String getNameProductById(int id){
        return ImportProductDao.getNameProductById(id);
    }
    public static String getFullNameById(int id){
        return ImportProductDao.getFullNameById(id);
    }
    public static boolean insertImportProduct(int productId, int quantity, int price, int userId){
        return ImportProductDao.insertImportProduct(productId, quantity, price, userId);
    }
    public static boolean increaseProductAvailable(int quantity, int product_id){
        return ImportProductDao.increaseProductAvailable(quantity, product_id);
    }
    public static int countInventory(int id){
        int total = 0;
        if(ImportProductDao.countProductImportQuantity(id) - ImportProductDao.countProductSoldQuantity(id) < 0){
            total = 0;
        } else {
            total = ImportProductDao.countProductImportQuantity(id) - ImportProductDao.countProductSoldQuantity(id);
        }
        return total;
    }
    public static List<Product> getProductsInventory(){
        return ImportProductDao.getProductsInventory();
    }
    public static double getProductSalesRatio(int productId){
        return ImportProductDao.getProductSalesRatio(productId);
    }
    public static List<Product> getProductsWithHighSalesRatio(){
        return ImportProductDao.getProductsWithHighSalesRatio();
    }

}
