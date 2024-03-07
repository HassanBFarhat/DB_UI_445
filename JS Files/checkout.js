// When user clicks on "submit transaction" final alert goes to user letting
// them know that their transaction was processed accordingly.
function submitTransaction() {
    var firstName = document.getElementById("firstName").value;
    var lastName = document.getElementById("lastName").value;
    var phone = document.getElementById("phone").value;
    alert(
      "Transaction processed successfully for " + firstName + " " + lastName
    );

    window.location.href = "index.html";
};