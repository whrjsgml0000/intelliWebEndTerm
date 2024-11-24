/** @type {HTMLInputElement} */
let title = document.getElementById("title");
/** @type {HTMLInputElement} */
let content = document.getElementById("content");
/** @type {HTMLFormElement} */
let form = document.getElementById("form");

const updateValidate = () => {
	if(title.value.length < 1){
		alert("제목은 1글자 이상으로 만들어야 합니다.");
		return;
	}
	form.submit();
}