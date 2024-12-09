package dao;

import db.JDBIConnector;
import model.ImportProduct;
import model.Product;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

public class ImportProductDao {
    public static List<ImportProduct> getAll() {
        List<ImportProduct> importProducts = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * from import_products")
                        .mapToBean(ImportProduct.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return importProducts;
    }

    public static String getNameProductById(int id) {
        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT title FROM products WHERE id = :id")
                        .bind("id", id)
                        .mapTo(String.class)
                        .one()
        );
    }

    public static String getFullNameById(int id) {
        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT fullname FROM users WHERE id = :id")
                        .bind("id", id)
                        .mapTo(String.class)
                        .one()
        );
    }

    public static boolean insertImportProduct(int productId, int quantity, int price, int userId) {
        JDBIConnector.me().useHandle(handle ->
                handle.createUpdate("INSERT INTO import_products (product_id, quantity, price, created_at, user_id) VALUES (:productId, :quantity, :price, :createdAt, :userId)")
                        .bind("productId", productId)
                        .bind("quantity", quantity)
                        .bind("price", price)
                        .bind("createdAt", LocalDateTime.now())
                        .bind("userId", userId)
                        .execute()
        );
        return true;
    }

    public static boolean increaseProductAvailable(int quantity, int product_id) {
        JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE products SET available = available + :quantity where id=:id")
                        .bind("id", product_id)
                        .bind("quantity", quantity)
                        .execute());
        return true;
    }

    public static int countProductSoldQuantity(int productId) {
        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT SUM(order_details.quantity) AS total_sold " +
                                "FROM order_details " +
                                "JOIN orders ON orders.id = order_details.order_id " +
                                "WHERE order_details.product_id = :productId ")
                        .bind("productId", productId)
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(0)
        );
    }

    public static int countProductImportQuantity(int productId) {
        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT SUM(quantity) AS total_import " +
                                "FROM import_products " +
                                "WHERE product_id = :productId ")
                        .bind("productId", productId)
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(0)
        );
    }

    public static List<Product> getProductsInventory() {
        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT p.id, p.category_id, p.type_machine_id, p.brand_id, p.title, p.price, p.img, p.discount_price, p.descriptions, p.available, p.created_at, p.updated_at, p.status, " +
                                "(COALESCE(SUM(ip.quantity), 0) - COALESCE(SUM(od.quantity), 0)) AS inventory " +
                                "FROM products p " +
                                "LEFT JOIN import_products ip ON p.id = ip.product_id " +
                                "LEFT JOIN order_details od ON p.id = od.product_id " +
                                "LEFT JOIN orders o ON od.order_id = o.id " +
                                "GROUP BY p.id, p.category_id, p.type_machine_id, p.brand_id, p.title, p.price, p.img, p.discount_price, p.descriptions, p.available, p.created_at, p.updated_at, p.status " +
                                "HAVING inventory > 0")
                        .map((rs, ctx) -> new Product(
                                rs.getInt("id"),
                                rs.getInt("category_id"),
                                rs.getInt("type_machine_id"),
                                rs.getInt("brand_id"),
                                rs.getString("title"),
                                rs.getInt("price"),
                                rs.getString("img"),
                                rs.getInt("discount_price"),
                                rs.getString("descriptions"),
                                rs.getInt("available"),
                                rs.getDate("created_at"),
                                rs.getDate("updated_at"),
                                rs.getInt("status")
                        ))
                        .list()
        );
    }

    public static double getProductSalesRatio(int productId) {
        return JDBIConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT " +
                            "COALESCE(SUM(od.quantity), 0) as totalSold, " +
                            "COALESCE(SUM(ip.quantity), 0) as totalImported " +
                            "FROM products p " +
                            "LEFT JOIN order_details od ON p.id = od.product_id " +
                            "LEFT JOIN import_products ip ON p.id = ip.product_id " +
                            "WHERE p.id = :productId")
                    .bind("productId", productId)
                    .map((rs, ctx) -> {
                        int totalSold = rs.getInt("totalSold");
                        int totalImported = rs.getInt("totalImported");
                        double ratio = totalImported == 0 ? 0 : (double) totalSold / totalImported;
                        // Làm tròn đến 3 chữ số thập phân
                        return BigDecimal.valueOf(ratio).setScale(3, RoundingMode.HALF_UP).doubleValue();
                    })
                    .findOnly();
        });
    }

    public static List<Product> getProductsWithHighSalesRatio() {
        return JDBIConnector.me().withHandle(handle -> {
            return handle.createQuery(
                            "SELECT p.*, " +
                                    "COALESCE(SUM(od.quantity), 0) as totalSold, " +
                                    "COALESCE(SUM(ip.quantity), 0) as totalImported " +
                                    "FROM products p " +
                                    "LEFT JOIN order_details od ON p.id = od.product_id " +
                                    "LEFT JOIN import_products ip ON p.id = ip.product_id " +
                                    "WHERE p.available < 5 " +
                                    "GROUP BY p.id " +
                                    "HAVING (CASE WHEN COALESCE(SUM(ip.quantity), 0) = 0 THEN 0 " +
                                    "        ELSE CAST(COALESCE(SUM(od.quantity), 0) AS FLOAT) / COALESCE(SUM(ip.quantity), 1) " +
                                    "   END) > 0.06"
                    )
                    .map((rs, ctx) -> {
                        Product product = new Product();
                        product.setId(rs.getInt("id"));
                        product.setCategory_id(rs.getInt("category_id"));
                        product.setType_machine_id(rs.getInt("type_machine_id"));
                        product.setBrand_id(rs.getInt("brand_id"));
                        product.setTitle(rs.getString("title"));
                        product.setPrice(rs.getInt("price"));
                        product.setImg(rs.getString("img"));
                        product.setDiscount_price(rs.getInt("discount_price"));
                        product.setDescriptions(rs.getString("descriptions"));
                        product.setAvailable(rs.getInt("available"));
                        product.setCreated_at(rs.getDate("created_at"));
                        product.setUpdated_at(rs.getDate("updated_at"));
                        product.setStatus(rs.getInt("status"));
                        return product;
                    })
                    .list();
        });
    }

    public static void main(String[] args) {
//        System.out.println(insertImportProduct(1, 100,10000, 3));
//        System.out.println(increaseProductAvailable(100, 4));
        System.out.println(increaseProductAvailable(120, 2));
    }
}
