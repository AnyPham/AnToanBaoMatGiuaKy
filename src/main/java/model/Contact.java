package model;

public class Contact implements IModel {
    private int id;
    private String name;
    private String email;
    private String phone_number;
    private String content;

    public Contact() {
    }

    public Contact(int id, String name, String email, String phone_number, String content) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone_number = phone_number;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Contact{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone_number='" + phone_number + '\'' +
                ", content='" + content + '\'' +
                '}';
    }

    @Override
    public String table() {
        return "Contact";
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
