# 웹 호스팅

AWS의 EC2와 Duck DNS를 이용해서 웹 호스팅 했습니다.
http://chogunhee.duckdns.org:8080/IntelliWebEndTerm/MainPage.jsp

# 실행 가이드(서버 작동 가이드)

1. cmd 를 실행한 후 `mysql -u root -p -P 3306` 을 입력한다.
2. 비밀번호(1234)를 입력한다.
3. sql 폴더의 create_database_board.sql 파일 내용을 복사해서 cmd 창에 입력한다.
4. `use board` 를 입력해서 데이터베이스를 선택한다.
5. 이후 create_table_users, create_table_post, create_table_image, create_table_comment 파일도 똑같이 입력한다.
6. 이클립스를 이용해서 서버를 실행한다.

# 이용 가이드

1. 회원가입을 한다.
2. 게시글을 보거나 작성한다.
3. 찾고 싶은 게시글이 있다면 검색을 이용한다.

# 특징

- 회원가입을 해야지만 글을 보거나 쓸 수 있다.
- 회원을 탈퇴할 경우 작성한 글 또한 모두 삭제된다.
- 게시글은 제목, 사진, 내용을 업로드 할 수 있다. 이미지 크기만 적절하다면(개당 3mb) .gif 파일 또한 게시할 수 있다.
- 본인 게시글은 본인만이 삭제할 수 있다.
- 검색 기능이 있어서 본인이 찾고 싶은 검색어를 입력해 찾을 수 있다.
