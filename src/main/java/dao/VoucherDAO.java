package dao;

import db.JDBIConnector;
import model.Product;
import model.User;
import model.Voucher;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class VoucherDAO {
    public static ArrayList<Voucher> getVoucher() {
        ArrayList<Voucher> vouchers = (ArrayList<Voucher>) JDBIConnector.me().withHandle((handle -> handle.createQuery("select * from vouchers where start_date <= :start_date and end_date >= :end_date and type LIKE 'All'")
                .bind("start_date", LocalDateTime.now().toString())
                .bind("end_date", LocalDateTime.now().toString())
                .mapToBean(Voucher.class).list()));
        return vouchers;
    }

    public static ArrayList<Voucher> getVoucherByCategory(int categoryId) {
        ArrayList<Voucher> vouchers = (ArrayList<Voucher>) JDBIConnector.me()
                .withHandle(handle ->
                        handle.createQuery("SELECT vouchers.id, vouchers.voucher_name, vouchers.type, vouchers.start_date, vouchers.end_date, vouchers.note, vouchers.percent_decrease, vouchers.price_decrease " +
                                        "FROM vouchers " +
                                        "JOIN categories_use_voucher ON vouchers.id = categories_use_voucher.voucher_id " +
                                        "JOIN categorys ON categorys.id = categories_use_voucher.category_id " +
                                        "WHERE categorys.id = :category_id AND start_date <= :start_date AND end_date >= :end_date")
                                .bind("category_id", categoryId)
                                .bind("start_date", LocalDateTime.now().toString())
                                .bind("end_date", LocalDateTime.now().toString())
                                .mapToBean(Voucher.class)
                                .list());
        return vouchers;


    }

    public static ArrayList<Voucher> getVoucherByProduct(int productId) {
        ArrayList<Voucher> vouchers = (ArrayList<Voucher>) JDBIConnector.me()
                .withHandle(handle ->
                        handle.createQuery("select vouchers.id, vouchers.voucher_name, vouchers.type,vouchers.start_date,vouchers.end_date,vouchers.note, vouchers.percent_decrease,vouchers.price_decrease from vouchers " +
                                        "join product_use_voucher on vouchers.id = product_use_voucher.voucher_id " +
                                        "join products on products.id = product_use_voucher.product_id where products.id = :productId and start_date <= :start_date and end_date >= :end_date")
                                .bind("productId", productId)
                                .bind("start_date", LocalDateTime.now().toString())
                                .bind("end_date", LocalDateTime.now().toString())
                                .mapToBean(Voucher.class)
                                .list());
        return vouchers;
    }


    public static Voucher getVoucherById(int id) {
        Optional<Voucher> voucher = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("select * from vouchers where id = :id")
                        .bind("id", id).mapToBean(Voucher.class).stream().findFirst());
        return voucher.isEmpty() ? null : voucher.get();
    }


    public static void main(String[] args) {

        System.out.println(getVoucherByProduct(1));
        System.out.println(getVoucherByCategory(1));
    }
}
