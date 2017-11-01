package com.project.listener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ServerListener implements ServletContextListener {


    private WebApplicationContext springContext;

//    private InitService initService;


    public void contextInitialized(ServletContextEvent event) {

        springContext = WebApplicationContextUtils
                .getWebApplicationContext(event.getServletContext());
//        initService = springContext.getBean(InitService.class);
//        initService.start();
    }

    public void contextDestroyed(ServletContextEvent servletContextEvent) {
//        initService.close();
    }




}
