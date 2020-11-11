<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           String un = request.getParameter("a");
  	      String pwd = request.getParameter("b");
  	    
        
try
      
  {
       
     Class.forName("com.mysql.jdbc.Driver");
     
   }
    
    catch (ClassNotFoundException e) {
         
   out.print("MySQL JDBC Driver not found !!");
            return;
       
 }
      
  out.print("MySQL JDBC Driver Registered!");
   
     Connection conn = null;
        
   
 
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sample", "root", "");
 
           Statement st=conn.createStatement();
           ResultSet rs=st.executeQuery("select * from reg where username='"+un+"'");
           if(rs.next()) 
           {%>
         
    <script type="text/javascript">
   alert("alrdy exist username");

   </script>
           <% 
          // request.getRequestDispatcher("Registration.html"). include(request, response);
           }
           
           else{
      
           int i=st.executeUpdate("insert into reg(username,password) values('"+un+"','"+pwd+"')");
          // out.println("Data is successfully inserted!");
   
     
       if (i>0) 
            {%>
    	   <script type="text/javascript">
    	   alert("register sucessfully");

    	   </script>

    	   <%
    	         
    	  
    	        
    	      request.getRequestDispatcher("Registration.html"). include(request, response); 
    	       
    	       }
    	         
    	     else{
    	           
    	       %>	
    	          
    	     <script type="text/javascript">
    	   alert("invalid username and password");

    	   </script>
    	             
    	    <%
    	                  
    	      request.getRequestDispatcher("dataowner.jsp"). include(request, response);
    	                  
    	           }
           }
    	             %>
    </body>
</html>
