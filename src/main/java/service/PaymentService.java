package service;

import dao.PaymentDAO;
import model.Payment;

public class PaymentService {
    private static PaymentService instance;

    public static PaymentService getInstance() {
        if (instance == null)
            instance = new PaymentService();
        return instance;
    }

    public Payment getPaymentByOrderId(int order_id) {
        return PaymentDAO.getPaymentByOrderId(order_id);
    }

    public boolean insertPayment(int order_id, String payment_type, int total) {
        return PaymentDAO.insertPayment(order_id, payment_type, total);
    }
}
