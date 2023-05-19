<%-- 
    Document   : index
    Created on : 20 May, 2023, 12:56:47 AM
    Author     : John Mugesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 💻 IPL_5b</title>
    <style>
        hr{
    background-color: rgb(139, 0, 0);
    border-top-color: rgb(139, 0, 0);
    border-right-color: rgb(139, 0, 0);
    border-bottom-color: rgb(139, 0, 0);
    border-left-color: rgb(139, 0, 0);
    border-style: solid;
   }
   mt{
    font-size:1cm; 
    font-family: 'Times New Roman', Times, serif; 
    color: rgb(90, 44, 255);
   }
   mt1{
    color: brown;
   }
    p{
         font-size: 0.5cm; 
         font-family: 'Times New Roman', Times, serif; 
         color: rgb(60, 136, 126);
        }
    </style>
</head>
    <body style = "background-color: rgb(240, 201, 150); "> <!--   Inline Stylying using style property  -->
        <hr>
        <mt>  gadgets  </mt>  
    <br>
    <hr >
    <p>
        New and variety Gadgets
        <br><br> 
    Login below and see the Magic !!!
    
    <hr >
    <form method="get" action="index.jsp" >
            <label>Name: </label>
                <input type="text" name="n"/>
                <input type="submit" value="SUBMIT"/>
        </form>
    <%-- start web service invocation --%><hr/>
    <%
    try {
	royal.Gadget1_Service service = new royal.Gadget1_Service();
	royal.Gadget1 port = service.getGadget1Port();
	 // TODO initialize WS operation arguments here
	String name = request.getParameter("n");
	// TODO process result here
	java.lang.String result = port.hello(name);
	out.println("Result = "+result);
    
     String JDBC_DRIVER = "com.mysql.jdbc.Driver";
String DB_URL = "jdbc:mysql://localhost:3306/gadget";

// Database credentials
String USER = "root";
String PASS = "";

// Set response content type
response.setContentType("text/html");
PrintWriter out1 = response.getWriter();


String summa = "Database Result ";

if ( name.length() > 0)
{
 out1.println( "<html>\n");
    out1.println(   "<head> ");
     out1.println("</head>\n"); 
     out1.println("<body bgcolor = \"#f0f0f0\">\n");
       out1.println("<br>");
       out1.println("<hr>");
    
        out1.println( "<center><h1 > "+summa +"</h1></center>");
    
        // Register JDBC driver
        Class.forName(JDBC_DRIVER);
    
        // Open a connection
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    
        // Execute SQL query
        Statement stmt = conn.createStatement();
        String sql;
        sql = "SELECT * FROM gadgetdb;";
        ResultSet rs = stmt.executeQuery(sql);
    
       
        out1.println(" <style> th, td { ");
            out1.println("padding-top: 10px;");
            out1.println(" padding-bottom: 20px;");
            out1.println("padding-left: 30px;");
            out1.println("padding-right: 40px;");
            out1.println("} </style><center><div><table border = 1 >");
        
        out1.println("<center><div><table border = 1 >");
        out1.println("<tr><td> Customer id </td>");
        out1.println("<td> Customer name </td>");
        out1.println("<td> product </td>");
        out1.println("<td> price </td></tr>");
    
        // Retrieve by column name
            

        // Extract data from result set
        while (rs.next()) {
            String cid = rs.getString("C_id");
            String cn = rs.getString("c_name");
            String pdt = rs.getString("product");
            String pce = rs.getString("price");
            
            // Display values
            out1.println("<tr> <td>" + cid + " </td>");
            out1.println("<td>" + cn + "</td>");
            out1.println("<td>" + pdt + "</td>");
            out1.println("<td >" + pce + "</td>");
            out1.println("<td> ");
            out1.println("</td></tr> ");
              
        }
       
    

    out1.println("</table></div></center>");
    out1.println("</body></html>");

    rs.close();
    stmt.close();
    conn.close();
} 
    }
catch (Exception e) {
    
        }
   
    
    %>
    
    <%-- end web service invocation --%><hr/>
    
  
    <%-- start web service invocation --%><hr/>
    
    <%-- end web service invocation --%><hr/>
    <%-- start web service invocation --%><hr/>
    
    <%-- end web service invocation --%><hr/>
    </body>
       
</html>

