<%@page import="member.model.service.MemberService"%>
<%@page import="market.model.vo.ProductComment"%>
<%@page import="market.model.vo.pAttach"%>
<%@page import="java.util.List"%>
<%@page import="member.model.vo.Member"%>
<%@page import="market.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Product product = (Product)request.getAttribute("product");
	Member member = (Member)request.getAttribute("member");
	List<pAttach> attachList = (List<pAttach>)request.getAttribute("attachList");
	List<ProductComment> commentList = (List<ProductComment>)request.getAttribute("commentList");
	
	//임시로 생성한 loginMember. 나중에 헤더의 loginMember로 쓸거임.
	Member loginMember = new Member();
	loginMember.setMemberId("oneman");
	loginMember.setNickId("임시닉네임");

	 boolean editable = 
				loginMember != null &&
				(
					loginMember.getMemberId().equals(member.getMemberId())
					|| MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())
					
				); 
	//boolean editable = "oneman".equals(member.getMemberId());//oneman이 로그인했다고 가정.
%>
 <!-- section시작 -->
    <section>
        <div class="post-container">
            <div class="market-img-container">
                <div class="photo-left-btn"></div>
                <div class="photo-rigth-btn"></div>
                <!-- <div class="market-img" style="width:150px; height:150px;"></div> -->
                <% if(attachList==null){ %>
                <div class="market-img" style="width:150px; height:150px;">첨부된 사진이 없습니다</div>
                <% }else{ %>
	                <% for(pAttach attach : attachList){ %>
		                <div class="market-img" style="width:150px; height:150px;">
		                <img src="<%=request.getContextPath() %>/upload/market/<%=attach.getRenamedFileName() %>"
		                		width="150px"  height="150px">
		                	
		                </div>
	       	        <% } %>
                <% } %>
            </div>
            <div class="seller-title">
                <div class="seller-icon">

                </div>
                <div class="seller-profile">
                    <div class="seller-profile-info">
                        <h3><%=member.getNickId() %></h3>
                        <!-- <h3> 글쓴이 닉네임</h3> -->
                    </div>
                    <div class="seller-good-info">
                        <h3>좋아요 : <%=member.getGoodScore() %></h3>
                        <!-- <h3>좋아요 : 숫자</h3> -->
                    </div>
                </div>
            </div>
            <div class="commet-container">
                <h1><%=product.getTitle() %></h1>
                <br>
                <span><%=product.getArea() %></span>
                <h3><%=product.getPrice() %>원</h3>
                <span><%=product.getDescription() %></span>
            </div>
            <!-- 수정권한 있는 사람만 보이게 -->
            <%if(editable){ %>
            <div class="market-up-del-container">
                <input type="button" value="수정" onclick="updateProduct()">
                <input type="button" value="삭제" onclick="deleteProduct()">
            </div>
            <%} %>
            
            <div class="comment-reader">
                <h3 style="margin: 10px 35px;">댓글란</h3>
                <%if(commentList!=null && !commentList.isEmpty()) {%>
                
               	 <%for(ProductComment pc : commentList) {
               		boolean removable = loginMember != null && (loginMember.getMemberId().equals(pc.getWriter())
        					|| "A".equals(loginMember.getMemberRole()));
               	 %>
               	                	 
                <div class="reader-inbox">
                    <div class="comment-reader-icon"></div>
                    <h4><%=pc.getWriter() %></h4>
                    <p><%=pc.getContent() %></p>
                    <p><%=pc.getRegDate() %></p>
                      <%if(removable) {%>
                   <input type="button" value="삭제" class="comment-delete"> 
                   <input type="hidden" value="<%=pc.getNo() %>" class="comment-no">
                   <%} %>
                 
                </div>
               	 <%} %>
                <%} %>
          
            </div>
            <div class="comment-writer">
                   <form action="<%= request.getContextPath() %>/market/marketCommentInsert" method="post" name="marketCommentFrm">
                <div class="comment_inbox">
                    <h3 class="comment_inbox_name"><%=loginMember.getMemberId() %></h3>
                    <input type="hidden" name="boardNo" value="<%=product.getNo()%>" />
               		<input type="hidden" name="writer" value="<%=loginMember!=null? loginMember.getMemberId():"" %>" />
                    <textarea placeholder="댓글을 남겨보세요" rows="1" class="comment_inbox_text" name="content"></textarea>
                </div>
                <div class="register_box">
                    <input class="register_btn" type="submit" name="" id="" value="등록">
                </div>
                </form>
            </div>
        </div>
        </div>
        </div>
    </section>
    <!-- section끝 -->
    
<%if(editable){ %>
	<form 
		action="<%=request.getContextPath()%>/market/marketDelete" 
		method="post"
		name="productDelFrm">
		<input type="hidden" name="no" value="<%=product.getNo()%>"/>
	</form>
	<script>
	function updateProduct(){
		location.href = "<%= request.getContextPath( )%>/market/marketUpdate?no=<%= product.getNo() %>";
	}
	
	function deleteProduct(){
		if(confirm("게시글을 정말 삭제하시겠습니까?")){
			$(document.productDelFrm).submit();
		}
	}
	</script>
<%} %>
<form action="<%=request.getContextPath() %>/market/marketCommentDelete" name="marketCommentDelFrm" method="post">
	<input type="hidden" name="no"/>
	<input type="hidden" name="boardNo" value="<%= product.getNo() %>"/>
</form>
  <script>
  $(".comment-delete").click(function(){
	  if(confirm("해당 댓글을 삭제하시겠습니까?")){
		  var $frm = $(document.marketCommentDelFrm);
		  var marketCommentNo = $(".comment-no").val();
		  $frm.find("[name=no]").val(marketCommentNo);
		  $frm.submit();
	  }
	  
  });
//유효성 검사
//$(document.boardCommentFrm).submit(function(){
	//이벤트 버블링을 위해 전체 문서로 변화
	$(document).on('submit', '[name=boardCommentfrm]', function(e){
	<%if(loginMember == null){ %>
		loginAlert();
		return false;
	<% }%>
	//댓글 내용
	var $content = $("[name=content]", e.target);
	if(/^(.|\n)+$/.test($content.val() == false)){
		alert("댓글 내용을 작성하세요.");
		$content.focus();
		return false;
	}
});
function loginAlert(){
	alert("로그인 이후 이용하실 수 있습니다.");
	$("#memberId").focus();
}
  </script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>