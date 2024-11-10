/** @type {HTMLInputElement} */
let file = document.getElementById("file");
/** @type {HTMLInputElement} */
let title = document.getElementById("title");
/** @type {HTMLInputElement} */
let content = document.getElementById("content");
/** @type {HTMLFormElement} */
let form = document.getElementById("form");
/** @type {File[]} */
let files;

const uploadValidate = () => {
  files = file.files;
  if (title.value.length < 5) {
    alert("제목은 5글자 이상으로 만들어야 합니다.");
    return;
  }

  if (files.length > 5) {
    alert("한 번에 업로드 가능한 파일의 개수는 5개 입니다.");
    return;
  }

  for (var f of files) {
    if (f.size >= 1024 * 1024 * 2) {
      alert("개별 파일 크기는 2MB를 넘을 수 없습니다.");
      return;
    } else if (!f.name.match(/(.jpg|.png|.jpeg|.webp|.gif)$/)) {
      alert("파일에 지원하지 않는 확장자명이 존재합니다.");
      return;
    }
  }
  console.log("업로드 성공!");
  form.submit();
};
