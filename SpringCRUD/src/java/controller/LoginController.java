/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import model.HibernateUtil;
import model.Users;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

/**
 *
 * @author user
 */
public class LoginController extends SimpleFormController {

    public LoginController() {
        setCommandClass(Users.class);
        setCommandName("users");
//        setSuccessView("employee");
        setFormView("index");
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        ModelAndView mv = new ModelAndView("employee");
        String out = "Welcome ";
        Users users = (Users) command;
        out += users.getUname();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String queryString = "from Users where uname=:name and pass=:pass";
            Query query = session.createQuery(queryString);
            query.setString("name", users.getUname());
            query.setString("pass", users.getPass());
            List result = query.list();
            session.getTransaction().commit();
            if (result.size() > 0) {
                Session session2 = HibernateUtil.getSessionFactory().openSession();
                session2.beginTransaction();
                String queryString2 = "from Employee";
                Query query2 = session2.createQuery(queryString2);
                List result2 = query2.list();
                mv.addObject("employees", result2);
                mv.addObject("message", out);
                session2.getTransaction().commit();
                return mv;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        ModelAndView mv2 = new ModelAndView("index");
        mv2.addObject("users", users);
        mv2.addObject("message","Wrong User name or Password");
        return mv2;//new ModelAndView(new RedirectView("index.htm"));

    }

}
