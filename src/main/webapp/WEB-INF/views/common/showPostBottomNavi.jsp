<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
<div class="fixed-bottom border-top" style="background-color:white;">
<div class="row">
 <div class="col">
  <div class="row">
  	<div class="col-8">
  	 <textarea id="inputCommentText" class="form-control-plaintext" name="show_dog_comment_content" 
		 	   placeholder="댓글을 작성하세요" style="height:2.5em; font-size:1em"></textarea>
  	</div>
  	
  	<div class="col-1">
  	 <i class="bi bi-emoji-smile"></i>
  	</div>
  	
  	<div class="col-1">
  	 <i class="bi bi-camera"></i>
  	</div>
  	
  	<div>
  	 <button onclick="registerComment()" class="btn" style="color:white; background-color:#fd7e14; height:2em; width:2em">
		  <i class="bi bi-arrow-up"></i>
	</button>
  	</div>
  
  </div>
 </div>
</div>
</div>    --%>
    
     
<div class="fixed-bottom border-top" style="background-color:white;">
<div class="row px-0" style="height:48px;">
 <div class="col mt-1">	 
	<div class="row pe-1 justify-content-center align-items-center">
		<div class="col-8 ps-2 pe-0">
		 <textarea id="inputCommentText" class="form-control-plaintext" name="show_dog_comment_content" 
		 		   placeholder="댓글을 작성하세요" style="height:2.5em; font-size:1em"></textarea>
		</div>
		
		<div class="col-1 px-0 d-flex justify-content-center text-secondary">
		 <i class="bi bi-emoji-smile d-flex align-items-center" style="font-size:1.3em"></i>
		</div>
		
		<div class="col-1 px-0 d-flex justify-content-center text-secondary">
		 <i class="bi bi-camera d-flex align-items-center" style="font-size:1.5em"></i>
		</div>
		
		<div class="col-auto px-0 text-end">
		 <button onclick="registerComment()" class="btn btn-lg p-1" style="color:white; background-color:#fd7e14;height:2em;width:2em">
		  <i class="bi bi-arrow-up" style="stroke-width:2;"></i>
		 </button>
		</div>
	</div>
 </div>
</div>
</div>


<%-- <div class="row fixed-bottom bg-white">
						<div class="col-12 border-top">
							<form action="./insertComment" method="post">
								<div class="row">
									<div class="col-10 ps-4 pt-1">
										<textarea class="form-control-plaintext"
											name="board_comment_content" placeholder="댓글을 남겨보세요"
											style="height: 40px;"></textarea>
										<input type="hidden" name="board_no"
											value="${data.boardDto.board_no}">
									</div>
									
									<div class="col-2">
										<c:choose>
											<c:when test="${empty customerUser}">
												<a href="../customer/login"><i class="btn bi bi-arrow-up-circle-fill"
													style="font-size: 1.6em;"></i></a>
											</c:when>
											<c:otherwise>
												<button class="btn bi bi-arrow-up-circle-fill" type="submit"
													style="font-size: 1.6em;"></button>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</form>
						</div>
					</div> --%>