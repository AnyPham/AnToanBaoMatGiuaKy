package service;

import dao.TypeMachineDAO;
import model.TypeMachine;


import java.util.List;

public class TypeMachineService {
    private static TypeMachineService  instance;
    public static TypeMachineService getInstance() {
        if (instance == null)
            instance = new TypeMachineService();
        return instance;
    }
    public List<TypeMachine> getListTypeMachine() {
        return TypeMachineDAO.getListTypeMachine();
    }
    public TypeMachine getTypeMachineById(int id){
        return TypeMachineDAO.getBrandById(id);
    }
}
