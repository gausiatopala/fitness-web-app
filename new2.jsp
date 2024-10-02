<%-- 
    Document   : new2
    Created on : 28 Sep, 2024, 4:06:51 PM
    Author     : farid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%@page language="java" %>
    <body>
        <%
            String o = request.getParameter("wplans");
            String f = request.getParameter("dplans");

            if ("Workout Plans".equals(o)) {
                response.sendRedirect("workoutplans.html");
                return;
            } else if ("Diet Plans".equals(f)) {
                response.sendRedirect("dietplans.html");
                return;
            } else {
                out.println("Invalid operation");
            }
        %>



    </body>
</html>
