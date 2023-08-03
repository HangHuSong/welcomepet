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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<title>Snap</title>
<style type="text/css">
@font-face {
	font-family: 'SUITE-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2')
		format('woff2');
	font-weight: 400;
	font-style: normal;
}
body {
	font-family: 'SUITE-Regular' !important;
}

a {
	text-decoration: none;
	color: inherit;
}

a:hover {
	color: inherit;
}

#thumbnail {
	object-fit: cover;
	width: 100%;
	height: 376px;
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

#snapModalTop {
	width: auto;
	height: 30px;
}

#profileImg {
	width: 32px;
	height: 32px;
	border-radius: 50%;
	object-fit: cover;
}

#followBtn {
	color: white;
	background-color: orange;
}

.icon {
	margin-left: 5px;
}

.topNavbar {
	/* background-color: #F4AE7A; */
	background-color: white;
}

#main {
	color: inherit;
	text-decoration: none;
	font-family: 'Jua', sans-serif;
	font-weight: 700;
	font-size: 1.3em;
	color: #fd7e14;
}

#productSnap{
	width: 70px;
	height: 70px;
	object-fit: cover;
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
                    heartIcon.classList.remove("bi-heart");
                    heartIcon.classList.add("bi-heart-fill");
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
                    heartIcon.classList.remove("bi-heart-fill");
                    heartIcon.classList.add("bi-heart");
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
	
	            // Like count
	           const col1 = document.createElement("div");
	           col1.classList.add("col", "justify-content-start", "align-items-center");
	
	           const likeIcon = document.createElement("i");
	           likeIcon.id = "heart-" + response.snapDetail.snap_board_no;
	           likeIcon.classList.add("bi", response.checkLike == 0 ? "bi-heart" : "bi-heart-fill");
	           likeIcon.style.color = "#ff2465";
	           likeIcon.dataset.snapBoardNo = response.snapDetail.snap_board_no;
	           likeIcon.onclick = response.checkLike == 0 ? () => like(response.snapDetail.snap_board_no) : () => unLike(response.snapDetail.snap_board_no);
	
               const likeCount = document.createElement("span");
	           likeCount.innerText = " " + response.countLike + "  ";
	
	           col1.appendChild(likeIcon);
	           col1.appendChild(likeCount);
	
	           const viewIcon = document.createElement("i");
	           viewIcon.classList.add("bi", "bi-eye","icon");
	
	           const viewCount = document.createElement("span");
	           viewCount.innerText = "  " + response.snapDetail.snap_board_view_count + " ";
	
	           col1.appendChild(viewIcon);
	           col1.appendChild(viewCount);
	           
	   	       const col2 = document.createElement("div");
	           col2.classList.add("col", "d-flex","align-items-center");
	
	           row1.appendChild(col1);
	           row1.appendChild(col2);
	
               snapDetailContent.appendChild(row1);

               const dogNameRow = document.createElement("div");
               dogNameRow.classList.add("row","mt-0");
               
               const dogNameCol = document.createElement("div");
               dogNameCol.classList.add("col");
               
               dogNameSpan = document.createElement("span");
               dogNameSpan.innerText = response.dogDto.dog_name;
               dogNameSpan.style.fontSize = "20px";
               dogNameSpan.style.color = "#DC7633";
               dogNameSpan.classList.add("fw-bold")
               dogNameCol.appendChild(dogNameSpan);
               dogNameRow.appendChild(dogNameCol);
               
               
               const row2 = document.createElement("div");
               row2.classList.add("row");
               row2.classList.add("mt-3");
               row2.classList.add("mb-3");

               const col3 = document.createElement("div");
               col3.classList.add("col");
               col3.innerText = response.snapDetail.snap_board_content;
               col3.style.fontSize = "14px";

               snapDetailContent.appendChild(dogNameRow);
               snapDetailContent.appendChild(row1);
               row2.appendChild(col3);
                
               snapDetailContent.appendChild(row2);
               
               const hashRow = document.createElement("div");
               hashRow.classList.add("row")
               const hashCol = document.createElement("div");
               hashCol.classList.add("col");
               const hashSpan = document.createElement("span");
               hashSpan.classList.add("text-primary");
               hashSpan.style.fontSize = "14px";
               hashSpan.innerText = "#애견의류 #애견패션 #반려견티셔츠 #강아지패션 #편안한의류 #강아지스타일 #애견소통";
               hashCol.appendChild(hashSpan);
               hashRow.appendChild(hashCol);
               snapDetailContent.appendChild(hashRow);
               
                
				// insert comment
                const commentFormRow = document.createElement("div");
	            commentFormRow.classList.add("row", "mt-3","mb-2");
	            const commentFormCol = document.createElement("div");
	            commentFormCol.classList.add("col");
	            const commentForm = document.createElement("div");
	            commentForm.classList.add("row");
	            const commentContentBoxCol = document.createElement("div");
	            commentContentBoxCol.classList.add("col-10", "comment-textbox", "px-1");
	            const commentContentBox = document.createElement("input");
	            commentContentBox.style.fontSize = "12px";
	            commentContentBox.id = "commentContentBox";
	            commentContentBox.type = "text";
	            commentContentBox.classList.add("form-control","py-1");
	            commentContentBox.placeholder = "댓글 달기...";
	            commentContentBoxCol.appendChild(commentContentBox);
	            const commentSubmitBtnCol = document.createElement("div");
	            commentSubmitBtnCol.classList.add("col", "d-grid", "px-0","py-0");
	            const commentSubmitBtn = document.createElement("button");
	            commentSubmitBtn.onclick = function() { registerComment(response.snapDetail.snap_board_no); };
	            commentSubmitBtn.classList.add("btn","py-0","fw-bold");
	            commentSubmitBtn.innerText = "게시";
	            commentSubmitBtn.style.fontSize = "12px";
	            commentSubmitBtn.style.color = "white";
	            commentSubmitBtn.style.backgroundColor = "#ffa500";
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
                    col5.classList.add("col", "fw-bold", "fs-5");

                    const span3 = document.createElement("span");
                    span3.style.fontSize = "14px";
                    span3.style.color = "#c83131";
                    span3.innerText = comment.customerDto.customer_nickname;

                    col5.appendChild(span3);
                    row4.appendChild(col5);
                    snapDetailContent.appendChild(row4);

                    const col6 = document.createElement("div");
                    col6.classList.add("col");
                    col6.classList.add("text-end");

                    const span4 = document.createElement("span");
                    span4.style.fontSize = "10px";
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
                    span5.style.fontSize = "12px";
                    span5.innerText = comment.snapBoardCommentDto.snap_board_comment_content;
                    span5.classList.add("text-break");

                    col7.appendChild(span5);
                    row5.appendChild(col7);
                    snapDetailContent.appendChild(row5);
                }
            }
            // Open modal
            const modal = bootstrap.Modal.getOrCreateInstance('#snapDetailModal');
            
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
		<div class="row sticky-top p-0">
			<div class="col p-0">
				<nav class="topNavbar sticky-top bg-body-tertiary pt-3">
					<div class="container p-0">
						<div class="container p-0">
							<div class="container-fluid">
								<%-- 1 --%>
								<div class="row">
									<div class="col-3">
										<a href="/welcomepet/pointProd/board"
											class="btn btn-black py-0"
											style="border: transparent; outline: none;"> <i
											class="btn bi bi-arrow-left p-0"
											style="border: transparent; outline: none; font-size: 1.5em;"></i>
										</a>
									</div>

									<div class="col-6 text-center">
										<a id="main" href="../snap/main" class="fs-2">커뮤니티</a>
									</div>

									<div class="col d-flex justify-content-end me-1">
										<a class="btn bi bi-bell-fill text-secondary btn-lg p-0"
											role="button" href="#"></a>
									</div>
								</div>

								<%-- 2 --%>
								<div class="row text-center">
									<div class="col mt-2">
										<div class="row mb-2">
											<div class="col"></div>
										</div>

										<div class="row" style="font-size: 0.9em;">
											<div class="col text-center fw-bold">
												<a class="nav-link" href="/welcomepet/snap/main"
													style="border-bottom: 2.5px solid gray">스냅</a>
											</div>
											<div class="col text-center">
												<a class="nav-link text-secondary"
													href="/welcomepet/pointProd/board">어서대화하개</a>
											</div>

											<div class="col text-center">
												<a class="nav-link text-secondary"
													href="/welcomepet/community/showDogPostList">어서보여주개</a>
											</div>
										</div>
									</div>
								</div>
							</div>


						</div>
					</div>
				</nav>
			</div>
		</div>



		<c:forEach items="${list}" var="data">
			<div class="row mb-1">
				<div class="col">
					<div class="row">
						<div class="col">
							<div class="row border-bottom border-top align-items-center justify-content-center" style="height: 48px;">
								<div class="col">
<%-- 									<img id="profileImg"
										src="/uploadFiles/WelcomePet/${data.dogDto.dog_image}"> <span
										onclick="location.href = './dogProfile?dog_no=${data.dogDto.dog_no}';"
										class="align-middle fw-bold mx-1 my-1 fs-6"> --%> <span> ${data.dogDto.dog_name}</span>
								</div>
								<div class="col-auto d-flex justify-content-end align-items-center">
									<i class="bi bi-three-dots-vertical"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="row p-0">
						<div class="col-12 px-0">
							<a href="javascript:void(0);" onclick="readSnap(${data.snapBoardDto.snap_board_no});"> 
								<img src="/uploadFiles/thumbnail/${data.snapBoardDto.snap_thumbnail}" id="thumbnail">
							</a>
						</div>
					</div>
					<div class="row mt-1">
						<div class="col">
							<c:choose>
								<c:when test="${data.checkLike == 0}">
									<i id="heart-${data.snapBoardDto.snap_board_no}"
										class="bi bi-heart fs-5" style="color: #ff2465;"
										data-snapBoardNo="${data.snapBoardDto.snap_board_no}"
										onclick="like(${data.snapBoardDto.snap_board_no});"></i>
								</c:when>
								<c:otherwise>
									<i id="heart-${data.snapBoardDto.snap_board_no}"
										class="bi bi-heart-fill fs-5" style="color: #ff2465;"
										data-snapBoardNo="${data.snapBoardDto.snap_board_no}"
										onclick="unLike(${data.snapBoardDto.snap_board_no});"></i>
								</c:otherwise>
							</c:choose>
							<i class="bi bi-chat mx-2 fs-5"></i> <i class="bi bi-send fs-5"></i>
						</div>
						<div class="col text-end">
							<i class="bi bi-bookmark fs-5"></i>
						</div>
					</div>
					<div class="row my-1">
						<div class="col">
							<span style="font-size: 14px;">좋아요 ${data.countLike}개</span>
						</div>
					</div>
					<div class="row my-1">
						<div class="col-3">
							<a href="/welcomepet/board/productDetail?product_no=15"><img id="productSnap" src="/welcomepet/resources/img/snapProduct.png"></a>
						</div>
						<div class="col-9 px-0">
							<div class="row mx-0 align-items-center">
								<div class="col text-truncate">
									<span>루비디 러블리바니 민소매 티셔츠 민트 M</span>
								</div>
							</div>
							<div class="row mx-0 align-items-center">
								<div class="col">
									<span style="font-size: 13px;">12,900원</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row my-1">
						<div class="col">
							<span class="text-primary" style="font-size: 0.9em;">#애견의류 #애견패션 #반려견티셔츠 #강아지스타일<br>#강아지패션 #애견소통</span>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col text-secondary">
							<i class="bi bi-geo-alt-fill" style="font-size: 12px;"></i><span
								style="font-size: 12px;" class="mx-1">${data.snapBoardDto.snap_location}</span>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>


	</div>
	<div class="row fixed-bottom mb-5 pb-4 text-end">
		<div class="col"></div>
		<div class="col-3 d-flex justify-content-center align-items-center">
			<a class="btn btn-lg shadow rounded-circle justify-content-center align-items-center" href="./postSnap" style="color:white; height:52px; background-color:#ffa500">
				<i class="bi bi-pencil-square" style="color: white;"></i>
			</a>
		</div>
	</div>
	<jsp:include page="../common/bottomTabCommu.jsp"></jsp:include>



	<!-- Modal -->
	<div class="modal fa0de" id="snapDetailModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<img id="snapModalTop" src="/welcomepet/resources/img/logo.png">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body p-2">
					<!-- Snap detail content -->
					<div class="container">
						<div class="row">
							<div class="col">
								<div id="carouselExampleFade"
									class="carousel slide carousel-fade" data-bs-ride="carousel">
									<div id="imgBox" class="carousel-inner"></div>
									<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExampleFade" data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button"
										data-bs-target="#carouselExampleFade" data-bs-slide="next">
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
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>