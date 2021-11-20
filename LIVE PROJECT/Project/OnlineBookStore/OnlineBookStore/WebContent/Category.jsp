<%@page import="java.util.HashSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Online Book Store</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
    HashSet<String> hs=new HashSet<String>();
    ArrayList li=new ArrayList();
    Statement odd=com.onlinebookstore.db.DB.getConnect().createStatement();
    ResultSet rod=odd.executeQuery("select * from OrderHistory where confirmtime='Not Ready'");
    while(rod.next())
    {
       li.add(rod.getString(1)); 
    }
%>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
        <a class="navbar-brand" href="HomePage.jsp">Online Book Store</a>
    </div>
                    <%
                    String x=request.getQueryString();
                    String sst=null;
                    if(x==null)
                    {
                        x="";
                    }
                    x=x.replace("%20", " ");
                    if(x.equals("Action_and_Adventure"))
                    {
                        sst="Science_Fiction";
                    }
                    else if(x.equals("Science_Fiction"))
                    {
                       sst="Action_and_Adventure"; 
                    }
                    System.out.println("sst:"+sst);
                    System.out.println("x:"+x);
                    String customer_id=(String)session.getAttribute("customer_id");
                    Statement mt=com.onlinebookstore.db.DB.getConnect().createStatement();
                    ResultSet r=mt.executeQuery("select * from OrderDetails where cus_id='"+customer_id+"' and item_status='Que'");
                    ArrayList al=new ArrayList();
                    ArrayList al1=new ArrayList();
                    while(r.next())
                    {
                        al.add(r.getString(1));
                    }
                    Statement st=com.onlinebookstore.db.DB.getConnect().createStatement();
                    ResultSet rs=st.executeQuery("select * from categories where cat_type='"+x+"'");
                    
                    %>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
          <li class="active"><a href="HomePage.jsp">Customer Home<span class="sr-only">(current)</span></a></li>
            <li><a href="PrintReceipt.jsp">Print Receipt</a></li>
            <li><a href="OrderTrack.jsp">Order Tracking</a></li>
      </ul>
        <form class="navbar-form navbar-left" action="SearchItems.jsp">
        <div class="form-group">
          <input type="text" class="form-control" name="search" placeholder="Search Items Here">
        </div>
        <button type="submit" class="btn btn-default">Search</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
          <li><a href="ViewCart.jsp">View Cart [<%=al.size()%>]</a></li>
          <li><a href="index.jsp">Logout</a></li>
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

    
<!-- Slider Section -->
<div class="mySlider">
    <div class="container">
        
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
       <div class="panel panel-success">
      <div class="panel-heading">Order Items Here</div>
      <div class="panel-body">
                <style>
                    table#t01 tr:nth-child(even) {
                        background-color: #ffa500;
                    }
                    table#t01 tr:nth-child(odd) {
                    background-color:#ffa500;
                    }
                    table#t01 th {
                        background-color: black;
                        color: white;
                    }
                    table#t01 tr {
                        background-color: black;
                        color: white;
                    }
                    table#t01 tr td a {
                        color: white;
                    }
                </style>
                
                <div style="width: 70%;float: left">
                    <table id="t01" style="width: 100%">
                                          <tr>
                                            <th>Item Image</th>
                                            <th>Item Type</th>
                                            <th>Item Name</th>
                                            <th>Item Prize</th>
                                            <th>Item Quantity</th>
                                            <th>Place Order</th>
                                          </tr>
                                          <tr>
                                              <%
                                              while(rs.next())
                                              {
                                                hs.add(rs.getString(1)); 
                                              %>
                                            <td><img src="file/<%=rs.getString(5)%>" class="img-rounded" alt="Cinque Terre" width="100" height="100"></td>
                                            <td><%=rs.getString(1)%></td>
                                            <td><%=rs.getString(2)%></td>
                                            <td><%=rs.getString(3)%>$</td>
                                            <td><%=rs.getString(4)%></td>
                                            <td><a href="Order?<%=rs.getString(5)%>,<%=rs.getString(1)%>,<%=rs.getString(2)%>,<%=rs.getString(3)%>,1">Order Now</a></td>
                                          </tr>
                                            <%
                                            }
                                            %>
                     </table>
                </div>
                <div style="width: 5%;float: left">
                    &nbsp;&nbsp;
                </div>
                <div style="width: 25%;float: left">
                    <br><br>
                    <table id="t01"><tr>
                            <th><h1>Categories</h1></th></tr>
                                            <tr>
                 <%
                 Iterator<String> itr=hs.iterator();
                 while(itr.hasNext())
                   {
                     String xc=itr.next();
                  
                 %>
                   <td>   <a href="Category.jsp?<%=xc%>"><h3><%=xc%></h3></a> </td>
                                            </tr><tr>
                   <td>   <a href="Category.jsp?<%=sst%>"><h3><%=sst%></h3></a> </td>
                                            </tr>
                    <%  
                   }
                 %>  
                    </table>
                </div>
            
      </div>
    </div>

  </div>
</div>
</div>
<!-- End Slider Section -->
</body>
</html>

