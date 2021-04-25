function post (){
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const inputTax = Math.floor(inputValue * 0.1);
    const addTaxPay = document.getElementById("profit");
    addTaxPay.innerHTML = Math.floor(inputValue - inputTax);
  });
};

window.addEventListener('load', post);