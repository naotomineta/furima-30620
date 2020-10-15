function price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("keyup", () => {
    const Tax = 0.1;
    const p = priceInput.value * Tax
    const n = 0.9
    const i = priceInput.value * n
    const priceFee = Math.floor(p);
    const profit = Math.floor(i);
    const fee = document.getElementById("add-tax-price");
    const profitFee = document.getElementById("profit");
    fee.innerHTML = priceFee;
    profitFee.innerHTML = profit;
  });
};

window.addEventListener('load', price)