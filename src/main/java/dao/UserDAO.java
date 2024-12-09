package dao;

import db.JDBIConnector;
import model.AbsDao;
import model.IModel;
import model.Product;
import model.User;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.JdbiException;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;


public class UserDAO extends AbsDao<User> {
    public static boolean isEmailExists(String email) {
        int count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT COUNT(*) FROM users WHERE email = ?")
                        .bind(0, email)
                        .mapTo(Integer.class)
                        .one()
        );
        return count > 0;
    }

    public static boolean isUserExists(String userName) {
        int count = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT COUNT(*) FROM users WHERE username = ?")
                        .bind(0, userName)
                        .mapTo(Integer.class)
                        .one()
        );
        return count > 0;
    }

    public static User checkProviderUserId(String providerUserId) {
        return JDBIConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM users WHERE provider_user_id = :providerUserId")
                    .bind("providerUserId", providerUserId)
                    .map((rs, ctx) -> {
                        User c = new User();
                        c.setId(rs.getInt("id"));
                        c.setRoleId(2);
                        c.setFullName(rs.getString("fullName"));
                        c.setEmail(rs.getString("email"));
                        c.setProvider(rs.getString("provider"));
                        c.setProviderUserId(rs.getString("provider_user_id"));
                        return c;
                    })
                    .findFirst()
                    .orElse(null);
        });

    }

    public static void insertUser(User user) {
        JDBIConnector.me().withHandle(handle -> {
            return handle.createUpdate("INSERT INTO users (role_id, username, fullname, email, phone_number, sex, address, password, created_at, updated_at, status, active, provider, provider_user_id) " +
                            "VALUES (:roleId, :userName, :fullName, :email, :phoneNumber, :sex, :address, :password, :createdAt, :updatedAt, :status, :active, :provider, :providerUserId)")
                    .bind("roleId", user.getRoleId())
                    .bind("userName", user.getUserName())
                    .bind("fullName", user.getFullName())
                    .bind("email", user.getEmail())
                    .bind("phoneNumber", user.getPhoneNumber())
                    .bind("sex", user.getSex())
                    .bind("address", user.getAddress())
                    .bind("password", user.getPassword())
                    .bind("createdAt", user.getCreatedAt())
                    .bind("updatedAt", user.getUpdatedAt())
                    .bind("status", user.getStatus())
                    .bind("active", user.getActive())
                    .bind("provider", user.getProvider())
                    .bind("providerUserId", user.getProviderUserId())
                    .execute();
        });
    }

    public static boolean addUser(String username, String fullname, String email, String phone_number, String password) {
        boolean result = false;
        String insertQuery = "INSERT INTO users (role_id, username, fullname, email, phone_number, sex, address, password, created_at, status) " +
                "VALUES (?, ?, ?, ?, ?, '', '', ?, ?, 1)";

        try (Handle handle = JDBIConnector.me().open()) {
            int rowsInserted = handle.createUpdate(insertQuery)
                    .bind(0, 2)
                    .bind(1, username)
                    .bind(2, fullname)
                    .bind(3, email)
                    .bind(4, phone_number)
                    .bind(5, password)
                    .bind(6, LocalDateTime.now().toString())
                    .execute();

            result = rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi để theo dõi và xử lý nếu cần
        }

        return result;
    }


    public static boolean loginUser(String username, String password) {
        try {
            int count = JDBIConnector.me().withHandle(handle ->
                    handle.createQuery("SELECT COUNT(*) FROM users WHERE username = ? AND password = ? AND active = 1")
                            .bind(0, username)
                            .bind(1, password)
                            .mapTo(Integer.class)
                            .one()
            );

            return count > 0;
        } catch (JdbiException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean updateUser(User user) {
        boolean result = false;
        String updateQuery = "UPDATE users SET fullname = 1, phone_number = 1, sex = 1, address = 1 WHERE username = 1";
        try (Handle handle = JDBIConnector.me().open()) {
            handle.createUpdate(updateQuery)
                    .bind(0, user.getFullName())
                    .bind(1, user.getPhoneNumber())
                    .bind(2, user.getSex())
                    .bind(3, user.getAddress())
                    .execute();
            result = true;
        }
        return result;
    }

    public static User getUserByUserName(String userName) {
        Optional<User> user = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("select * from users where username = ?")
                        .bind(0, userName).mapToBean(User.class).stream().findFirst());
        return user.isEmpty() ? null : user.get();
    }

    public static User getUserByUserNameAndPassword(String username, String password) {
        Optional<User> user = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("select * from users where username = :username and password = :password")
                        .bind("username", username)
                        .bind("password", password).mapToBean(User.class).stream().findFirst());
        return user.isEmpty() ? null : user.get();
    }

    public static boolean isPasswordExists(String password) {
        try {
            int count = JDBIConnector.me().withHandle(handle ->
                    handle.createQuery("SELECT COUNT(*) FROM users WHERE password = ?")
                            .bind(0, password)
                            .mapTo(Integer.class)
                            .one()
            );

            return count > 0;
        } catch (JdbiException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static String getEmail(String username) {
        try {
            Optional<User> user = JDBIConnector.me().withHandle(handle ->
                    handle.createQuery("select email from users where username = :username")
                            .bind("username", username).mapToBean(User.class).stream().findFirst());
            return user.map(User::getEmail).orElse("");
        } catch (JdbiException e) {
            return "";
        }
    }


    public static boolean updateActiveAccount(String username) {
        try {
            int updatedRows = JDBIConnector.me().withHandle(handle ->
                    handle.createUpdate("UPDATE users SET active = 1 WHERE username = ?")
                            .bind(0, username)
                            .execute()
            );

            return updatedRows > 0;
        } catch (JdbiException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static int getNotActiveAccount(String username) {
        try {
            int count = JDBIConnector.me().withHandle(handle ->
                    handle.createQuery("SELECT COUNT(*) FROM users WHERE username = ? AND active = false")
                            .bind(0, username)
                            .mapTo(Integer.class)
                            .one()
            );

            return count;
        } catch (JdbiException e) {
            e.printStackTrace();
            return -1; // Lỗi sẽ -1
        }
    }

    public static boolean changePassword(String username, String newPassword) {
        try {
            int updatedRows = JDBIConnector.me().withHandle(handle ->
                    handle.createUpdate("UPDATE users SET password = ? WHERE username = ?")
                            .bind(0, newPassword)
                            .bind(1, username)
                            .execute()
            );
            return updatedRows > 0;
        } catch (JdbiException e) {
            e.printStackTrace();
            return false;
        }
    }

    private static final String SELECT_USER_SQL = "SELECT * FROM users WHERE username = :username";

    public static User getUserInfo(String username) {
        Optional<User> user = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("select * from users where username = :username")
                        .bind("username", username).mapToBean(User.class).stream().findFirst());
        return user.isEmpty() ? null : user.get();
    }

    public static User getUser() {
        Optional<User> user = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("select * from users")
                        .mapToBean(User.class).stream().findFirst());
        return user.isEmpty() ? null : user.get();
    }


    private static final String SELECT_USERNAME_SQL = "SELECT username FROM users WHERE username = :username";

// Các phương thức khác của lớp DAO

    public static String getUserName(String username) {
        try {
            JDBIConnector.me().withHandle(handle ->
                    handle.createQuery(SELECT_USERNAME_SQL)
                            .bind("username", username)
                            .mapTo(String.class)
                            .findFirst()
                            .orElse(null)
            );
        } catch (JdbiException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean updateUserInfomationById(String fullname, String phone_number, int id) {
        int rowsUpdated = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE users SET fullname = ?, phone_number = ?, updated_at = ? WHERE id = ?")
                        .bind(0, fullname)
                        .bind(1, phone_number)
                        .bind(2, LocalDateTime.now().toString())
                        .bind(3, id)
                        .execute()
        );
        return rowsUpdated > 0;
    }


    public static User getUserById(int id) {
        Optional<User> user = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("select * from users where id = :id")
                        .bind("id", id).mapToBean(User.class).stream().findFirst());
        return user.isEmpty() ? null : user.get();
    }

    public static boolean updateUserAddressById(String address, int id) {
        int rowsUpdated = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE users SET address = :address WHERE id = :id")
                        .bind("address", address)
                        .bind("id", id)
                        .execute()
        );
        return rowsUpdated > 0;
    }

    public static boolean checkPassByUserId(int id, String password) {
        Optional<User> user = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("select password from users where id = :id")
                        .bind("id", id).mapToBean(User.class).stream().findFirst());
        if (user.isPresent()) {
            return user.get().getPassword().equals(password);
        }
        return false;
    }

    public static boolean changePassworById(int id, String password) {
        int rowsUpdated = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE users SET password = :password WHERE id = :id")
                        .bind("password", password)
                        .bind("id", id)
                        .execute()
        );
        return rowsUpdated > 0;
    }

    public static List<User> getAll() {
        List<User> users = JDBIConnector.me().withHandle((handle -> handle.createQuery("select * from users")
                .mapToBean(User.class).stream().collect(Collectors.toList())));
        return users;
    }

    public static boolean setStatusById(int id) {
        int rowsUpdated = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE users SET status = ?, updated_at = ? WHERE id = ?")
                        .bind(0, 1)
                        .bind(1, LocalDateTime.now().toString())
                        .bind(2, id)
                        .execute()
        );
        return rowsUpdated > 0;
    }

    public static boolean setStatuslockById(int id) {
        int rowsUpdated = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE users SET status = ?, updated_at = ? WHERE id = ?")
                        .bind(0, 2)
                        .bind(1, LocalDateTime.now().toString())
                        .bind(2, id)
                        .execute()
        );
        return rowsUpdated > 0;
    }

    public static int getSatusById(int id) {
        int status = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT status FROM users WHERE id = ?")
                        .bind(0, id)
                        .mapTo(Integer.class)
                        .one()
        );
        return status;
    }

    public static boolean setRoleIdAdmin(int id) {
        int rowsUpdated = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE users SET role_id = ?, updated_at = ? WHERE id = ?")
                        .bind(0, 1)
                        .bind(1, LocalDateTime.now().toString())
                        .bind(2, id)
                        .execute()
        );
        return rowsUpdated > 0;
    }

    public static boolean setRoleIdUser(int id) {
        int rowsUpdated = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE users SET role_id = ?, updated_at = ? WHERE id = ?")
                        .bind(0, 2)
                        .bind(1, LocalDateTime.now().toString())
                        .bind(2, id)
                        .execute()
        );
        return rowsUpdated > 0;
    }

    public static int getRoleById(int id) {
        int roleId = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT role_id FROM users WHERE id = ?")
                        .bind(0, id)
                        .mapTo(Integer.class)
                        .one()
        );
        return roleId;
    }

    public static String getFullNameById(int id) {
        String fullName = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT fullname FROM users WHERE id = ?")
                        .bind(0, id)
                        .mapTo(String.class)
                        .one()
        );
        return fullName;
    }

    public static boolean updateUserAdminById(int id, String username, String fullname, String phone_number, String email, String password) {
        int rowsUpdated = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE users SET username = ?, fullname = ?, phone_number = ?, email = ?, password = ?, updated_at = ? WHERE id = ?")
                        .bind(0, username)
                        .bind(1, fullname)
                        .bind(2, phone_number)
                        .bind(3, email)
                        .bind(4, password)
                        .bind(5, LocalDateTime.now().toString())
                        .bind(6, id)
                        .execute()
        );
        return rowsUpdated > 0;
    }

    public static boolean insertUserAdmin(int role, String username, String fullname, String phone_number, String email, String password) {
        int rowsInserted = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("INSERT INTO users (role_id, username, fullname, phone_number, email, password, status, active, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)")
                        .bind(0, role)
                        .bind(1, username)
                        .bind(2, fullname)
                        .bind(3, phone_number)
                        .bind(4, email)
                        .bind(5, password)
                        .bind(6, 1) // status = 1
                        .bind(7, 1) // active = 1
                        .bind(8, LocalDateTime.now().toString())
                        .execute()
        );
        return rowsInserted > 0;
    }


    public static void main(String[] args) {
//        User user = UserDAO.getUserInfo("112649102310854549392");
//        System.out.println(user);
        System.out.println(getFullNameById(1));

    }


}







