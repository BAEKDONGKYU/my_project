package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator{
	PasswordAuthentication pa;
    
    public MailAuth() {
        String mail_id = "wcdls123@gmail.com";
        String mail_pw = "!itwill123";
        
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}
