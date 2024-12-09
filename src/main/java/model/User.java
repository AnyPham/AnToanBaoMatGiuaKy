package model;


import java.time.LocalDateTime;

public class User implements IModel {
    private int id;
    private int roleId;
    private String userName;
    private String fullName;
    private String email;
    private String phoneNumber;
    private String sex;
    private String address;
    private String password;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private int status;
    private int active;
    private String provider;
    private String providerUserId;

    public User() {
    }

    public User(int id, int roleId, String userName, String fullName, String email, String phoneNumber, String sex, String address, String password, LocalDateTime createdAt, LocalDateTime updatedAt, int status, int active, String provider, String providerUserId) {
        this.id = id;
        this.roleId = roleId;
        this.userName = userName;
        this.fullName = fullName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.sex = sex;
        this.address = address;
        this.password = password;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.status = status;
        this.active = active;
        this.provider = provider;
        this.providerUserId = providerUserId;
    }

    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }

    public String getProviderUserId() {
        return providerUserId;
    }

    public void setProviderUserId(String providerUserId) {
        this.providerUserId = providerUserId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", roleId=" + roleId +
                ", userName='" + userName + '\'' +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", sex='" + sex + '\'' +
                ", address='" + address + '\'' +
                ", password='" + password + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                ", status=" + status +
                ", active=" + active +
                ", provider='" + provider + '\'' +
                ", providerUserId='" + providerUserId + '\'' +
                '}';
    }

    @Override
    public String table() {
        return "user";
    }

    @Override
    public String beforeData() {
        return "";
    }

    @Override
    public String afterData() {
        return toString();
    }
}



