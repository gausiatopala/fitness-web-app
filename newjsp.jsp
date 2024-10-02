<%-- 
    Document   : newjsp
    Created on : 28 Sep, 2024, 3:26:20 PM
    Author     : farid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("c");
    String password = request.getParameter("b");
    String op = request.getParameter("a");

    if (op.equals("register")) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            
           Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitnessapp", "root", "nothingmuch123");


            
            String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password); 

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("dashboard.html");
            } else {
                out.println("User registration failed. Please try again.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Database error: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("JDBC Driver not found.");
        } finally {
            // Clean up resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    } else {
        out.println("Please fill in the details correctly.");
    }
%>


</body>
</html>
