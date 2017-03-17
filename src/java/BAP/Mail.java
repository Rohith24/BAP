package BAP;
import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
    private String to,from,message,subject,smtpServ;
    public String getTo() {
        return to;
    }
    public void setTo(String to) {
        this.to = to;
    }
    public String getFrom() {
        return from;
    }
    public void setFrom(String from) {
        this.from = from;
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getSmtpServ() {
        return smtpServ;
    }
    public void setSmtpServ(String smtpServ) {
        this.smtpServ = smtpServ;
    }
    public String sendMail() {
        try {
            Properties props = System.getProperties();
            // ­­ Attaching to default Session, or we could start a new one ­­
            props.put("mail.transport.protocol","smtp");
            props.put("mail.smtp.starttls.enable","true");
            props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
            props.put("mail.smtp.host",smtpServ);
            props.put("mail.smtp.port", 587);
            props.put("mail.smtp.auth","true");
            Authenticator auth = new SMTPAuthenticator();
            Session session = Session.getInstance(props,auth);
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(from));
            msg.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to,false));
            msg.setSubject(subject);
            msg.setText(message);
            msg.setHeader("MyMail","Mr.XYZ");
            msg.setSentDate(new Date());
            Transport.send(msg);
            System.out.println("Message sent to " + to + " OK. ");
            return "Message sent to " + to;
        } catch (Exception ex) {
            System.out.println("Exception " + ex);
            return "Exception " + ex.getMessage();
        }
    }
    private class SMTPAuthenticator extends javax.mail.Authenticator {
        public PasswordAuthentication getPasswordAuthentication() {
            String username = "nvscience@gmail.com"; // specify your email id here (sender' s email id)
            String password = "**********"; // specify your password here
            return new PasswordAuthentication(username, password);
        }
    }
}