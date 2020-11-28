const pay = () => {
  const transactionFormWrap = document.getElementById("charge-form");
  transactionFormWrap.addEventListener("submit", (e) => {
    e.preventDefault();
    console.log("フォーム送信時にイベント発火")
  });
};

window.addEventListener("load", pay);