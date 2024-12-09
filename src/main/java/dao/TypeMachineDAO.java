package dao;

import db.JDBIConnector;
import model.Brand;
import model.TypeMachine;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class TypeMachineDAO {
    public static List<TypeMachine> getListTypeMachine() {
        List<TypeMachine> typeMachines = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM type_machines")
                        .mapToBean(TypeMachine.class)
                        .stream().collect(Collectors.toList()));
        return typeMachines;
    }
    public static TypeMachine getBrandById(int id) {
        Optional<TypeMachine> typeMachine = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM type_machines WHERE id = :id")
                        .bind("id", id)
                        .mapToBean(TypeMachine.class)
                        .stream().findFirst());
        return typeMachine.isEmpty() ? null : typeMachine.get();
    }
    public static void main(String[] args) {
//        System.out.println(getListTypeMachine());
        System.out.println(getBrandById(1));
    }

}
