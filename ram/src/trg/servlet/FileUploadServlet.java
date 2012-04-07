package trg.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*;
import java.util.Iterator;
import java.util.List;
import java.sql.*;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		        response.setContentType("text/html;charset=UTF-8");
		        PrintWriter out = response.getWriter();
		       
		        out.println("<html>");
		        out.println("<head>");
		        out.println("<title>Servlet FileUploadServlet</title>");
		        out.println("</head>");
		        out.println("<body>");
		        out.println("<h1>Servlet FileUploadServlet at " + request.getContextPath () + "</h1>");
		        out.println("</body>");
		        out.println("</html>");
		       
		        out.close();
		    }
		    
    public FileUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	       
	        
	        try {
	            // Check that we have a file upload request
	            @SuppressWarnings("unused")
				boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	            
	            // Create a factory for disk-based file items
	            FileItemFactory factory = new DiskFileItemFactory();
	            
	            // Create a new file upload handler
	            ServletFileUpload upload = new ServletFileUpload(factory);
	            
	            // Parse the request, items is   FileItem
	            @SuppressWarnings("rawtypes")
				List  items = upload.parseRequest(request);
	            
	            @SuppressWarnings("rawtypes")
				Iterator iter = items.iterator();
	            while (iter.hasNext()) {                
	                FileItem item =(FileItem) iter.next();
	                
	                //if (item.isFormField()) {
	                  //  out.println( "its a field" );
	                //} else 
	                //{
	                    out.println( "its a file" );
	                    out.println(item.getName());
	                    File cfile = new File(item.getName());
	                    File tosave =new File("c:\\images", cfile.getName());                    
	                    item.write(tosave);
	                    out.println("File upload successfully...");
	                    String s=tosave.toString();
	                    Connection con;
	                    Statement psm;
	                    Class.forName("com.ibm.db2.jcc.DB2Driver");
	                    con = DriverManager.getConnection("jdbc:db2://localhost:50000/GEO","db2admin","tgmc");

                        
                        //random id generate
                        StringBuffer sb = new StringBuffer();  
                        for (int x = 0; x <8; x++)  
                        {  
                          sb.append((char)((int)(Math.random()*26)+97));  
                        }  
                        String imgid=sb.toString(); 
                        //sesssion part
                        HttpSession ses=request.getSession();
                     //   String userid=(String)ses.getAttribute("userid");
                       ses.setAttribute("imgid",imgid);
	                   
	                    psm=con.createStatement();
	                    int sr=psm.executeUpdate("insert into db2admin.image(image,imgid) values('"+s+"','"+imgid+"')");
	         
	            if(sr==1)
	            {
	            	
	            	
	            	
	            	response.sendRedirect("uploadphoto2.jsp");
	            	
	            }
	            
	            
	            
	            
	            
	            
	            
	            }
	        } catch(Exception e) {
	            out.println("Ex.  " + e);
	        } finally {
	            out.close();
	        }
	    
	}



public String getServletInfo() {
    return "Short description";
}
}