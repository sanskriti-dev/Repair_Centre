package d1;
import javax.servlet.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class CustomerDataServlet1 extends HttpServlet
{
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        String Name=req.getParameter("CustomerName");
        String Email=req.getParameter("Email");
        String Mobileno=req.getParameter("Mobile");
        String gender=req.getParameter("Gender");
        PrintWriter pw=res.getWriter();
        try
        {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3309/d1","root","123456");
            String sql="INSERT INTO customer (CustomerName,Email,Mobile,Gender) values (?,?,?,?)";
            PreparedStatement ps=cn.prepareStatement(sql);
            ps.setString(1, Name);
            ps.setString(2, Email);
            ps.setString(3, Mobileno);
            ps.setString(4, gender);
            ps.executeUpdate();
            res.sendRedirect("index.html");
            cn.close();
        }
        catch(Exception ex)
        {
            pw.println("Error : "+ex.getMessage());
        }
        
        
    }
    
}