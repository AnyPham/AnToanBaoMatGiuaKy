package model;

public class TypeMachine {
    private int id;
    private String type_name;

    public TypeMachine(int id, String type_name) {
        this.id = id;
        this.type_name = type_name;
    }

    public TypeMachine() {
    }

    @Override
    public String toString() {
        return "TypeMachine{" +
                "id=" + id +
                ", type_name='" + type_name + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }
}
