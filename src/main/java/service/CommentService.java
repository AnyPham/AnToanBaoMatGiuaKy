package service;

import dao.CommentDao;
import model.Comment;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CommentService {
    private static CommentService instance;

    public static CommentService getInstance() {
        if (instance == null)
            instance = new CommentService();
        return instance;
    }

    public static List<Comment> getCommentById(int id) {
        return CommentDao.getCommentById(id);
    }

    public static void insertComment(int userId, int productId, String contents, String star) {
        CommentDao.insertComment(userId, productId, contents, star);
    }

    public List<Comment> getAllComment() {
      return CommentDao.getAllComment();
    }
    public int getDisplayById(int id){
        return CommentDao.getDisplayById(id);
    }
    public boolean setDisplayHidden(int id){
        return CommentDao.setDisplayHidden(id);
    }
    public boolean setDisplayShow(int id){
        return CommentDao.setDisplayShow(id);
    }
    public void setDisplay(int id){
        if (CommentService.getInstance().getDisplayById(id) == 1){
            CommentService.getInstance().setDisplayHidden(id);
        } else if (CommentService.getInstance().getDisplayById(id) == 2){
            CommentService.getInstance().setDisplayShow(id);
        }
    }

    public static void main(String[] args) {
            CommentService.getInstance().setDisplay(1);
    }

}