import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.Connection;

public class display extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Connection conn = null;
        Statement stmt = null;
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gadget", "root", "");
            if (conn != null) {
                out.println("<h1> Connection established successfully </h1>");
            }
            stmt = conn.createStatement();

            // Update the contact information of the customer with the given name
            String sql = "Select * from gadgetdb";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                // Retrieve by column name
                String id = rs.getString("id");
                String customername = rs.getString("customername");
                String gadgetname = rs.getString("gadgetname");
                String discount = rs.getString("discount");
                // Display values
                out.println("<p> ID: " + id + "<br>");
                out.println("customername: " + customername + "<br>");
                out.println("gadgetname: " + gadgetname + "<br>");
                out.println("discount: " + discount + " %<br></p>");
            }
            out.println("</body></html>");
            rs.close();
            // Clean-up environment
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.print("Error connecting to DB - Error:" + e);
        }
    }
}