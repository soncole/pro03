# 프로젝트 개요
## 프로젝트명 - 강릉 문화 관광
## 프로젝트 기간 - 2023.05.22 ~
## 프로젝트 참여 - 손승기, 이재호<br><br>
### 자바 버전 - jdk 1.8<br><br>
### 자바스크립트 버전 - 1.0<br><br>
### 다이나믹 웹 모듈 - 3.1<br><br>
### DBMS - MySQL 8.0.28<br><br>
### 자바 사용 라이브러리 - crypto, json, cos, commons, mail<br><br>
### css 프레임워크 - bulma<br><br>
### 자바스크립트 플러그인 - jQuery<br><br>
### 자바스크립트 api - daum 주소 api, daum지도 api, json 데이터 처리<br><br>
### 프로젝트 데이터 처리 패턴 - MVC2(View -> Controller -> Model -> Controller -> View)<br><br>
### 프로젝트 주요 기능 - 회원, 공지사항, 게시판, 질문 및 답변, 이용후기 등<br><br><hr><br>



## 프로젝트 특이사항<br><br>
- 회원가입시 중복체크는 별도의 팝업 창 없이 json을 활용하여 현재 창에서 구현<br><br>
- 회원가입시 주소의 입력은 daum 주소 api를 활용하여 주소를 전달<br><br>
- 회원의 비밀번호는 AES256으로 암호화하여 처리<br><br>
- 공지사항은 파일첨부 기능을 구현<br><br>
- 공지사항 전체 목록의 페이징 처리와 검색 기능 구현<br><br>
- 공지사항 글의 상세보기 화면에서 해당 게시된 공지중에서 파일 다운로드 기능 추가<br><br>
- 이용후기는 댓글과 별점 등으로 구성하여 게시될 수 있도록 처리<br><br><hr>

# 프로젝트 설계
- 개념적 설계
<br><br>
![개념적 설계](./exam/usecase.png "개념적 설계")
<br><br>
- 논리적 설계
<br><br>
![논리적 설계](./exam/table.png "논리적 설계")
<br><br>
- 물리적 설게
<br><br>
![물리적 설계](./exam/erd.png "물리적 설계")
<br><br>
- 클래스 설계
<br><br>
![클래스 설계](./exam/pro02dto.jpg "클래스 설계")
<br><br>

- 프로젝트 구성도
<br><br>
![프로젝트 구성도](./exam/project.png "프로젝트 구성도")
