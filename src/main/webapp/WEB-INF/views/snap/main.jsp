<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
<title>Snap</title>
<style type="text/css">
	body {
    	font-family: 'Montserrat', sans-serif;
	}
	a {
    text-decoration: none;
    color: inherit;        
	}

	a:hover {
	    color: inherit;       
	}
	
	#thumbnail{
		object-fit: cover; 
		width: 387px; 
		height: 375px;
	}

	.like-button {
		position: absolute;
		bottom: 10px;
		right: 10px;
	}
	.fixed-size-image {
        width: auto;
        height: 300px;
        object-fit: cover;
    }
    #snapModalTop{
    	width: auto;
    	height: 50px;
    	
    }
    #profileImg {
    	width : 40px;
    	height : 40px;
        border-radius: 50%;
        object-fit: cover;
    }
    #followBtn{
        color: white;
        background-color: orange;
    }
</style>
<script type="text/javascript">

    let mySessionId = null;

    function getSessionId() {
        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                const response = JSON.parse(xhr.responseText);
                // js 작업 공간 TO-DO
                if (response.result == "success") {
                    mySessionId = response.customer_no;
                }
            }
        }
        // get
        xhr.open("get", "./getMyId", false);
        xhr.send();
    }

    /* function getSnapList() {
        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                const response = JSON.parse(xhr.responseText);
                let snapListBox = document.getElementById("snapListBox");
                snapListBox.innerHTML = "";
                let row = document.createElement("div");
                row.classList.add("row", "mt-2", "my-4", "justify-content-center");

                for (let i = 0; i < response.list.length; i++) {
                    let data = response.list[i];
                    const col = document.createElement("div");
                    col.classList.add("col-6", "col-md-6", "my-1");

                    const card = document.createElement("div");
                    card.classList.add("card");

                    const imageWrapper = document.createElement("div");
                    imageWrapper.classList.add("image-wrapper");

                    const link = document.createElement("a");
                    link.href = "javascript:void(0);";
                    link.onclick = function () { readSnap(data.snapBoardDto.snap_board_no); };

                    const img = document.createElement("img");
                    img.src = "/uploadFiles/thumbnail/" + data.snapBoardDto.snap_thumbnail;
                    img.classList.add("card-img-top");
                    img.id = "thumbnailImg";
                    link.appendChild(img);
                    imageWrapper.appendChild(link);
                    card.appendChild(imageWrapper);

                    const likeButton = document.createElement("div");
                    likeButton.classList.add("like-button");

                    const likeIcon = document.createElement("i");
                    likeIcon.id = "heart-" + data.snapBoardDto.snap_board_no;
                    likeIcon.style.fontSize = "20px";
                    likeIcon.style.color = "#ff2465";
                    likeIcon.dataset.snapBoardNo = data.snapBoardDto.snap_board_no;

                    if (data.checkLike == 0) {
                        likeIcon.classList.add("bi", "bi-heart-fill");
                        likeIcon.style.color = "#ffffff";
                        likeIcon.style.background = "#transparent";
                        likeIcon.onclick = like.bind(null, data.snapBoardDto.snap_board_no);
                    } else {
                        likeIcon.classList.add("bi", "bi-heart-fill");
                        likeIcon.style.color = "#ff2465";
                        likeIcon.style.background = "transparent";
                        likeIcon.onclick = unLike.bind(null, data.snapBoardDto.snap_board_no);
                    }
                    likeButton.appendChild(likeIcon);
                    imageWrapper.appendChild(likeButton);

                    const cardBody = document.createElement("div");
                    cardBody.classList.add("card-body");

                    const dogProfile = document.createElement("span");
                    const dogProfileLink = document.createElement("a");
                    dogProfileLink.href = "./dogProfile?dog_no=" + data.dogDto.dog_no;
                    dogProfileLink.innerText = data.dogDto.dog_name;
                    dogProfile.appendChild(dogProfileLink);
                    
                    

                    cardBody.appendChild(dogProfile);
                    card.appendChild(cardBody);
                    col.appendChild(card);

                    row.appendChild(col);

                    if (i % 2 !== 0 || i === response.list.length - 1) {
                        snapListBox.appendChild(row);
                        row = document.createElement("div");
                        row.classList.add("row", "mt-2", "justify-content-center");
                    }
                }
            }
        }
        xhr.open("get", "./getSnapList");
        xhr.send();
    } */

    function like(snap_board_no) {
        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                const response = JSON.parse(xhr.responseText);
                if (response.status == "success") {
                    const heartIcon = document.getElementById("heart-" + snap_board_no);
                    heartIcon.classList.remove("bi-suit-heart");
                    heartIcon.classList.add("bi-suit-heart-fill");
                    heartIcon.onclick = function () { unLike(snap_board_no); };
					
                    
                }
            }
        }
        xhr.open("post", "./restSnapLike");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("snap_board_no=" + snap_board_no);
    }

    function unLike(snap_board_no) {
        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                const response = JSON.parse(xhr.responseText);
                if (response.status == "success") {
                    let heartIcon = document.getElementById("heart-" + snap_board_no);
                    heartIcon.classList.remove("bi-suit-heart-fill");
                    heartIcon.classList.add("bi-suit-heart");
                    heartIcon.onclick = function () { like(snap_board_no); };
                    
                }
            }
        }
        xhr.open("post", "./restSnapUnLike");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("snap_board_no=" + snap_board_no);
    }

    function readSnap(snap_board_no) {
        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                const response = JSON.parse(xhr.responseText);
                // img carousel start
                const imgBox = document.getElementById("imgBox");
                imgBox.innerHTML = "";
                const activeBox = document.createElement("div")
                activeBox.classList.add("carousel-item");
                activeBox.classList.add("active");

                const thumbnail = document.createElement("img");
                thumbnail.src = "/uploadFiles/thumbnail/" + response.snapDetail.snap_thumbnail;
                thumbnail.classList.add("d-block");
                thumbnail.classList.add("w-100");
                thumbnail.classList.add("fixed-size-image");
                thumbnail.classList.add("rounded");
                activeBox.appendChild(thumbnail);

                for (imgs of response.snapImgs) {
                    const detailBox = document.createElement("div");
                    detailBox.classList.add("carousel-item")
                    const detailImg = document.createElement("img");
                    detailImg.src = "/uploadFiles/snapImgs/" + imgs.snapImagesDto.snap_image_link;
                    detailImg.classList.add("d-block");
                    detailImg.classList.add("w-100");
                    detailImg.classList.add("fixed-size-image");
                    detailImg.classList.add("rounded");
                    detailBox.appendChild(detailImg);
                    imgBox.appendChild(detailBox);
                }
                imgBox.appendChild(activeBox);
                // img carousel end //

                // Like and viewCount
                const snapDetailContent = document.getElementById("snapDetailContent");
				snapDetailContent.innerHTML = "";
				const row1 = document.createElement("div");
				row1.classList.add("row");
				row1.classList.add("mt-2");
				const col1 = document.createElement("div");
				col1.classList.add("col-3");
				const spanIcon = document.createElement("span");
				const spanNum = document.createElement("span");
				
				spanNum.innerText = " " + response.countLike + " ";
				
				const i = document.createElement("i");
				i.id = "heart-" + response.snapDetail.snap_board_no;
				if (response.checkLike == 0) {
				    i.classList.add("bi");
				    i.classList.add("bi-heart");
				    i.style.color = "#ff2465";
				    i.dataset.snapBoardNo = response.snapDetail.snap_board_no;
				    i.onclick = like.bind(null, response.snapDetail.snap_board_no);
				} else {
				    i.classList.add("bi");
				    i.classList.add("bi-heart-fill");
				    i.style.color = "#ff2465";
				    i.dataset.snapBoardNo = response.snapDetail.snap_board_no;
				    i.onclick = unLike.bind(null, response.snapDetail.snap_board_no);
				}
				spanIcon.appendChild(i);
				col1.appendChild(spanIcon);
				col1.appendChild(spanNum);
                
                const br = document.createElement("br");
                col1.appendChild(br);

                const col2 = document.createElement("div")
                col2.classList.add("col", "d-grid","text-end");
                
                const locIcon = document.createElement("i");
                locIcon.classList.add("bi","bi-geo-alt-fill");
                const locString = document.createElement("span");
                locString.innerText = response.snapDetail.snap_location;
                col2.appendChild(locIcon);
                col2.appendChild(locString);
                
                const span2Icon = document.createElement("span");
                const span2Num = document.createElement("span");

                span2Num.innerText = " " + response.snapDetail.snap_board_view_count;

                const readIcon = document.createElement("i");
                readIcon.classList.add("bi" ,"bi-eye");

                span2Icon.appendChild(readIcon);
                col1.appendChild(span2Icon);
                col1.appendChild(span2Num);

                row1.appendChild(col1);
                row1.appendChild(col2);

                const row2 = document.createElement("div");
                row2.classList.add("row");
                row2.classList.add("mt-3");
                row2.classList.add("mb-3");

                const col3 = document.createElement("div");
                col3.classList.add("col");
                col3.innerText = response.snapDetail.snap_board_content;

                snapDetailContent.appendChild(row1);

                row2.appendChild(col3);
                snapDetailContent.appendChild(row2);
                
                
                
				// insert comment
                const commentFormRow = document.createElement("div");
	            commentFormRow.classList.add("row", "mt-3","mb-2");
	            const commentFormCol = document.createElement("div");
	            commentFormCol.classList.add("col");
	            const commentForm = document.createElement("div");
	            commentForm.classList.add("row");
	            const commentContentBoxCol = document.createElement("div");
	            commentContentBoxCol.classList.add("col-9", "comment-textbox");
	            const commentContentBox = document.createElement("input");
	            commentContentBox.id = "commentContentBox";
	            commentContentBox.type = "text";
	            commentContentBox.classList.add("form-control");
	            commentContentBox.placeholder = "댓글을 입력하세요";
	            commentContentBoxCol.appendChild(commentContentBox);
	            const commentSubmitBtnCol = document.createElement("div");
	            commentSubmitBtnCol.classList.add("col", "d-grid");
	            const commentSubmitBtn = document.createElement("button");
	            commentSubmitBtn.onclick = function() { registerComment(response.snapDetail.snap_board_no); };
	            commentSubmitBtn.classList.add("bi", "bi-box-arrow-in-up-left", "btn");
	            commentSubmitBtn.style.backgroundColor = "orange";
	            commentSubmitBtnCol.appendChild(commentSubmitBtn);
	            commentForm.appendChild(commentContentBoxCol);
	            commentForm.appendChild(commentSubmitBtnCol);
	            commentFormCol.appendChild(commentForm);
	            commentFormRow.appendChild(commentFormCol);
	            snapDetailContent.appendChild(commentFormRow);
				
                for (comment of response.commentList) {
                    const row4 = document.createElement("div");
                    row4.classList.add("row");
                    row4.classList.add("border-top");
                    row4.classList.add("mb-2");

                    const col5 = document.createElement("div");
                    col5.classList.add("col", "text-primary", "fw-bold", "fs-5");

                    const span3 = document.createElement("span");
                    span3.style.fontSize = "12px";
                    span3.innerText = comment.customerDto.customer_nickname;

                    col5.appendChild(span3);
                    row4.appendChild(col5);
                    snapDetailContent.appendChild(row4);

                    const col6 = document.createElement("div");
                    col6.classList.add("col");
                    col6.classList.add("text-end");

                    const span4 = document.createElement("span");
                    span4.style.fontSize = "12px";
                    span4.style.color = "gray";
                    const formatDate = new Date(comment.snapBoardCommentDto.snap_board_comment_reg_date);
                    const options = { year: '2-digit', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit' };
                    const formattedDate = formatDate.toLocaleString('ko-KR', options);
                    span4.innerText = formattedDate;

                    col6.appendChild(span4);
                    row4.appendChild(col6);
                    snapDetailContent.appendChild(row4);

                    const row5 = document.createElement("div");
                    row5.classList.add("row","mb-2");

                    const col7 = document.createElement("div");
                    col7.classList.add("col");

                    const span5 = document.createElement("span");
                    span5.style.fontSize = "15px";
                    span5.innerText = comment.snapBoardCommentDto.snap_board_comment_content;

                    col7.appendChild(span5);
                    row5.appendChild(col7);
                    snapDetailContent.appendChild(row5);
                }
            }


            // Open modal
            const modal = bootstrap.Modal.getOrCreateInstance('#snapDetailModal');
            /*	            
                            const modal = new bootstrap.Modal(document.getElementById('snapDetailModal'), {
                                backdrop: 'static',
                                keyboard: false
                            });
            */
            modal.show();
        }
        xhr.open("get", "./getSnapDetail?snap_board_no=" + snap_board_no);
        xhr.send();
    }

    function registerComment(snap_board_no) {
		if (!mySessionId) {
			return;
		}
		const commentContentBox = document.getElementById("commentContentBox");
		const commentTextValue = commentContentBox.value;
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				const response = JSON.parse(xhr.responseText);
				commentContentBox.value = "";
				readSnap(snap_board_no);
			}
		}
		xhr.open("post", "./registComment");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("snap_board_no=" + snap_board_no + "&snap_board_comment_content=" + commentTextValue);
	}


    window.addEventListener("DOMContentLoaded", function () {
        getSessionId();
        
    });
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="../common/topMainNavi.jsp"></jsp:include>
		
		<div class="row">
			<div class="col text-end">
				<button onclick="location.href='./postSnap'"class="btn bi bi-plus-square fs-3"></button>
            </div>
		</div>
		
		<c:forEach items="${list}" var="data">
			<div class="row mt-1 mb-1">
				<div class="col">
					<div class="row border-bottom border-top align-items-center justify-content-center" style="height: 60px;">
						<div class="col">
							<img id="profileImg" src="/uploadFiles/WelcomePet/${data.dogDto.dog_image}" >
							<span onclick="location.href = './dogProfile?dog_no=${data.dogDto.dog_no}';" style="font-size: 16px;" class="mx-1 my-1">${data.dogDto.dog_name}</span>
						</div>
						<div class="col d-flex justify-content-end">
		                    <button id="followBtn" class="btn bi bi-person-plus-fill"> 팔로우</button>
		                </div>    
					</div>
				</div>
				<div class="row p-0">
                    <div class="col-12 px-0">
       			   		<a href="javascript:void(0);" onclick="readSnap(${data.snapBoardDto.snap_board_no});">
                        	<img src="/uploadFiles/thumbnail/${data.snapBoardDto.snap_thumbnail}" id="thumbnail" >
                       	</a>
                    </div>
                </div>
				<div class="row mt-1 px-0">
                    <div class="col mx-2">
                    	<c:choose>
                    		<c:when test="${data.checkLike == 0}">
                    			<i id="heart-${data.snapBoardDto.snap_board_no}" class="bi bi-suit-heart fs-2" style="font-size: 20px; color: #ff2465;"
                                data-snapBoardNo="${data.snapBoardDto.snap_board_no}" onclick="like(${data.snapBoardDto.snap_board_no});"></i>
                    		</c:when>
                    		<c:otherwise>
                                <i id="heart-${data.snapBoardDto.snap_board_no}" class="bi bi-suit-heart-fill fs-2" style="font-size: 20px; color: #ff2465;"
                                   data-snapBoardNo="${data.snapBoardDto.snap_board_no}" onclick="unLike(${data.snapBoardDto.snap_board_no});"></i>
                            </c:otherwise>
                    	</c:choose>
                        <i class="bi bi-chat mx-2 fs-2"></i>
                        <i class="bi bi-send fs-2"></i>
                    </div>
                    <div class="col px-0 p-0 text-end">
                        <i class="bi bi-bookmark fs-2"></i>
                    </div>
                </div>
                <div class="row my-1">
                    <div class="col">
                        <span style="font-size: 14px;">좋아요 ${data.countLike}개</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <i class="bi bi-geo-alt-fill fs-5"></i><span style="font-size: 13px;"class="mx-1">${data.snapBoardDto.snap_location}</span>
                    </div>
                </div>
			</div>
		</c:forEach>
		
		
	</div>
		<jsp:include page="../common/bottomNavi.jsp"></jsp:include>
		
	
	
<!-- Modal -->
<div class="modal fade" id="snapDetailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            	<img id="snapModalTop" src="/welcomepet/resources/img/logo.png">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Snap detail content -->
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
                                <div id="imgBox" class="carousel-inner">
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- snapBoardDto / customerDto -->
                    <div class="row mt-1">
                        <div class="col" id="snapDetailContent"></div>
                    </div>
                </div>
                <!-- End of snap detail content -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</body>
</html>