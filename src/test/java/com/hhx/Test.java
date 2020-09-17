package com.hhx;

import com.hhx.body.User;
import com.hhx.dao.IUserDao;
import com.hhx.service.Imp.UserService;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class Test {
    @org.junit.Test
    public void UserTest()
    {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("bean.xml");
        UserService ac = (UserService) applicationContext.getBean("UserService");
        ac.getAll();
    }
    @org.junit.Test
    public void testmybatis() throws IOException {
        //整合到Spring里就不用写这么多了
//        InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
//        SqlSessionFactoryBuilder builder =new SqlSessionFactoryBuilder();
//        SqlSessionFactory factory =builder.build(in);
//        SqlSession session = factory.openSession();
//        IUserDao dao = session.getMapper(IUserDao.class);
//        List<User> list = dao.getAll();
//        for (User s : list) {
//            System.out.println(s.toString());
//        }
    }
}
