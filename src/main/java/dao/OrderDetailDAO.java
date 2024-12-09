package dao;

import db.JDBIConnector;
import model.Order;
import model.OrderDetail;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

public class OrderDetailDAO {

    public static boolean insertOrderDetail(int order_id, int product_id, int price, int quantity, int total_money) {
        int rowAffected = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("INSERT INTO order_details( order_id, product_id, price, quantity,total_money) " +
                                "VALUES ( :order_id, :product_id, :price, :quantity, :total_money)")
                        .bind("order_id", order_id)
                        .bind("product_id", product_id)
                        .bind("price", price)
                        .bind("quantity", quantity)
                        .bind("total_money", total_money)
                        .execute());
        if (rowAffected > 0) {
            return true;
        } else {
            return false;
        }
    }
    public static List<OrderDetail> getOrderDetailByIdOrder(int order_id){
            List<OrderDetail> orders = JDBIConnector.me().withHandle(handle ->
                    handle.createQuery("SELECT * FROM order_details WHERE order_id = :order_id ")
                            .bind("order_id", order_id)
                            .mapToBean(OrderDetail.class).stream().collect(Collectors.toList()));
            return orders.isEmpty() ? null : orders;

    }

    public static void deleteOrderDetails(int id) {
        JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("DELETE FROM order_details WHERE order_id = :order_id")
                        .bind("order_id", id)
                        .execute());
    }
}
