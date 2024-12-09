package model;
import java.time.LocalDateTime;
public class Comment implements IModel{
    private int id;
    private int userId;
    private int productId;
    private String contents;
    private String star;
    private int display;
    private LocalDateTime create_date;

    public Comment() {
    }



    public Comment(int id, int userId, int productId, String contents, String star, int display, LocalDateTime create_date) {
        this.id = id;
        this.userId = userId;
        this.productId = productId;
        this.contents = contents;
        this.star = star;
        this.display = display;
        this.create_date = create_date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getStar() {
        return star;
    }

    public void setStar(String star) {
        this.star = star;
    }

    public int getDisplay() {
        return display;
    }

    public void setDisplay(int display) {
        this.display = display;
    }

    public LocalDateTime getCreate_date() {
        return create_date;
    }

    public void setCreate_date(LocalDateTime create_date) {
        this.create_date = create_date;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", userId=" + userId +
                ", productId=" + productId +
                ", contents='" + contents + '\'' +
                ", star='" + star + '\'' +
                ", display=" + display +
                ", create_date=" + create_date +
                '}';
    }

    @Override
    public String table() {
        return "comments";
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