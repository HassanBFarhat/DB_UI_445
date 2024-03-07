// This function takes care of when the user presses the check out button, this will
// take all the products the user has selected to purchase and use an HTTP POST request
// to send those items to the transactions table of the DB, waiting for final purchase/check.
function checkOut() {
    const cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];
    const transactionRequests = [];
  
    cartItems.forEach((item) => {
      const transactionData = {
        ProductID: item.index,
        Transaction: "Purchase",
        Quantity: 1,
        TransactionDate: new Date().toISOString().split("T")[0],
      };
  
      transactionRequests.push(
        $.ajax({
          url: "http://localhost:3000/api/transactions",
          method: "POST",
          data: JSON.stringify(transactionData),
          contentType: "application/json",
          success: function (response) {
            console.log("Transaction added successfully.");
          },
          error: function (xhr, status, error) {
            console.error("Error adding transaction:", error);
            alert(
              "An error occurred while adding the transaction. Please try again later."
            );
          },
        })
      );
    });
  
    $.when
      .apply($, transactionRequests)
      .then(() => {
        localStorage.removeItem("cartItems");
        alert("Transactions added successfully!");
        window.location.href = "checkout.html";
      })
      .fail((xhr, status, error) => {
        console.error("Error processing transactions:", error);
        alert(
          "An error occurred while processing transactions. Please try again later."
        );
      });
};

// This function is used to help display the items selected from the home page 
// (getting the locally stored data) and displaying them in the cart respectively
function displayCartItems() {
    let total = 0;
    const cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];
    const cartTableBody = document.getElementById("cart-items");
    cartTableBody.innerHTML = "";

    cartItems.forEach((item) => {
      const row = document.createElement("tr");
      total += parseInt(item.id);
      row.innerHTML = `
      <td>${item.name}</td>
      <td>$${item.id}</td>
      <td>1</td>
    `;
      cartTableBody.appendChild(row);
    });
    const totalPriceElement = document.getElementById("total-price");
    totalPriceElement.textContent = `TOTAL: $${total}`;
};

window.onload = displayCartItems;