
package d1;


import javax.servlet.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ReceiveDataServlet1 extends HttpServlet
{
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        String CustomerName=req.getParameter("Mobile");
        String MobileMake=req.getParameter("MobileMake");
        String MobileModel=req.getParameter("MobileModel");
        String ProblemStatement=req.getParameter("ProblemStatement");
        String Submission=req.getParameter("SubmissionDateTime");
        Float Charges=Float.parseFloat(req.getParameter("Charges"));
        PrintWriter pw=res.getWriter();
        try
        {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3309/d1","root","123456");
            String sql="INSERT INTO service (CustomerID,MobileMake,MobileModel,ProblemStatement,SubmissionDateTime,Charges,ReceivingDate) values (( SELECT CustomerID FROM customer WHERE Mobile= ?),?,?,?,?,?,NULL)";
            PreparedStatement ps=cn.prepareStatement(sql);
            ps.setString(1,CustomerName);
            ps.setString(2, MobileMake);
            ps.setString(3, MobileModel);
            ps.setString(4,ProblemStatement );
            ps.setString(5,Submission );
            ps.setFloat(6,Charges);
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