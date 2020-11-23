window.addEventListener('load', () => {
  const pricefee = document.getElementById("item-price");
  pricefee.addEventListener("input", () => {
    const inputValue = pricefee.value;
    const priceInput = document.getElementById("item-price").value
    const fee = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    fee.innerHTML = Math.floor(priceInput * 0.1) 
    profit.innerHTML = Math.floor(priceInput * 0.9) 
   })
  });
