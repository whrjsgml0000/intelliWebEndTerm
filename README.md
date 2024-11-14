# 실행 가이드
  1. 회원가입을 한다.
  2. 게시글을 보거나 작성한다.
  3. 찾고 싶은 게시글이 있다면 검색을 이용한다.

# 특징
+ 회원가입을 해야지만 글을 보거나 쓸 수 있다.
+ 회원을 탈퇴할 경우 작성한 글 또한 모두 삭제된다.
+ 게시글은 제목, 사진, 내용을 업로드 할 수 있다. 이미지 크기만 적절하다면(개당 3mb) .gif 파일 또한 게시할 수 있다.
+ 본인 게시글은 본인만이 삭제할 수 있다.

## ToDo
- [ ] 이미지 저장 경로를 절대경로에서 상대경로로 변경
- [ ] session.getAttribute("UserInfo")의 User 값의 id가 현재 로그인 된 User의 id와 같을 경우 게시글 삭제, 수정 기능 추가
- [ ] 게시글에 댓글 기능 추가
- [ ] 마이 페이지에서 자기가 쓴 글 확인하는 기능 추가
- [ ] 메인 페이지에서 검색 기능 추가(제목 검색, 내용 검색, 글쓴이 검색)
- [ ] 회원 가입할 때 성별이나 생년월일, 이메일, 본명 등을 추가하도록 변경
- [ ] 마이 페이지에서 수정 기능 추가
- [ ] 마이 페이지에서 프로필 사진 설정 기능 추가
- [ ] 메인 페이지에서 한 번에 볼 게시글 개수 설정 기능 추가
- [ ] 메인 페이지에서 페이지 넘기는 기능 추가(검색 쿼리 유지 되면서 페이지 쿼리가 있어야함)
- [ ] 부트스트랩 연동 or 스타일 코드 작성
- [ ] 아이디 비밀번호 찾기 기능 추가
- [ ] 오늘 작성된 글 중 높은 조회수 순으로 정렬하는 기능 추가
