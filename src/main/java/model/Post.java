package model;

import java.rmi.Remote;
import java.time.LocalDate;

public class Post {
  private int id;
  private String title;
  private String content;
  private String author;
  private String img;


  public Post(int id, String title, String content, String author, String img) {
    this.id = id;
    this.title = title;
    this.content = content;
    this.author = author;
    this.img = img;
  }

  public Post() {
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getAuthor() {
    return author;
  }

  public void setAuthor(String author) {
    this.author = author;
  }

  public String getImg() {
    return img;
  }

  public void setImg(String img) {
    this.img = img;
  }

  @Override
  public String toString() {
    return "Post{" +
      "id=" + id +
      ", title='" + title + '\'' +
      ", content='" + content + '\'' +
      ", author='" + author + '\'' +
      ", img='" + img + '\'' +
      '}';
  }

  public void updatePost(String title, String content, String author, String img) {
    this.title = title;
    this.content = content;
    this.author = author;
    this.img = img;
  }

  public void setImage(String img) {
    this.img = img;
  }
}
