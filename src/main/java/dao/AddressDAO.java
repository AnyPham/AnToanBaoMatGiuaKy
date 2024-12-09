package dao;

import db.JDBIConnector;
import model.Address;

import java.util.List;
import java.util.stream.Collectors;

public class AddressDAO {
    public static List<Address> getAddressListByUserId(int userId) {
        List<Address> addresses = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM address WHERE user_id = :userId")
                        .bind("userId", userId)
                        .mapToBean(Address.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return addresses;
    }

    public static void main(String[] args) {
        AddressDAO dao = new AddressDAO();
        System.out.println(dao.getAddressListByUserId(14));
    }
}
