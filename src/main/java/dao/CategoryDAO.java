package dao;

import db.JDBIConnector;
import model.Category;
import model.Product;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class CategoryDAO {

    public static String getCategoryNameById(int id) {
        String name = "";
        Optional<Category> category = JDBIConnector.me().withHandle((handle -> handle
                .createQuery("select name from categorys where id = :id")
                .bind("id", id).mapToBean(Category.class).stream().findFirst()));
        return category.get().getName();
    }

    public static List<Category> getListCategorys() {
        List<Category> categories = JDBIConnector.me().withHandle((handle -> handle
                .createQuery("select * from categorys ")
                .mapToBean(Category.class).stream().collect(Collectors.toList())));
        return categories;
    }
}
