package service;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;



public class EmailSender {

//   thông tin cá nhân
  private static final String EMAIL_USERNAME = "binhquoc23@gmail.com";
  private static final String EMAIL_PASSWORD = "bibo uriu dcid eazy\n";

  public static void sendEmail(String toEmail, String subject, String body) {
    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "587");




    Session session = Session.getInstance(props, new Authenticator() {
      protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(EMAIL_USERNAME, EMAIL_PASSWORD);
      }
    });

    try {
      Message message = new MimeMessage(session);

      message.setFrom(new InternetAddress(EMAIL_USERNAME));
      message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
      message.setSubject(subject); //tiêu đề email
      message.setText(body); // thân email

      Transport.send(message);//gửi email

      System.out.println("Email đã gửi thành công đến: " + toEmail);
    } catch (MessagingException e) {
      System.err.println("Lỗi không thể gửi được email đến: " + toEmail);
      e.printStackTrace();

    }
  }

  public static void main(String[] args) {

        String toEmail = "21130290@st.hcmuaf.edu.vn";
        String subject = " Ma xac nhan OTP de doi mat khau";
        String otp = OTPGenerator.generateOTP();
        String body = "Ma xac nhan cua ban la: " + otp;

        // Gửi email đi
        EmailSender.sendEmail(toEmail, subject, body);
  }
}


