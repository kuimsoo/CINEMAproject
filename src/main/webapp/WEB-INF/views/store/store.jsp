<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
ul, li {      
    list-style-type: none; 
    padding: 0; 
    margin: 0; 
    /* 점없애는곳*/
}
#container {
    display: flex;
    flex-wrap: wrap;      /* 이미지 정렬을 위해 사용*/
    justify-content: center; 
    padding: 20px;
    width: 1000px; 
    margin: 0 auto;   
    /* 전체적인 컨테이너*/
}
#contents {
    flex: 1 1 200px; /* 유연한 크기 조정 */
    margin: 10px; 
    padding: 15px; 
    background-color: #f9f9f9; 
    width: calc(100% - 40px); /* padding 20px*2 */
    position: relative; /* 자식 요소 위치 조정 */
  
}
.category_wrap {
    margin-bottom: 20px; /* 스토어와 선 사이의 간격을 추가 */
}
.separator, .separator1 {
    width: 100%; /* 부모 요소의 전체 너비를 차지하도록 설정 */
    height: 2px;
    margin: 0;
}
/* 밑줄*/
.separator {
    position: relative; /* 상위 요소에 상대적으로 위치 */
    bottom: 0; /* 부모 요소의 하단에 위치 */
    background-color: #000; 
}
.separator1 {
    position: relative; /* 상위 요소에 상대적으로 위치 */
    margin-top: 20px; /* 간격 추가: .contegory_contents_wrap과의 간격 */
    background-color: grey;
}
.separator2{
    height: 1px; /* 선의 두께 설정 */
    width: 100%; /* 부모 요소의 전체 너비를 차지하도록 설정 */
    background-color:   grey; /* 선 색상 변경 */
    margin-top: 3px; /* 상단 여백 추가 */
    margin-bottom: 20px;
    position: relative; /* 상위 요소에 상대적으로 위치 */

}
.circle-button {
    display: inline-flex;
    align-items: center; /* 수직 중앙 정렬 */
    justify-content: center; /* 수평 중앙 정렬 */
    width: 17px;
    height:17px;
    line-height: 20px;
    text-align: center;
    border-radius: 50%;
    background-color: grey;
    color: white;
    font-size: 14px;
    text-decoration: none;
    font-weight: bold;
    transition: background-color 0.3s;
    
    position: absolute; /* 버튼을 절대 위치로 설정 */
    right: 20px; /* 오른쪽 끝에서 10px 떨어지도록 설정 */
    
}
.circle-button:hover {
    background-color: #0056b3;
}
.contegory_contents_wrap {
    display: flex; /* flex 레이아웃을 사용 */
    flex-direction: row; /* 자식 요소를 수평으로 나열 */
    justify-content: space-between; /* 자식 요소들 사이에 공간을 균등하게 배분 */
    align-items: center; /* 자식 요소들을 수직으로 가운데 정렬 */
    flex-wrap: wrap; /* 자식 요소가 필요에 따라 줄 바꿈 */
    margin-bottom: 20px; /* 자식 요소와 선 사이의 간격을 추가 */
}
.category_content {
    display: flex; /* flex 레이아웃을 사용 */
    flex-direction: row; /* 자식 요소를 수평으로 나열 */
    gap: 20px; /* 리스트 아이템 사이에 간격 추가 */
    padding: 0; /* 기본 패딩 제거 */
    margin: 0; /* 기본 마진 제거 */
    flex-wrap: wrap; /* 리스트가 넘치지 않도록 줄 바꿈 */
    justify-content: space-around; /* 리스트 항목 사이에 여백 추가 */
}
.cart_content {
    display: flex; /* flex 레이아웃을 사용 */
    flex-direction: row; /* 자식 요소를 수평으로 나열 */
    gap: 25px; /* 리스트 아이템 사이에 간격 추가 */
    padding: 0; /* 기본 패딩 제거 */
    margin: 0; /* 기본 마진 제거 */
    flex-wrap: wrap; /* 리스트가 넘치지 않도록 줄 바꿈 */
    justify-content: space-between; /* 리스트 항목 사이에 여백 추가 */
}
#cart-count, #giftcon {
    display: inline-block; /* 텍스트와 함께 한 줄에 표시 */
margin-left: 5px; /* 텍스트와 숫자 사이의 간격 추가 */
padding: 0 4px; /* 숫자를 감싸는 여백 추가 */
background-color: #ff0000; /* 배경색 */
color: white; /* 글자색 */
border-radius: 50%; /* 원형 배경 */
font-size: 12px; /* 글자 크기 */
line-height: 20px; /* 텍스트 수직 중앙 정렬 */
height: 20px; /* 원형을 유지하기 위한 높이 */
width: 20px; /* 원형을 유지하기 위한 너비 */
text-align: center; /* 텍스트 중앙 정렬 */
vertical-align: middle; /* 수직 중앙 정렬 */
}
.category_title {
    display: flex;
    align-items: center; /* 수직 정렬 */
    gap: 20px; /* 텍스트와 버튼 사이의 간격 조정 */
}

.category_inner {
    display: flex; /* Flexbox 레이아웃을 사용 */
    flex-wrap: wrap; /* 필요 시 줄 바꿈 */
    gap: 20px; /* 항목 사이의 간격 추가 */
    padding: 0; /* 기본 패딩 제거 */
    margin: 0; /* 기본 마진 제거 */
}
.category_inner .product {
    flex: 1 1 calc(33.333% - 20px); /* 각 항목의 너비를 3개의 열로 나누기 */
    box-sizing: border-box; /* 패딩과 테두리가 너비에 포함되도록 설정 */
    text-align: center; /* 텍스트 중앙 정렬 */
    max-width: calc(33.333% - 20px); /* 최대 너비를 33.333%로 설정 */
}
.product img {
    max-width: 100%; /* 이미지가 부모 요소의 너비를 초과하지 않도록 설정 */
    height: auto; /* 이미지 비율 유지 */
}
.product-info {
    margin-top: 10px; /* 이미지와 텍스트 사이의 간격 추가 */
}
.product-name {
    font-size: 14px; /* 텍스트 크기 조정 */
    color: #333; /* 텍스트 색상 설정 */
}
.original-price {
text-decoration: line-through; /* 가격에 취소선 추가 */
color: #999; /* 취소선 색상 설정 */
font-size: 14px; /* 취소선 가격 크기 조정 */
}

.discounted-price {
    color: #ff0000; /* 할인된 가격 색상 */
    font-size: 16px; /* 할인된 가격 크기 조정 */
    font-weight: bold; /* 할인된 가격 굵게 표시 */
}
.giftcardtext,.tiket-price{
    font-size: 14;
    font-weight: bold;
}
.info_wrap {
    width: 1000px; /* 너비를 1000px로 설정 */
    margin: 0 auto; /* 중앙 정렬 */
    padding: 20px; /* 내부 여백 추가 */
    box-sizing: border-box; /* 패딩과 테두리를 너비에 포함 */
    display: flex; /* Flexbox 레이아웃을 사용 */
    align-items: center; /* 자식 요소를 수직으로 중앙 정렬 */
    gap: 20px; /* 자식 요소 간의 간격 추가 */
}
.popup-text {
            font-size: 24px; /* 제목 글씨 크기 조정 */
            margin-bottom: 10px; /* 제목과 본문 사이 여백 */
        }
.popup-image {
            max-width: 100%; /* 이미지가 부모 요소의 너비를 초과하지 않도록 설정 */
            height: auto; /* 이미지 비율 유지 */
            margin-bottom: 10px; /* 이미지와 본문 사이 여백 */
            margin-top: -100px;
        }
img {
    max-width: 100%;
    height: auto;
}
.popup-description {
            font-size: 16px; /* 본문 글씨 크기 조정 */
            color: #555; /* 본문 글씨 색상 조정 */
            margin-top: 10px; /* 본문과 제목 사이 여백 */
        }
.phone-icon {
    width: 30px; /* 원하는 너비로 조정 */
    height: auto; /* 이미지 비율 유지 */
    vertical-align: middle; /* 텍스트와 이미지의 수직 정렬 조정 */
}

.category_content li {
    cursor: pointer; /* 클릭 커서로 변경 */
}
.service_center{
    width: 1000px;        /* 너비를 1000px로 설정 */
    margin: 0 auto;       /* 중앙 정렬 */
}
.product {
position: relative; /* 이 부분을 추가하여 아이콘 위치 조정 */
overflow: hidden; /* 아이콘과 텍스트가 이미지 영역을 넘지 않도록 설정 */
        }
.hidden-icon {
    display: none; /* 기본적으로 숨김 */
    position: absolute;
    bottom: 10px; /* 이미지 하단에 위치 조정 */
    right: 10px; /* 이미지 오른쪽에 위치 조정 */
    background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
    color: white;
    border-radius: 50%;
    width: 30px;
    height: 30px;
    text-align: center;
    line-height: 30px;
    font-size: 16px;
    font-weight: bold;
}
.product:hover .icon-overlay {
    display: none; /* 기본적으로 숨김 */
}
.icon-overlay {
    
    position: absolute;
    top: 50%; /* 이미지 상단에서 중앙 위치 */
    left: 50%; /* 이미지 왼쪽에서 중앙 위치 */
    transform: translate(-50%, -50%); /* 중앙 정렬을 위한 변환 */
    display: none; /* 기본적으로 숨김 */
    background-color: rgba(255, 255, 255, 0.8); 
    color: white;
    border-radius: 50%;
    width: 60px;
    height: 60px;
    text-align: center;
    line-height: 40px;
    font-size: 24px;
    font-weight: bold;
}
        .hover-text {
    display: none; /* 기본적으로 숨김 */
    position: absolute; /* 아이콘에 대해 절대 위치 */
    bottom: -50px; /* 아이콘 위에 위치하도록 조정 */
    left: 50%; /* 아이콘의 중앙 정렬 */
    transform: translateX(-50%); /* 수평 중앙 정렬 */
    background-color: rgba(0, 0, 0, 0.8); /* 반투명 배경 */
    color: white; /* 글자 색상 */
    padding: 5px; /* 텍스트 주변 여백 */
    border-radius: 5px; /* 둥근 모서리 */
    font-size: 14px; /* 텍스트 크기 조정 */
    white-space: nowrap; /* 텍스트가 줄 바꿈되지 않도록 설정 */
    z-index: 20; /* 텍스트가 다른 요소 위에 위치하도록 설정 */
}
.product:hover .icon-container {
    display: flex; /* 호버 시 아이콘 표시 */
}

.icon-left, .icon-center, .icon-right {
    background-color: rgba(255, 255, 255, 0.8); /* 밝은 배경색으로 변경 */
    color: black; /* 아이콘 색상 */
    border-radius: 50%;
    width: 30px; /* 아이콘 크기 */
    height: 30px; /* 아이콘 크기 */
    text-align: center; /* 아이콘 텍스트 중앙 정렬 */
    line-height: 30px; /* 아이콘 텍스트 수직 중앙 정렬 */
    font-size: 16px; /* 아이콘 텍스트 크기 */
    font-weight: bold; /* 아이콘 텍스트 굵게 */
}
.icon-container {
    position: absolute; /* 이미지 내부에 절대 위치로 배치 */
    width: 100%; /* 이미지의 전체 너비를 차지하도록 설정 */
    height: 100%; /* 이미지의 전체 높이를 차지하도록 설정 */
    top: 0; /* 이미지 상단에 맞춤 */
    left: 0; /* 이미지 왼쪽에 맞춤 */
    display: flex; /* flexbox 레이아웃을 사용하여 아이콘 정렬 */
    justify-content: space-between; /* 아이콘을 왼쪽, 중앙, 오른쪽에 배치 */
    align-items: center; /* 아이콘을 수직으로 중앙 정렬 */
    padding: 20px; /* 이미지의 가장자리에서 아이콘까지의 거리 설정 */
    box-sizing: border-box; /* padding을 요소의 전체 너비와 높이에 포함되도록 설정 */
    display: none; /* 기본적으로 숨김 */
    pointer-events: none; /* 아이콘의 클릭을 막고 이미지의 클릭을 가능하게 함 */

}

.icon-item img {
    width: 20px; /* 아이콘 크기 조정 */
    height: auto; /* 비율 유지 */
   
}
.icon-item:hover .hover-text {
    display: block; /* 마우스 오버 시에만 표시 */
}
.icon-item {
    position: relative; /* 텍스트를 아이콘에 맞게 배치하기 위해 */
    pointer-events: auto; /* 아이콘의 클릭을 가능하게 함 */
}
.category_title strong {
    padding-right: 50px; /* 버튼 너비만큼 여백을 추가하여 텍스트가 버튼에 겹치지 않게 함 */
}

    </style>
</head>
<body>
    <div id="container">
        <div id="contents">
            <div class="category_wrap">
                스토어
                <div class="separator"></div> <!-- 선을 스토어 아래에 위치 -->
            </div>
            <div class="contegory_contents_wrap">
                <ul class="category_content"> <!-- ul로 변경 -->
                    <li data-href="D:\구임수\login.html">패키지</li>
                    <li data-href="D:\구임수\order.html">영화관람관</li>
                    <li data-href="D:\구임수\order.html">기프트카드</li>
                    <li data-href="D:\구임수\order.html">콤보</li>
                    <li data-href="D:\구임수\프로젝트\popcorn.html">팝콘</li>
                    <li data-href="D:\구임수\order.html">음료</li>
                    <li data-href="D:\구임수\order.html">스낵</li>
                </ul>
                <ul class="cart_content"> <!-- ul로 변경 -->
                    <li>내 기프트콘<span id="giftcon">0</span></li> 
                    <li>장바구니<span id="cart-count">0</span></li> <!-- 장바구니 카운트 -->
                </ul>   
            </div>
            <div class="separator1"></div> <!-- 선을 contegory_contents_wrap 아래에 위치 -->
            <div class="category_product_wrap">
                <ul class="product_list">
                    <li>
                        <strong class="category_title">패키지<br>
                            <a href="file:///D:/구임수/home.html" class="circle-button">+</a>
                        </strong> 
                        <div class="separator2"></div>
                        <ul class="category_inner">
                            <li class="product" id="1">
                                <a href="/details?id=1" class="btn_category_product">  
                                    <img src="/images/세트1.jpeg" alt="패키지1"></a>
                                    <div class="icon-container">
                                        <div class="icon-item icon-left">
                                            <div class="icon-item icon-left">
                                                <img src="D:\구임수\이미지\장바구니.png" alt="Left Icon">
                                                <div class="hover-text">장바구니</div>
                                            </div>
                                        </div> 
                                        <div class="icon-item icon-center">
                                            <img src="D:\구임수\이미지\선물하기.png" alt="Center Icon">
                                            <div class="hover-text">선물하기</div>
                                        </div>
                                        <div class="icon-item icon-right">
                                            <img src="D:\구임수\이미지\구매하기.png" alt="Right Icon">
                                            <div class="hover-text">구매하기</div>
                                        </div>
                                    </div>
                                <div class="product-info">
                                    <span class="product-name">패키지1</span><br>
                                        <span class="original-price">66,000원</span>
                                        <span class="discounted-price">62,000원</span>
                                </div>
                            </li>   
                            <li class="product" id="2">
                                <a href="/details?id=22" class="btn_category_product" >  
                                    <img src="D:\구임수\이미지\세트2.jpeg" alt="패키지2"></a>
                                    <div class="icon-container">
                                        <div class="icon-item icon-left">
                                            <img src="D:\구임수\이미지\장바구니.png" alt="Left Icon">
                                            <div class="hover-text">장바구니</div>
                                        </div>
                                        <div class="icon-item icon-center">
                                            <img src="D:\구임수\이미지\선물하기.png" alt="Center Icon">
                                            <div class="hover-text">선물하기</div>
                                        </div>
                                        <div class="icon-item icon-right">
                                            <img src="D:\구임수\이미지\구매하기.png" alt="Right Icon">
                                            <div class="hover-text">구매하기</div>
                                        </div>
                                    </div>
                                <div class="product-info">
                                    <span class="product-name">패키지2</span><br>
                                    <span class="original-price">37,000원</span>
                                    <span class="discounted-price">35,000원</span>
                                </div>          
                            </li>
                            <li class="product" id="3">
                                <a href="/details?id=3" class="btn_category_product">  
                                    <img src="D:\구임수\이미지\세트3.jpeg" alt="패키지3"></a>
                                <div class="product-info">
                                    <span class="product-name">패키지3</span><br>
                                    <span class="original-price">20,000원</span>
                                    <span class="discounted-price">18,000원</span>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <strong class="category_title">기프트 카드<br>
                            <a href="file:///D:/구임수/home.html" class="circle-button">+</a>
                        </strong>  
                        <div class="separator2"></div>
                        <ul class="category_inner">
                            <li class="product" id="7">
                                <a href="/details?id=4" class="btn_category_product">
                                    <img src="기프트카드1.png"></a>
                                    <div class="product-info">
                                        <span class="giftcard-name">기프트카드1</span><br>
                                        <span class="giftcardtext">금액충전형</span>
                                    </div>     
                            </li>
                            <li class="product" id="8">
                                <a href="/details?id=5" class="btn_category_product">
                                    <img src="기프트카드2.png"></a>
                                    <div class="product-info">
                                        <span class="giftcard-name">기프트카드2</span><br>
                                        <span class="giftcardtext">금액충전형</span>
                                    </div>     
                            </li>
                            <li class="product" id="9">
                                <a href="/details?id=9" class="btn_category_product">
                                    <img src="기프트카드3.png"></a>
                                    <div class="product-info">
                                        <span class="giftcard-name">기프트카드3</span><br>
                                        <span class="giftcardtext">금액충전형</span>
                                    </div>     
                            </li>
                        </ul>
                    </li>
                    <li>
                        <strong class="category_title">영화관람권<br>
                            <a href="file:///D:/구임수/home.html" class="circle-button">+</a>
                        </strong>
                        <div class="separator2"></div> 
                        <ul class="category_inner">
                            <li class="product" id="4">
                                <a href="/details?id=2" class="btn_category_product">
                                    <img src="/images/영화관람권1.png"></a>
                                    <div class="product-info">
                                        <span class="tiket-name">영화관람권1</span><br>
                                        <span class="tiket-price">13,000원</span>
                                    </div>     
                            </li>
                            <li class="product" id="5">
                                <a href="/details?id=5"class="btn_category_product">
                                    <img src="영화관람권2.png"></a>
                                    <div class="product-info">
                                        <span class="tiket-name">영화관람권2</span><br>
                                        <span class="tiket-price">17,000원</span>
                                    </div>
                            </li>
                            <li class="product" id="6">
                                <a href="/details?id=6" class="btn_category_product">
                                    <img src="영화관람권3.png"></a>
                                    <div class="product-info">
                                        <span class="tiket-name">영화관람권3</span><br>
                                        <span class="tiket-price">18,000원</span>
                                     </div>     
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>    
        </div>        
    </div>
    <div class="info_wrap">
        <div class="text_container">
          
            <h1 class="popup-text">기프트샵 이용안내</h1>
                MG시네마 기프트샵 이용하기.
            
        </div>
        <img src="D:\구임수\이미지\기프트샵.png" alt="Image description" class="popup-image">
    </div>
    <div class="service_center">
        <h1>MG시네마고객센터</h1>   
        <p><img src="D:\구임수\이미지\전화기.ico" alt="전화기" class="phone-icon">1544-0000</p>
        <p>안녕하세요</p>
    </div>
</body>
<script src="https://code.jquery.com/jquery-latest.js">
</script>
<script>



</script>

</html>