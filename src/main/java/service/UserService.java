package service;

import dao.UserDAO;
import model.User;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserService {
    private static UserService instance;

    public static UserService getInstance() {
        if (instance == null)
            instance = new UserService();
        return instance;
    }

    public static boolean countPassword(String password) {
        if (password.length() >= 8) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean isValidEmail(String email) {
        String emailPattern = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        Pattern pattern = Pattern.compile(emailPattern);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    public static boolean isMatchPassword(String password, String rePassword) {
        if (password.equals(rePassword)) {
            return true;
        } else
            return false;
    }

    public static boolean isEmailExists(String email) {
        return UserDAO.isEmailExists(email);
    }

    public static boolean isUserExists(String userName) {
        return UserDAO.isUserExists(userName);
    }


    public static boolean addUser(String username, String fullname, String email, String phone_number, String password) {
        return new UserDAO().addUser(username, fullname, email, phone_number, password);
    }

    public boolean checkPassByUserId(int id, String password) {
        return UserDAO.checkPassByUserId(id, password);
    }

    public boolean changePassworById(int id, String password) {
        return UserDAO.changePassworById(id, password);
    }

    public List<User> getAll() {
        return UserDAO.getAll();
    }

    public void editRole(int id) {
        if (UserDAO.getRoleById(id) == 1) {
            UserDAO.setRoleIdUser(id);
        } else if (UserDAO.getRoleById(id) == 2) {
            UserDAO.setRoleIdAdmin(id);
        }
    }

    public void editStatus(int id) {
        if (UserDAO.getSatusById(id) == 1) {
            UserDAO.setStatuslockById(id);
        } else if (UserDAO.getSatusById(id) == 2) {
            UserDAO.setStatusById(id);
        }
    }

    public static String getFullNameById(int id) {
        return UserDAO.getFullNameById(id);
    }

    public User getUserById(int id) {
        return UserDAO.getUserById(id);
    }

    public boolean updateUserAdminById(int id, String username, String fullname, String phone_number, String email, String password) {
        return UserDAO.updateUserAdminById(id, username, fullname, phone_number, email, password);
    }

    public boolean insertUserAdmin(int role, String username, String fullname, String phone_number, String email, String password) {
        return UserDAO.insertUserAdmin(role, username, fullname, phone_number, email, password);
    }

    public User checkProviderUserId(String providerUserId) {
        return UserDAO.checkProviderUserId(providerUserId);
    }
    public boolean loginUser(String username, String password){
        return UserDAO.loginUser(username,password);
    }


    public void insertUser(User user) {
        UserDAO.insertUser(user);
    }
}
