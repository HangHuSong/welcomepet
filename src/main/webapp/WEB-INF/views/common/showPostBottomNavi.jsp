<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="fixed-bottom border-top" style="background-color:white;">
<div class="row pt-0 pb-2 px-2">
 <div class="col mt-2">	 
	<div class="row">
		<div class="col pe-0">
		 <textarea id="inputCommentText" class="form-control-plaintext" style="height: 2.5em" name="show_dog_comment_content" placeholder="댓글 작성하기"></textarea>
		</div>
		
		<div class="col-2 d-grid">
		 <button onclick="registerComment()" class="btn" style="color:white; background-color:#fd7e14">
		  <i class="bi bi-arrow-return-left" style="stroke-width:2;"></i>
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
												<a href="../customer/login"><i
													class="btn bi bi-arrow-up-circle-fill"
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