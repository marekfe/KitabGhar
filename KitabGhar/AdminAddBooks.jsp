<%-- 
    Document   : AdminAddBooks
    Created on : 5 Jul, 2016, 9:17:17 AM
    Author     : Jalaz
--%>

<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KitabGhar | Admin</title>
        <link rel="shortcut icon" type="image/x-icon" href="ProjectImages/favicon.ico" />
    </head>
    <body>
        <%@include file="connectionFile.jsp" %>
        
        <%
            String bookid="", name="", author="", publication="", category="", subcategory="";
            int queryid,price;
            String SuccessMessage="", ErrorMessage="";
            String coverpic="",downloadlink="";
            try{
            if(request.getParameter("btnSubmit")!=null)
            {
                bookid = request.getParameter("tbBookId");
                name = request.getParameter("tbName");
                author = request.getParameter("tbAuthor");
                publication = request.getParameter("tbPublication");
                category = request.getParameter("tbCategory");
                subcategory = request.getParameter("tbSubCategory");
                price = Integer.parseInt(request.getParameter("tbPrice"));
                coverpic = request.getParameter("tbCoverPic");
                downloadlink = request.getParameter("tbDownloadLink");
                
                Random r = new Random();
                queryid = (100000+r.nextInt(99999));
                
                if(coverpic.length()==0)
                {
                    coverpic="default.jpg";
                }
                if(downloadlink.length()==0)
                {
                    downloadlink="Sorry.jsp";
                }
                
                String qry = "insert into books values('"+bookid+"','"+name+"','"+author+"','"+publication+"','"+category+"','"+subcategory+"',"+queryid+","+price+",'"+coverpic+"','"+downloadlink+"')";               
                
                
                int result = smt.executeUpdate(qry);
                
                if(result>0)
                {
                    SuccessMessage = "Successfully Added to BookStore";
                }
                else
                    ErrorMessage = "Problem adding to the Store, Kindly Check if BookId Already Exists";
                }
            
            }catch(SQLIntegrityConstraintViolationException ex1)
            {   ErrorMessage="BookId already exists, kindly choose new one";    }
            catch(SQLException ex2)
            {   ErrorMessage=ex2+"";    }
            con.close();
            %>


    <%@include file="AdminHandle.jsp" %>

    <h2>Add New Books Portal</h2>
    <br>
    <form method="post" style="margin-left: 40%; margin-right: 40%; margin-top:2%">
        <fieldset>
            <div class="form-group">
                <label class="label label-info" for="bookId">Book Id</label>
                <input type="digit" name="tbBookId" class="form-control" id="bookId">
            </div>
            <div class="form-group">
                <label class="label label-info" for="name">Name</label>
                <div class="input-group">
                    <input type="digit" name="tbName" class="form-control" id="name">
                </div>
            </div>
            <div class="form-group">
                <label class="label label-info" for="author">Author Name</label>
                <div class="input-group">
                    <input type="digit" name="tbAuthor" class="form-control" id="author">
                </div>
            </div>
            <div class="form-group">
                <label class="label label-info" for="publication">Name of Publication</label>
                <div class="input-group">
                    <input type="digit" name="tbPublication" class="form-control" id="publication">
                </div>
            </div>
            <div class="form-group">
                <label class="label label-info" for="price">Price (in terms of tokens)</label>
                <div class="input-group">
                    <input type="digit" name="tbPrice" class="form-control" id="price">
                </div>
            </div>
            <div class="form-group">
                <label class="label label-info" for="cat">Category</label>
                <div class="input-group">
                    <select name="tbCategory" class="custom-select" id="cat">
                        <option value="None">----Select----</option>
                        <option value="Academic">Academic</option>
                        <option value="Novel">Novels</option>
                        <option value="Programming">Programming</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="label label-info" for="subcat">Sub-Category</label>
                <div class="input-group">
                    <select name="tbSubCategory" class="custom-select" id="subcat">
                        <option value="None">----Select----</option>
                        <option value="CG">ACADEMIC: Computer Graphics</option>
                        <option value="OS">ACADEMIC: Operating System</option>
                        <option value="DBMS">ACADEMIC: Operating System</option>
                        <option value="TOC">ACADEMIC: TOC and Compiler</option>
                        <option value="DSAlgo">ACADEMIC: Data Structures and Algorithms</option>
                        <option value="NonCSE">ACADEMIC: Non-CSE Branches</option>
                        <option value="Crypto">ACADEMIC: Information Security and Cryptography</option>
                        <option value="ML">ACADEMIC: Machine Learning and Soft Computing</option>
                        <option value="SE">ACADEMIC: Software Engineering</option>
                        <option value="Sim">ACADEMIC: Simulation</option>
                        <option value="CO">ACADEMIC: Computer Architecture</option>
                        <option value="CN">ACADEMIC: Computer Networks</option>
                        <option value="Maths">ACADEMIC: Engineering Maths</option>
                        <option value="DS">ACADEMIC: Discrete Structures</option>
                        <option value="InNew">NOVEL: Indian Young Writers</option>
                        <option value="InOld">NOVEL: Indian Old Writers</option>
                        <option value="Foreign">NOVEL: Foreign Writers</option>
                        <option value="CPP">PROGRAMMING: C and C++</option>
                        <option value="PHP">PROGRAMMING: PHP</option>
                        <option value="Java">PROGRAMMING: Java and J2EE</option>
                        <option value="UI">PROGRAMMING: Frontend Technologies</option>
                        <option value="Python">PROGRAMMING: Python</option>
                        <option value="JS">PROGRAMMING: JavaScript</option>
                        <option value="Ruby">PROGRAMMING: Ruby</option>
                        <option value="Linux">PROGRAMMING: Linux</option>
                        <option value="Android">PROGRAMMING: Android</option>
                    </select>
                </div>
            </div>
            <br>
            <hr>
            <br>
            <div class="form-group">
                <label class="label label-info" for="photo">Give Photo Link</label>
                <div class="input-group">
                    <input type="digit" name="tbCoverPic" class="form-control" id="photo">
                </div>
            </div>
            <div class="form-group">
                <label class="label label-info" for="download">Give Download Link</label>
                <div class="input-group">
                    <input type="digit" name="tbDownloadLink" class="form-control" id="download">
                </div>
            </div>
            <br>
            <hr>
            <br>
            <div class="col-md-4 text-center">
                <button type="submit" name="btnSubmit" class="btn btn-success">Add now</button>
            </div>
        </fieldset>
    </form>
    <br>
    <hr>
    <b>
        <h4 style="color:green">
            <%= SuccessMessage %>
        </h4>
    </b>
    <b>
        <h4 style="color:red">
            <%= ErrorMessage %>
        </h4>
    </b>
</body>

</html>