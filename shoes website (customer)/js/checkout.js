//quantity
let currentQuantity = document.querySelector("#quantity");
let quantity = parseInt(currentQuantity.innerHTML);

//price
let currentPrice = document.querySelector("#price");
let onlyNum = parseFloat(currentPrice.innerHTML.substring(1));

//base
let currentBase = document.querySelector("#base");
let base = 0;

//shipping
let currentShipping = document.querySelector("#shipping");
let shipping = 0;

//tax
let currentTax = document.querySelector("#tax")
let tax = 0;

//total
let currentTotal = document.querySelector("#total")
let total = 0;

function up(){
    quantity++;
    currentQuantity.innerHTML = quantity;
}

function down(){
    quantity--;
    currentQuantity.innerHTML = quantity;
    if(quantity < 0) {
        alert("Error! quantity constraint is 0");
        const constraint = 0;
        currentQuantity.innerHTML = constraint;
    }
}

function calculate() {
    base = quantity * onlyNum;
    currentBase.innerHTML = "$" + base;
    //if bill > @300 free shipping, else get 5% of base
    if(base > 300) {
        shipping = 0;
    } else {
        shipping = 5*(base)/100;
    }
    currentShipping.innerHTML = "$" + shipping;
    //tax equals 2% of base
    tax = 2*base/100;
    currentTax.innerHTML = "$" + tax;
    //total = base + tax + shipping
    total = base + tax + shipping;
    currentTotal.innerHTML = "$" + total;
}

function calculateFinalPrice() {
    
}



