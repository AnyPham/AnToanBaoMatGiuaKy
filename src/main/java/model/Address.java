package model;

public class Address {
    String id;
    int userId;
    String address;
    String receiver;
    String phoneNumber;

    public Address(String id, int userId, String address, String receiver, String phoneNumber) {
        this.id = id;
        this.userId = userId;
        this.address = address;
        this.receiver = receiver;
        this.phoneNumber = phoneNumber;
    }

    public Address(String phoneNumber, String receiver, String address, int userId) {
        this.phoneNumber = phoneNumber;
        this.receiver = receiver;
        this.address = address;
        this.userId = userId;
    }

    public Address() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Override
    public String toString() {
        return "Address{" +
                "id='" + id + '\'' +
                ", userId=" + userId +
                ", address='" + address + '\'' +
                ", receiver='" + receiver + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                '}';
    }
}
