function check(){
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  let price_tax = 0;
  let price_tax_integer = 0;
  let price_profit = 0;

  price.addEventListener("input", () => {
    //priceに数値が入力された時の処理
    console.log(price)
    price_tax = price.value / 10;
    price_tax_integer = parseInt(price_tax, 10);
    price_profit = price.value - price_tax_integer;
    tax.innerHTML = price_tax_integer;
    profit.innerHTML = price_profit;
  });
}

window.addEventListener("load", check);