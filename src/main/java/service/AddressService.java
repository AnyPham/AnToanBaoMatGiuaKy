package service;

import dao.AddressDAO;
import model.Address;

import java.util.List;

public class AddressService {
    private static AddressService instance;

    public static AddressService getInstance() {
        if (instance == null)
            instance = new AddressService();
        return instance;
    }

    public List<Address> getAddresses(int userId) {
        return AddressDAO.getAddressListByUserId(userId);
    }
}
