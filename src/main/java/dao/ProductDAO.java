package dao;

import db.JDBIConnector;
import model.Comment;
import model.Product;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class ProductDAO {
    public static List<Product> getAll() {
        List<Product> products = JDBIConnector.me().withHandle((handle -> handle.createQuery("select * from products ")
                .mapToBean(Product.class).stream().collect(Collectors.toList())));
        return products;
    }

    public static List<Product> getAllLimit5() {
        List<Product> products = JDBIConnector.me().withHandle((handle -> handle.createQuery("select * from products where status = 1  limit 5")
                .mapToBean(Product.class).stream().collect(Collectors.toList())));
        return products;
    }

    public static List<Product> getProductNotHide() {
        List<Product> products = JDBIConnector.me().withHandle((handle -> handle.createQuery("select * from products WHERE status = 1")
                .mapToBean(Product.class).stream().collect(Collectors.toList())));
        return products;
    }

    public static Product getById(int id) {
        Optional<Product> product = JDBIConnector.me().withHandle((handle -> handle
                .createQuery("select * from products where id = :id ")
                .bind("id", id).mapToBean(Product.class).stream().findFirst()));
        return product.isEmpty() ? null : product.get();
    }

    public static List<Product> getLocNuocTheoDanhMuc(String category) {
        List<Product> products = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("select products.id, products.category_id, products.title, products.price, products.discount_price, products.img from products inner join categorys on products.category_id = categorys.id where categorys.name = :category and status = 1 limit 10")
                        .bind("category", category)
                        .mapToBean(Product.class).stream().collect(Collectors.toList()));
        return products;
    }

    public static List<Product> getProductByName(String title) {
        List<Product> products = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM products WHERE title LIKE :title  and status = 1 ")
                        .bind("title", "%" + title + "%")
                        .mapToBean(Product.class)
                        .stream().collect(Collectors.toList()));
        return products;
    }

    public static List<Product> filterByTypeAndBrand(int brand, int type_machine_id) {
        List<Product> products = JDBIConnector.me().withHandle((handle -> handle
                .createQuery("select * from products where type_machine_id=:type_machine_id and brand_id=:brand_id and status = 1 ")
                .bind("type_machine_id", type_machine_id)
                .bind("brand_id", brand)
                .mapToBean(Product.class).stream().collect(Collectors.toList())));
        return products;
    }

    public static String getNameById(int id) {
        String title = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT title FROM products WHERE id = ?")
                        .bind(0, id)
                        .mapTo(String.class)
                        .one()
        );
        return title;
    }

    public static void main(String[] args) {
        increaseProductAvailable(4, 2);

    }


//    public static boolean removeProductById(int productId) {
//        int rowsUpdated = JDBIConnector.me().withHandle(handle ->
//                handle.createUpdate("UPDATE products SET status = 0 WHERE id = :id")
//                        .bind("id", productId)
//                        .execute()
//        );
//        return rowsUpdated > 0;
//    }

    public static boolean changeInfoProduct(int idProduct, int category, String nameProduct, int availableProduct, int priceProduct, int discountPriceProduct, String imgProduct, String desProduct, int brand, int type) {
        int rowsUpdated = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE products SET " +
                                "title = :title, " +
                                "available = :available, " +
                                "category_id = :category_id, " +
                                "price =:price," +
                                "discount_price=:discount_price," +
                                "img=:img," +
                                "type_machine_id=:type_machine_id," +
                                "brand_id=:brand_id," +
                                "updated_at=:updated_at," +
                                "descriptions=:descriptions WHERE id=:id")
                        .bind("title", nameProduct)
                        .bind("available", availableProduct)
                        .bind("price", priceProduct)
                        .bind("discount_price", discountPriceProduct)
                        .bind("img", imgProduct)
                        .bind("descriptions", desProduct)
                        .bind("id", idProduct)
                        .bind("brand_id", brand)
                        .bind("type_machine_id", type)
                        .bind("updated_at", LocalDate.now().toString())
                        .bind("category_id", category)
                        .execute()
        );
        return rowsUpdated > 0;
    }

    public static boolean addProduct(int category, String nameProduct, int availableProduct, int priceProduct, int discountPriceProduct, String imgProduct, String desProduct, int type, int brand) {
        int rowsUpdated = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("INSERT INTO products(title,available,category_id,price,discount_price,img,descriptions,updated_at,created_at,type_machine_id,brand_id,status) \n" +
                                "values (:title, :available, :category_id, :price, :discount_price, :img, :descriptions, :updated_at, :created_at, :type_machine_id, :brand_id,:status)\n")
                        .bind("title", nameProduct)
                        .bind("available", availableProduct)
                        .bind("price", priceProduct)
                        .bind("discount_price", discountPriceProduct)
                        .bind("img", imgProduct)
                        .bind("descriptions", desProduct)
                        .bind("category_id", category)
                        .bind("type_machine_id", type)
                        .bind("brand_id", brand)
                        .bind("updated_at", LocalDate.now().toString())
                        .bind("created_at", LocalDate.now().toString())
                        .bind("status", 1)
                        .execute()
        );
        return rowsUpdated > 0;

    }

    public static boolean checkAvailable(int productId, int quantity) {
        Optional<Product> product = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT available FROM products where id = :id")
                        .bind("id", productId)
                        .mapToBean(Product.class).stream().findFirst());

        return product != null && product.get().getAvailable() > quantity;
    }

    public static void decreaseProductAvailable(int quantity, int product_id) {
        JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE products SET available = available - :quantity where id=:id")
                        .bind("id", product_id)
                        .bind("quantity", quantity)
                        .execute());
    }

    public static void increaseProductAvailable(int quantity, int product_id) {
        JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE products SET available = available + :quantity where id=:id")
                        .bind("id", product_id)
                        .bind("quantity", quantity)
                        .execute());
    }

    public static int getSatusById(int id) {
        int status = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT status FROM products WHERE id = ?")
                        .bind(0, id)
                        .mapTo(Integer.class)
                        .one()
        );
        return status;
    }

    public static String editStatus(int id) {
        if (ProductDAO.getSatusById(id) == 0) {
            ProductDAO.setStatusById(id);
            return "Hiện";
        } else if (ProductDAO.getSatusById(id) == 1) {
            ProductDAO.setStatus(id);
            return "Ẩn";
        }
        return "";
    }

    public static boolean setStatusById(int id) {
        int rowsUpdated = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE products SET status = ?, updated_at = ? WHERE id = ?")
                        .bind(0, 1)
                        .bind(1, LocalDateTime.now().toString())
                        .bind(2, id)
                        .execute()
        );
        return rowsUpdated > 0;
    }

    public static boolean setStatus(int id) {
        int rowsUpdated = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE products SET status = ?, updated_at = ? WHERE id = ?")
                        .bind(0, 0)
                        .bind(1, LocalDateTime.now().toString())
                        .bind(2, id)
                        .execute()
        );
        return rowsUpdated > 0;
    }


}
