package service;

import dao.OrderDAO;
import model.Order;

import java.util.List;
import java.util.Optional;

public class OrderService {
    private static OrderService instance;

    public static OrderService getInstance() {
        if (instance == null)
            instance = new OrderService();
        return instance;
    }

    public boolean insertOrder(int user_id, String address, String phone, String status, int total_money, int voucher_id,String name) {
        return OrderDAO.insertOrder(user_id, address, phone, status, total_money,voucher_id,name);
    }
    public Order getOrder(int user_id, String address, int total_money){
        return OrderDAO.getOrder(user_id, address, total_money);
    }
    public Order getOrderById(int id){
        return OrderDAO.getOrderById(id);
    }
    public List<Order> getOrderByIdUser(int user_id){
        return OrderDAO.getOrderByIdUser(user_id);
    }
    public boolean cancelOrder(String status , int id){
        return OrderDAO.cancelOrder(status,id);
    }
    public boolean paymentOrder(String status , int id){
        return OrderDAO.paymentOrder(status,id);
    }
    public List<Order> getListOrderWaitConfirm(){
        return OrderDAO.getListOrderWaitConfirm();
    }
    public static void main(String[] args) {
    }

    public List<Order> getListOrderConfirm() {
        return OrderDAO.getListOrderConfirm();
    }

    public List<Order> getListOrderTransport() {
        return OrderDAO.getListOrderTransport();
    }

    public List<Order> getListOrderTransported() {
        return OrderDAO.getListOrderTransported();
    }

    public List<Order> getListOrderCancel() {
        return OrderDAO.getListOrderCancel();
    }

    public boolean changeStatusToConfirmed(int id) {
        return OrderDAO.changeStatusToConfirmed(id);
    }

    public boolean changeStatusToTransport(int orderId) {
        return OrderDAO.changeStatusToTransport(orderId);
    }

    public boolean changeStatusToTransported(int orderId) {
        return OrderDAO.changeStatusToTransported(orderId);
    }

    public boolean changeStatusToCancel(int orderId) {
        return OrderDAO.changeStatusToCancel(orderId);
    }
}
