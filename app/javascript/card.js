const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);  const transactionFormWrap = document.getElementById("charge-form");
  transactionFormWrap.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buy[number]"),
      cvc: formData.get("buy[cvc]"),
      exp_month: formData.get("buy[exp_month]"),
      exp_year: `20${formData.get("buy[exp_year]")}`,
    };


  Payjp.createToken(card, (status, response) => {
    if (status == 200) {
      const token = response.id;
      const renderDom = document.getElementById("charge-form");
      const tokenObj = `<input value=${token} name='token'>`;
      renderDom.insertAdjacentHTML("beforeend", tokenObj);
    }
  });
});
};

window.addEventListener("load", pay);

