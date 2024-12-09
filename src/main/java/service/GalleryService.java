package service;

import dao.GalleryDAO;
import model.Gallery;

import java.util.List;

public class GalleryService {
    private static GalleryService instance;

    public static GalleryService getInstance() {
        if (instance == null)
            instance = new GalleryService();
        return instance;
    }

    public static List<Gallery> getGalleryByProductId(int id) {
        return GalleryDAO.getGalleryByProductId(id);
    }

    public static void main(String[] args) {
        System.out.println(GalleryService.getInstance().getGalleryByProductId(0));
    }
}
