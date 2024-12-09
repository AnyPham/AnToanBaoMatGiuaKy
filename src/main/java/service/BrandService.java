package service;

import dao.BrandDAO;
import model.Brand;

import java.util.List;

public class BrandService {
    private static BrandService instance;

    public static BrandService getInstance() {
        if (instance == null)
            instance = new BrandService();
        return instance;
    }

    public List<Brand> getListBrand() {
        return BrandDAO.getListBrand();
    }

    public Brand getBrandById(int id) {
        return BrandDAO.getBrandById(id);
    }
}
