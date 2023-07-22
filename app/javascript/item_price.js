window.addEventListener('load', createTax);

function createTax (){
  const priceInput = document.getElementById("item-price");
  if (priceInput == null) {
    return;
  }
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = inputValue - Math.floor(inputValue * 0.1)
 })
};