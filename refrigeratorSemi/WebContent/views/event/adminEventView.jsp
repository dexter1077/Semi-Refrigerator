<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.refrigerator.event.model.vo.AdmEvent,com.refrigerator.common.model.vo.PageInfo "%>




		<!-- @Author seong 5/31 -->
	
<%

	ArrayList<AdmEvent>list = (ArrayList<AdmEvent>)request.getAttribute("list");

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
    .total_outer{
        color: black;
        width: 1200px;
        margin: auto;
    }

    .select-list>a{
        text-decoration: none;
        color: black;
    }
    .search-container button{
        background-color: rgb(0, 120, 51);
        color: white;
    }
    .member-btn a{
        background: rgb(0, 120, 51);
    }


    .checked-eventList>tr:hover{

    cursor: pointer;
    background-color: rgb(248, 248, 248);
    opacity: 0.7;
    }

    .thead{
        background-color: rgb(224, 224, 224);
    }

    .modal-body-list div{
        width: 100px;
        height: 30px;
        background-color: rgb(0, 120, 51);
        border-radius: 5px;
        color:white;
        text-align: center;
        margin: 10px;  
        font-size: 11px;
        line-height: 30px;
    }
</style>

</head>
<body>



	
    <div class="total_outer">
        <%@ include file="../common/admin/adminTopNavView.jsp" %>


        <div> 	
	        <%@ include file="../common/admin/adminSideBarView.jsp" %>
        </div>  
        
        
        <div class="select-list"  align="right" style="width: 450px;" >
            <a href="">???</a> >
            <a href="">????????? ??????</a> >
            <a href="">?????????</a>
        </div>
        <br>


        <br><br>

     
      
      

            <div class="btn" align="right" style="width: 300px;">

                <a class="btn btn-sm btn-success" data-toggle="modal" data-target="#event-enroll-Modal">??????</a>
                
            </div>  

            <!--????????? ?????? ????????? ??????-->
			<table border="1" align="center">

                    <thead class="thead">
                        <tr align="center" >
                            <th>??????</th> 
                            <th colspan="2" width="300">????????? ??????</th>
                            <th width="150">????????? ?????????</th>
                            <th width="150">????????? ?????????</th>
                            <th width="50">??????</th>
                            <th width="50" colspan="2">??????/??????</th>  
                        </tr>

                    </thead>
                    <tbody class="checked-eventList">
                        <%if(list.isEmpty()) { %>
                        
                            <tr>
                                <td colspan="8" style="text-align: center;">????????? ???????????? ????????????.</td>
                            </tr>
                        
                            <% } else {%>
                    
                                <% for(AdmEvent a : list) { %>
                            
                            
                                    <tr align="center" id="eventList">
                                    
                                        <td><%=a.getEventCategory() %></td>
                                        <td colspan="2"><%=a.getEventTitle()%></td>
                                        <td><%=a.getStartDate() %></td>
                                        <td><%=a.getEndDate() %></td>
                                        <td><%=a.getStatus() %></td>
                                        <input type="hidden" value=<%=a.getEventNo()%>>
                                        <td><a class="btn btn-sm btn-primary" data-toggle="modal" data-target="#event-modify-Modal" onclick="modifyEvent();">??????</a></td>
                                   		<td><a class="btn btn-sm btn-danger" data-toggle="modal" data-target="#event-delete-Modal" onclick="deleteEvent();">??????</a></td>
                                    </tr>

                                <%} %>

					        <%} %>
                     </tbody>
                    
                    				
				<!-- ????????? ???????????? -->


            </table>
            
            		
	        <script> 

                    /*???????????? ?????? ????????? ????????? ?????? ???????????? ????????????*/
                    function modifyEvent(){
                        
                        //var checked = $('input[type="checkbox"][name="testSE"]:checked');
                        // console.log($(event.target).parent().siblings("input[type=hidden]").val());
                        
                      	 var eventNo = $(event.target).parent().siblings("input[type=hidden]").val();
                        
                        $("#eventNo-id").val(eventNo);
                   	 
                    	<%for(AdmEvent adm : list){%>
                    	
                    	
                    	  	if(eventNo == <%=adm.getEventNo()%>){
                    	  		
                    		$("#upDateEventTitle").val("<%=adm.getEventTitle()%>");
                    		$("#upDateEventCategory").val("<%=adm.getEventCategory()%>");
                    		$("#status").val("<%=adm.getStatus()%>");
								
                    		var startDate = "<%=adm.getStartDate()%>";
                    	
                    		$("#UpdateStartDate").val("<%=adm.getStartDate()%>");
                    		$("#UpdateEndDate").val("<%=adm.getEndDate()%>");

                    		
                    	    }
                    	  	
                    	<%}%>
                        
                        
                    }
                    
                    /*???????????? ?????? ????????? ????????? ?????? ???????????? ????????????*/
                    function deleteEvent(){
                    
                        $("#deleteEventNo").val($(event.target).parent().siblings("input[type=hidden]").val());

                    }
              
            </script>
            
            
              <!--????????? ?????? ??????-->
                   <form action="<%=contextPath%>/updateEvent.admin" method="post" id="enroll-form" enctype="multipart/form-data">
                   
                   
                        <!-- The Modal -->
                        <div class="modal" id="event-modify-Modal" >
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content" style="background-color: rgb(224, 224, 224);" align="center">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title"><b>????????? ??????</b></h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="modal-body-list">
                                    
                                    <table>
											
                                        <tr>
                                            <td>
                                            	<input type="hidden" name="eventNo" id="eventNo-id">
                                                <div class="modal-event-title">????????? ??????
                                                </div>
                                            </td>
                                            <td>
                                                <input type="text" id="upDateEventTitle"  name="upDateEventTitle" placeholder="????????? ??????????????????">
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <div>
                                                    ??????
                                                </div>
                                            </td>
                                            <td>
                                                <select id="upDateEventCategory" name="upDateEventCategory" >
                                                    <option value="?????????">?????????</option>
                                                    <option value="?????????">?????????</option>
                                                </select>
                                            </td>
                                        </tr>
                                        
                                         <tr>
                                            <td>
                                                <div>
                                                     ????????????
                                                </div>
                                            </td>
                                            <td>
                                                <select id="status"  name="status" >
                                                    <option value="Y">Y</option>
                                                    <option value="N">N</option>
                                                </select>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td><div>????????? ?????????</div></td>
                                            <td><input type="date" id="UpdateStartDate" name="UpdateStartDate"></td>
                                        </tr>
                                        
                                        <tr>
                                            <td> <div>????????? ?????????</div></td>
                                            <td><input type="date" id="UpdateEndDate" name="UpdateEndDate"></td>
                                        </tr>

                                        <tr>
                                            <td><div>????????????</div></td>
                                            <td>
                                                <input type="file"  id="UpdateEventUpfile" name="UpdateEventUpfile">
                                            </td> 
                                        </tr>

                                    </table>


                                </div>
        
                            </div>
                    
                            <!-- Modal footer -->
                            <div class="modal-footer" align="center">
                            <button type="submit" class="btn btn-success">??????</button>
                            </div>
                                                                
                        </div>
                        </div>
                        </div>

                </form>
            
            
                   <!--????????? ?????? ??????-->
                    <form action="<%=contextPath%>/deleteEvent.admin" id="delete-form" >
                    
	                     <!-- The Modal -->
	                        <div class="modal" id="event-delete-Modal">
	                        <div class="modal-dialog modal-dialog-centered">
	                        <div class="modal-content">
	
	                            <div class="modal-header">
	                                <h4 class="modal-title"><b>????????? ??????</b></h4>
	                                <button type="button" class="close" data-dismiss="modal">&times;</button>

	                            </div>
	                    
	                            <!-- Modal body -->
	                            <input type="hidden" name="deleteEventNo" id="deleteEventNo">
	                            <div class="modal-body">
							                            ?????? ??? ????????? ??????????????????. <br>
							                            ???????????? ?????????????????????????
	                            </div>
	                    
	                            <!-- Modal footer -->
	                            <div class="modal-footer">
	                                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">??????</button>
	                                <button type="submit" class="btn btn-danger btn-sm">??????</button>
	                            </div>
	                    
	                        </div>
	                        </div>
	                        </div>
                    
					</form>
            
            
            
      
                    <!--????????? ?????? ??????-->
                	
                  	    <!-- The Modal -->
                        <div class="modal" id="event-enroll-Modal" >
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content" style="background-color: rgb(224, 224, 224);" align="center">
                    
                        
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title"><b>????????? ??????</b></h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <form action="<%=contextPath%>/insertEvent.admin" method="post" id="enroll-form" enctype="multipart/form-data">
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="modal-body-list">
                                    
                                    <table>

                                        <tr>
                                            <td>
                                                <div class="modal-event-title">????????? ??????
                                                </div>
                                            </td>
                                            <td>
                                                <input type="text" name="eventTitle" placeholder="????????? ??????????????????" required>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <div>??????</div>
                                            </td>
                                            <td>
                                                <select name="eventCategory" required >
                                                    <option value="?????????">?????????</option>
                                                    <option value="?????????">?????????</option>
                                                </select>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td><div>????????? ?????????</div></td>
                                            <td><input type="date" name="startDate" required></td>
                                        </tr>
                                        
                                        <tr>
                                            <td> <div>????????? ?????????</div></td>
                                            <td><input type="date" name="endDate" required></td>
                                        </tr>

                                        <tr>
                                            <td><div>????????????</div></td>
                                            <td>
                                                <input type="file" name="eventUpfile" required>
                                            </td> 
                                        </tr>

                                    </table>
                                

                                </div>
    
                            </div>
                        
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            <button type="submit" class="btn btn-success">??????</button>
                            </div>
                    	 <form >
                        </div>
                        </div>
                        </div>
                   



                  

                <br>
                <div class="paging-area" align="center">

                    <% if(currentPage != 1) { %>
                    <button onclick="location.href='<%=contextPath%>/selectEvent.admin?currentPage=<%=currentPage-1%>';">&lt;</button>
                    <% } %>
                    
                    <% for(int p=startPage; p<=endPage;p++) {%>
                
                        <% if(p != currentPage) {%>
                        <button onclick="location.href='<%=contextPath%>/selectEvent.admin?currentPage=<%=p%>';"><%=p%></button>
                        <%} else { %>
                        <button disabled><%= p %></button>
                        <%} %>
                    
                    <%} %>
                    
                    <%if(currentPage != maxPage) {%>
                    <button onclick="location.href='<%=contextPath%>/selectEvent.admin?currentPage=<%=currentPage+1%>';">&gt;</button>
                    <%} %>
                    
                    
                </div>
            
            
                
    </div>
            <br>



    


</body>
</html>