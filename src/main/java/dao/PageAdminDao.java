package dao;

import db.JDBIConnector;
import model.Order;
import model.Product;

import java.util.List;
import java.util.stream.Collectors;

public class PageAdminDao {
    public static int countOrder() {
        int count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT COUNT(id) FROM orders")
                        .mapTo(Integer.class)
                        .one()
        );
        return count;
    }
    public static int countProductOutStock() {
        int count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT COUNT(id) FROM products where available = 0")
                        .mapTo(Integer.class)
                        .one()
        );
        return count;
    }
    public static int totalMoney() {
        Integer count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT SUM(total_money) FROM orders")
                        .mapTo(Integer.class)
                        .one()
        );
        return (count != null) ? count : 0;
    }

    public static int countOrderCancel() {
        int count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT COUNT(id) FROM orders WHERE status LIKE ?")
                        .bind(0, "%Đã Hủy%")
                        .mapTo(Integer.class)
                        .one()
        );
        return count;
    }

    public static List<Product> getProductBestSeller() {
        List<Product> products = JDBIConnector.me().withHandle((handle ->
                handle.createQuery("select products.*, count(order_details.product_id) " +
                                "as total from products join order_details " +
                                "on products.id = order_details.product_id " +
                                "group by products.id order by total desc")
                        .mapToBean(Product.class).stream().collect(Collectors.toList())));
        return products;
    }

    public static int countOrderToday() {
        int count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT COUNT(id) FROM orders WHERE DATE(order_date) = CURDATE()")
                        .mapTo(Integer.class)
                        .one()
        );
        return count;
    }
    public static int countOrderThisWeek() {
        int count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT COUNT(id) FROM orders WHERE WEEK(order_date) = WEEK(CURDATE()) AND YEAR(order_date) = YEAR(CURDATE())")
                        .mapTo(Integer.class)
                        .one()
        );
        return count;
    }
    public static int countOrderThisMonth() {
        int count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT COUNT(id) FROM orders WHERE MONTH(order_date) = MONTH(CURDATE()) AND YEAR(order_date) = YEAR(CURDATE())")
                        .mapTo(Integer.class)
                        .one()
        );
        return count;
    }
    public static int totalMoneyToday() {
        Integer count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT SUM(total_money) FROM orders  WHERE DATE(order_date) = CURDATE()")
                        .mapTo(Integer.class)
                        .one()
        );
        return (count != null) ? count : 0;
    }
    public static int totalMoneyWeek() {
        Integer count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT SUM(total_money) FROM orders  WHERE WEEK(order_date) = WEEK(CURDATE()) AND YEAR(order_date) = YEAR(CURDATE())")
                        .mapTo(Integer.class)
                        .one()
        );
        return (count != null) ? count : 0;
    }
    public static int totalMoneyMonth() {
        Integer count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT SUM(total_money) FROM orders  WHERE MONTH(order_date) = MONTH(CURDATE()) AND YEAR(order_date) = YEAR(CURDATE())")
                        .mapTo(Integer.class)
                        .one()
        );
        return (count != null) ? count : 0;
    }
    public static int countOrderCancelToday() {
        int count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT COUNT(id) FROM orders WHERE status LIKE ? AND WEEK(order_date) = WEEK(CURDATE()) AND YEAR(order_date) = YEAR(CURDATE())")
                        .bind(0, "%Đã Hủy%")
                        .mapTo(Integer.class)
                        .one()
        );
        return count;
    }
    public static int countOrderCancelWeek() {
        int count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT COUNT(id) FROM orders WHERE status LIKE ? AND DATE(order_date) = CURDATE()")
                        .bind(0, "%Đã Hủy%")
                        .mapTo(Integer.class)
                        .one()
        );
        return count;
    }
    public static int countOrderCancelMonth() {
        int count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT COUNT(id) FROM orders WHERE status LIKE ? AND MONTH(order_date) = MONTH(CURDATE()) AND YEAR(order_date) = YEAR(CURDATE())")
                        .bind(0, "%Đã Hủy%")
                        .mapTo(Integer.class)
                        .one()
        );
        return count;
    }



    public static int totalMoneyStartEnd(String startDate, String endDate) {
        Integer count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT SUM(total_money) FROM orders WHERE order_date BETWEEN :startDate AND :endDate")
                        .bind("startDate", startDate)
                        .bind("endDate", endDate)
                        .mapTo(Integer.class)
                        .one()
        );
        return (count != null) ? count : 0;
    }
    public static int countOrderStartEnd(String startDate, String endDate) {
        Integer count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT COUNT(id) FROM orders WHERE order_date BETWEEN :startDate AND :endDate")
                        .bind("startDate", startDate)
                        .bind("endDate", endDate)
                        .mapTo(Integer.class)
                        .one()
        );
        return (count != null) ? count : 0;
    }
    public static int countOrderCancelOrderStartEnd(String startDate, String endDate) {
        Integer count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT COUNT(id) FROM orders WHERE status LIKE :status AND order_date BETWEEN :startDate AND :endDate")
                        .bind("status", "%Đã Hủy%")
                        .bind("startDate", startDate)
                        .bind("endDate", endDate)
                        .mapTo(Integer.class)
                        .one()
        );
        return (count != null) ? count : 0;
    }
    public static List<Product> getProductBestSellerStartEnd(String startDate, String endDate) {
        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT products.*, COUNT(order_details.product_id) AS total " +
                                "FROM products " +
                                "JOIN order_details ON products.id = order_details.product_id " +
                                "JOIN orders ON orders.id = order_details.order_id " +
                                "WHERE orders.order_date BETWEEN :startDate AND :endDate " +
                                "GROUP BY products.id " +
                                "ORDER BY total DESC")
                        .bind("startDate", startDate)
                        .bind("endDate", endDate)
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }


    public static List<Product> getProductsNotSoldStartEnd(String startDate, String endDate) {
        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM products " +
                                "WHERE NOT EXISTS (" +
                                "   SELECT 1 FROM order_details " +
                                "   JOIN orders ON order_details.order_id = orders.id " +
                                "   WHERE order_details.product_id = products.id " +
                                "   AND orders.order_date BETWEEN :startDate AND :endDate" +
                                ")")
                        .bind("startDate", startDate)
                        .bind("endDate", endDate)
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }

//    public static int countProductSoldQuantity(int productId, String startDate, String endDate) {
//        return JDBIConnector.me().withHandle(handle ->
//                handle.createQuery("SELECT SUM(order_details.quantity) AS total_sold " +
//                                "FROM order_details " +
//                                "JOIN orders ON orders.id = order_details.order_id " +
//                                "WHERE order_details.product_id = :productId " +
//                                "AND orders.order_date BETWEEN :startDate AND :endDate")
//                        .bind("productId", productId)
//                        .bind("startDate", startDate)
//                        .bind("endDate", endDate)
//                        .mapTo(Integer.class)
//                        .findOne()
//                        .orElse(0)
//        );
//    }
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
    public static List<Order> getOrderStatusStartEnd(String startDate, String endDate, String status) {
        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM orders WHERE order_date BETWEEN :startDate AND :endDate AND status = :status ORDER BY order_date DESC")
                        .bind("startDate", startDate)
                        .bind("endDate", endDate)
                        .bind("status", status)
                        .mapToBean(Order.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }
    public static List<Order> getOrderRecent() {
        List<Order> orders= JDBIConnector.me().withHandle((handle ->
                handle.createQuery("select * from orders order by order_date desc ")
                        .mapToBean(Order.class).stream().collect(Collectors.toList())));
        return orders;
    }
    public static List<Order> getOrderRecentStartEnd(String startDate, String endDate) {
        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM orders WHERE order_date BETWEEN :startDate AND :endDate ORDER BY order_date DESC")
                        .bind("startDate", startDate)
                        .bind("endDate", endDate)
                        .mapToBean(Order.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }
    public static List<Order> getOrderRecentCanceled() {
        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM orders WHERE status LIKE :status ORDER BY order_date DESC")
                        .bind("status", "%Đã Hủy%")
                        .mapToBean(Order.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }

    public static List<Order> getOrderRecentCanceledStartEnd(String startDate, String endDate) {
        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM orders WHERE status LIKE :status AND order_date BETWEEN :startDate AND :endDate ORDER BY order_date DESC")
                        .bind("status", "%Đã Hủy%")
                        .bind("startDate", startDate)
                        .bind("endDate", endDate)
                        .mapToBean(Order.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }
    public static List<Product> getProductsNotSold() {
        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM products " +
                                "WHERE NOT EXISTS (" +
                                "   SELECT 1 FROM order_details " +
                                "   JOIN orders ON order_details.order_id = orders.id " +
                                "   WHERE order_details.product_id = products.id " +
                                ")")
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }

    public static void main(String[] args) {
//        System.out.println(countOrder());
//        System.out.println(countProductOutStock());
//        System.out.println(totalMoney());
//        System.out.println(countOrderCancel());
//        System.out.println(getOrderRecent());
//        System.out.println(countOrderCancelToday());
//        System.out.println(totalMoneyStartEnd("2024-01-23", "2024-01-25"));
        System.out.println(getProductsNotSold());


    }
}

