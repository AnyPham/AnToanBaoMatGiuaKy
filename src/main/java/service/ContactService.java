package service;

import dao.ContactDAO;
import model.Contact;

import java.util.List;

public class ContactService {
    private static ContactService instance;

    public static ContactService getInstance() {
        if (instance == null)
            instance = new ContactService();
        return instance;
    }
    public List<Contact> getAllContacts(){
        return ContactDAO.getAllContacts();
    }
    public String getEmailById(int id){
        return ContactDAO.getEmailById(id);
    }
}
