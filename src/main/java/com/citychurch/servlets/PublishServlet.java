package com.citychurch.servlets;

import jakarta.jms.ConnectionFactory;
import jakarta.jms.JMSContext;
import jakarta.jms.Topic;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.naming.InitialContext;
import java.io.IOException;

@WebServlet("/publish")
public class PublishServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String notificationText = request.getParameter("notificationText");

        if (notificationText != null && !notificationText.trim().isEmpty()) {
            try {
                InitialContext ic = new InitialContext();
                ConnectionFactory connectionFactory = (ConnectionFactory) ic.lookup("jms/CityChurchConnectionFactory");
                Topic notificationTopic = (Topic) ic.lookup("jms/CityChurchNotificationTopic");

                try (JMSContext context = connectionFactory.createContext()) {
                    context.createProducer().send(notificationTopic, notificationText);
                }
            } catch (Exception e) {
                System.err.println(e.getMessage());
            }
        }

        response.sendRedirect("home.jsp");
    }
}