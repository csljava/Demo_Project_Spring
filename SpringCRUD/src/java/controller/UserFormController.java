/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import model.Employee;
import model.HibernateUtil;
import model.Users;
import org.hibernate.Session;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

/**
 *
 * @author user
 */
public class UserFormController extends SimpleFormController {

    public UserFormController() {
        setCommandClass(Users.class);
        setCommandName("users");
//        setSuccessView("index");
        setFormView("userReg");
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {

        Users users = (Users) command;
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(users);
            //session.getTransaction().commit();
            ModelAndView mv = new ModelAndView("employee");
//            EmployeeController emp = new EmployeeController();
            List result = session.createQuery("from Employee").list();
            mv.addObject("employees", result);
            mv.addObject("message", "Successfully Registered");
            session.getTransaction().commit();
            return mv;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;

    }

}
