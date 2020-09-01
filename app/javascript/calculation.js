window.addEventListener('load', function(){
  const itemPrice = document.getElementById("item-price")
  const itemCommission = document.getElementById("add-tax-price")
  const itemProfit = document.getElementById("profit")
  itemPrice.addEventListener('keyup', function(){
    const price = itemPrice.value;
    const commission = price * 0.1
    const profit = price - commission
    itemCommission.innerHTML = commission
    itemProfit.innerHTML = profit
  })
})