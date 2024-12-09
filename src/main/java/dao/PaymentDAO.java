package dao;

import db.JDBIConnector;
import model.Order;
import model.Payment;

import java.time.LocalDateTime;
import java.util.Optional;

public class PaymentDAO {
    public static Payment getPaymentByOrderId(int order_id) {
        Optional<Payment> order = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM payments WHERE order_id=:order_id" )
                        .bind("user_id", order_id)
                        .mapToBean(Payment.class).stream().findFirst());
        return order.isEmpty() ? null : order.get();
    }
    public static boolean insertPayment(int order_id, String payment_type, int total) {
        int rowAffected = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("INSERT INTO payments( order_id, payment_type, total, payment_date) " +
                                "VALUES ( :order_id, :payment_type, :total, :payment_date)")
                        .bind("order_id", order_id)
                        .bind("payment_type", payment_type)
                        .bind("total", total)
                        .bind("payment_date", LocalDateTime.now().toString())
                        .execute());
        if (rowAffected > 0) {
            return true;
        } else {
            return false;
        }
    }
}
