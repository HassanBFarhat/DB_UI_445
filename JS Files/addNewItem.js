// This will retrieve the data from the webpage and add the new item to the store DB
function addItemToStore() {
    var category = $("#category").val();
    var brand = $("#brand").val();
    var productName = $("#productName").val();
    var price = $("#price").val();

    var requestData = {
        CategoryID: category,
        Brand: brand,
        ProductName: productName,
        UnitPrice: price,
    };

    // Make an HTTP POST Request to add the new item to the MySQL DB
    $.ajax({
        url: "http://localhost:3000/api/addNewItem",
        type: "POST",
        data: JSON.stringify(requestData),
        contentType: "application/json",
        success: function (response) {
            alert("Item added successfully.");
            window.location.href = "index.html";
        },
        error: function (xhr, status, error) {
            console.error("Error adding item:", error);
            alert(
                "An error occurred while adding the item. Please try again later."
            );
        },
    });
};