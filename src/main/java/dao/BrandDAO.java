package dao;

import db.JDBIConnector;
import model.Brand;
import model.Comment;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class BrandDAO {
    public static List<Brand> getListBrand() {
        List<Brand> brands = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM brands")
                        .mapToBean(Brand.class)
                        .stream().collect(Collectors.toList()));
        return brands;
    }

    public static Brand getBrandById(int id) {
        Optional<Brand> brand = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM brands WHERE id = :id")
                        .bind("id", id)
                        .mapToBean(Brand.class)
                        .stream().findFirst());
        return brand.isEmpty() ? null : brand.get();
    }

    public static void main(String[] args) {
//        System.out.println(getListBrand());
        System.out.println(getBrandById(1));
    }
}