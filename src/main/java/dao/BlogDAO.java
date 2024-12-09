package dao;

import db.JDBIConnector;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;
import org.jdbi.v3.core.statement.Update;
import model.Post;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;


public class BlogDAO {
    public static List<Post> getAllPosts() {
        List<Post> posts = JDBIConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM posts").mapToBean(Post.class).stream().collect(Collectors.toList()));
        return posts;
    }

    public static Post getPostById(int postId) {
        String query = "SELECT * FROM posts WHERE id = :postId";
        return JDBIConnector.me().withHandle(handle -> handle.createQuery(query)
                .bind("postId", postId)
                .mapToBean(Post.class)
                .findOne()
                .orElse(null));
    }

    public static void addPost(Post post) {
        String query = "INSERT INTO posts (title, content, author, img) VALUES ( :title, :content, :author, :img)";
        JDBIConnector.me().useHandle(handle -> {
            Update update = handle.createUpdate(query)
                    .bind("title", post.getTitle())
                    .bind("content", post.getContent())
                    .bind("author", post.getAuthor())
                    .bind("img", post.getImg());
            update.execute();
        });
    }

    public static void main(String[] args) {
//    System.out.println(getAllPosts());
        addPost("1223", "sadas", "dasd", "asda");
    }

    public static void deletePost(int postId) {
        JDBIConnector.me().useHandle(handle -> {
            String query = "DELETE FROM posts WHERE id = ?";
            handle.execute(query, postId);
        });
    }

    public static void updatePost(Post post) {
        JDBIConnector.me().useHandle(handle -> {
            String query = "UPDATE posts SET  title = ?, content = ?, author = ?, img =? WHERE id = ?";
            handle.execute(query, post.getTitle(), post.getContent(), post.getAuthor(), post.getImg());
        });
    }


    public static void addPost(String title, String content, String author, String img) {
        JDBIConnector.me().useHandle(handle -> {
            String query = "INSERT INTO posts( title, content, author, img) VALUES ( :title, :content, :author, :img)";
            handle.createUpdate(query)
                    .bind("title", title)
                    .bind("content", content)
                    .bind("author", author)
                    .bind("img", img)
                    .execute();
        });
    }


    public static int getNewID() {
        AtomicInteger newID = new AtomicInteger(0);
        String query = "SELECT MAX(id) + 1 AS new_id FROM posts";
        JDBIConnector.me().useHandle(handle ->
                newID.set(handle.createQuery(query)
                        .mapTo(Integer.class)
                        .findFirst()
                        .orElse(0))
        );

        return newID.get();
    }

    public static int getPostId(int idParam) {
        int postId = 0;

        try {
            postId = JDBIConnector.me().withHandle(new HandleCallback<Integer, Exception>() {
                @Override
                public Integer withHandle(Handle handle) throws Exception {
                    return handle.createQuery("SELECT postId FROM posts WHERE id = :id")
                            .bind("id", idParam)
                            .mapTo(Integer.class)
                            .findFirst()
                            .orElse(0);
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }

        return postId;
    }

    public static String getNewTitle(int idParam) {
        String newTitle = "";

        try {
            newTitle = JDBIConnector.me().withHandle(new HandleCallback<String, Exception>() {
                @Override
                public String withHandle(Handle handle) throws Exception {
                    return handle.createQuery("SELECT newTitle FROM posts WHERE id = :id")
                            .bind("id", idParam)
                            .mapTo(String.class)
                            .findFirst()
                            .orElse(null);
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }

        return newTitle;
    }

    public static String getNewContent(int idParam) {
        String newContent = "";

        try {
            newContent = JDBIConnector.me().withHandle(new HandleCallback<String, Exception>() {
                @Override
                public String withHandle(Handle handle) throws Exception {
                    return handle.createQuery("SELECT newContent FROM posts WHERE id = :id")
                            .bind("id", idParam)
                            .mapTo(String.class)
                            .findFirst()
                            .orElse(null);
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }

        return newContent;

    }

    public static String getNewAuthor(int idParam) {
        String newAuthor = "";

        try {
            newAuthor = JDBIConnector.me().withHandle(new HandleCallback<String, Exception>() {
                @Override
                public String withHandle(Handle handle) throws Exception {
                    return handle.createQuery("SELECT newAuthor FROM posts WHERE id = :id")
                            .bind("id", idParam)
                            .mapTo(String.class)
                            .findFirst()
                            .orElse(null);
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }

        return newAuthor;
    }

    public static String getNewImg(int idParam) {
        String newImg = "";

        try {
            newImg = JDBIConnector.me().withHandle(new HandleCallback<String, Exception>() {

                public String withHandle(Handle handle) throws Exception {
                    return handle.createQuery("SELECT newImg FROM posts WHERE id = :id")
                            .bind("id", idParam)
                            .mapTo(String.class)
                            .findFirst()
                            .orElse(null);
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }

        return newImg;
    }

    public static boolean changeInfoBlog(int id, String title, String author, String content, String imgProduct) {
        int rowAffected = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE posts SET title = :title, content = :content, author = :author, img=:img WHERE id = :id")
                        .bind("title", title)
                        .bind("content", content)
                        .bind("author", author)
                        .bind("img", imgProduct)
                        .bind("id", id)
                        .execute());

        return rowAffected > 0;
    }

    public static boolean removeBlog(int id) {
        int rowsUpdated = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate("DELETE FROM posts WHERE id = :id")
                        .bind("id", id)
                        .execute()
        );
        return rowsUpdated > 0;
    }


    public boolean updatePost(String postId, String newTitle, String newContent, String newAuthor, String newImg) {
        return JDBIConnector.me().withHandle(handle -> {
            String query = "UPDATE posts SET title = ?, content = ?, author = ?, img = ? WHERE id = ?";
            int rowsAffected = handle.createUpdate(query)
                    .bind(0, newTitle)
                    .bind(1, newContent)
                    .bind(2, newAuthor)
                    .bind(3, newImg)
                    .bind(4, postId)
                    .execute();

            return rowsAffected > 0;
        });
    }

}


