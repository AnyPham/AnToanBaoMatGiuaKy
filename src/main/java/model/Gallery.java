package model;

public class Gallery {
    private int id;
    private int product_id;
    private String img;

    public Gallery() {
    }

    public Gallery(int id, int product_id, String img) {
        this.id = id;
        this.product_id = product_id;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Gallery{" +
                "id=" + id +
                ", product_id=" + product_id +
                ", img='" + img + '\'' +
                '}';
    }
}
