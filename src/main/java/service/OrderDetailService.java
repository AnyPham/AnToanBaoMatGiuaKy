package service;

import dao.OrderDetailDAO;
import model.OrderDetail;

import java.util.List;

public class OrderDetailService {
    private static OrderDetailService instance;

    public static OrderDetailService getInstance() {
        if (instance == null)
            instance = new OrderDetailService();
        return instance;
    }

    public boolean insertOrder(int order_id, int product_id, int price, int quantity, int total_money) {
        return OrderDetailDAO.insertOrderDetail(order_id, product_id, price, quantity, total_money);
    }
    public List<OrderDetail> getOrderDetailByIdOrder(int order_id){
        return OrderDetailDAO.getOrderDetailByIdOrder(order_id);
    }
}
