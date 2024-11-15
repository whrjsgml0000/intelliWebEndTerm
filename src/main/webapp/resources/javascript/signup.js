/** @type {HTMLInputElement} */
let signupBtn = document.getElementById("signup");

const validate = () => {
  /** @type {HTMLInputElement} */
  let id = document.getElementById("id");
  /** @type {HTMLInputElement} */
  let passwd = document.getElementById("passwd");
  /** @type {HTMLInputElement} */
  let passwdCheck = document.getElementById("passwdCheck");
  /** @type {HTMLFormElement} */
  let signupForm = document.getElementById("signupForm");

  if (!id.value.match(/[a-zA-Z0-9]{4,12}/)) {
    alert(`id는 영어와 숫자로 4~12자리 구성이어야 합니다.`);
    id.focus();
  } else if (!passwd.value.match(/[a-zA-Z0-9]{4,12}/)) {
    alert(`비밀번호는 영어와 숫자로 4~12자리 구성이어야 합니다.`);
    passwd.focus();
    passwd.value = "";
    passwdCheck.value = "";
  } else if (passwd.value != passwdCheck.value) {
    alert(`비밀번호와 비밀번호 확인의 입력 값이 다릅니다.`);
    passwd.focus();
    passwd.value = "";
    passwdCheck.value = "";
  } else {
    signupForm.submit();
  }
};
