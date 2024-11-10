/** @type {HTMLInputElement} */
let file = document.getElementById("file");
/** @type {HTMLButtonElement} */
let button = document.getElementById("button");
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
  if (files.length > 5) {
    console.log("한 번에 업로드 가능한 파일의 개수는 5개 입니다.");
    return;
  }

  for (var f of files) {
    if (f.size >= 1024 * 1024 * 10) {
      console.log("개별 파일 크기는 10MB를 넘을 수 없습니다.");
      return;
    } else if (!f.name.match(/(.jpg|.png|.jpeg|.webp|.gif)$/)) {
      console.log("파일에 지원하지 않는 확장자명이 존재합니다.");
      return;
    }
  }
  console.log("업로드 성공!");
  form.submit();
};
