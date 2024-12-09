package dao;

import db.JDBIConnector;
import model.Comment;
import model.Product;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class CommentDao {
    public static List<Comment> getCommentById(int id) {
        List<Comment> comments = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM comments WHERE product_id = :id and display = 1")
                        .bind("id", id)
                        .mapToBean(Comment.class)
                        .stream().collect(Collectors.toList()));
        return comments;
    }
    public static void insertComment( int userId, int productId, String contents, String star) {
        JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("INSERT INTO comments( user_id, product_id, contents, star, display, create_date) " +
                                "VALUES ( :user_id, :product_id, :contents, :star, :display, :create_date)")
                        .bind("user_id", userId)
                        .bind("product_id", productId)
                        .bind("contents", contents)
                        .bind("star", star)
                        .bind("display", 1)
                        .bind("create_date", LocalDateTime.now().toString())
                        .execute());
    }
    public static List<Comment> getAllComment() {
        List<Comment> comments = JDBIConnector.me().withHandle((handle ->
                handle.createQuery("select * from comments ")
                        .mapToBean(Comment.class).stream().collect(Collectors.toList())));
        return comments;
    }
    public static int getDisplayById(int id){
        int display = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT display FROM comments WHERE id = ?")
                        .bind(0, id)
                        .mapTo(Integer.class)
                        .one()
        );
        return display;
    }
    public static boolean setDisplayHidden(int id) {
        int rowsDisplay = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE comments SET display = ? WHERE id = ?")
                        .bind(0, 2)
                        .bind(1, id)
                        .execute()
        );
        return rowsDisplay > 0;
    }
    public static boolean setDisplayShow(int id) {
        int rowsDisplay = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE comments SET display = ? WHERE id = ?")
                        .bind(0, 1)
                        .bind(1, id)
                        .execute()
        );
        return rowsDisplay > 0;
    }
    public static void main(String[] args) {
        System.out.println(getCommentById(1));
    }
}
