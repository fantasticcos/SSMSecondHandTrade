package com.hhx.listener;

import com.mysql.jdbc.Driver;
import org.springframework.jdbc.support.JdbcUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

public class ContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {

    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {


//        //手动取消驱动程序的注册：
//        Enumeration drivers = DriverManager.getDrivers();
//        while (drivers.hasMoreElements()) {
//            Driver driver = (Driver) drivers.nextElement();
//            try {
//                DriverManager.deregisterDriver(driver);
//                System.out.println("deregistering jdbc driver: "+driver);
//            } catch (SQLException e) {
//                e.printStackTrace();
//                System.out.println("Error deregistering driver"+driver);
//            }
//        }
        //手动停止名为[mysql-cj-abandoned-connection-cleanup]的线程

    }
}
