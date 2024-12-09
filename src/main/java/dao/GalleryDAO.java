package dao;

import db.JDBIConnector;
import model.Gallery;

import java.util.List;
import java.util.stream.Collectors;

public class GalleryDAO {
    public static List<Gallery> getGalleryByProductId(int id){
        List<Gallery> galleries = JDBIConnector.me().withHandle((handle -> handle.createQuery("select * from gallerys where gallerys.product_id = :id").bind("id", id).mapToBean(Gallery.class).stream().collect(Collectors.toList())));
        return galleries;
    }
}
