package d1;
import javax.servlet.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class MobileDataServlet1 extends HttpServlet
{
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        String ReceivingDate=req.getParameter("ReceivingDate");
        String s=req.getParameter("Mobile");
        PrintWriter pw=res.getWriter();
        try
        {   DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3309/d1","root","123456");
            String sql="update Service set ReceivingDate = ? where CustomerId = (SELECT CustomerID FROM Customer WHERE Mobile=?)";
            PreparedStatement ps=cn.prepareStatement(sql);
            ps.setString(1,ReceivingDate);
            ps.setString(2,s);
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