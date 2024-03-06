const mysql = require('Farhat_Hassan_&_Bavisetty_Avinash_queries.sql');

// Create a connection pool
const pool = mysql.createPool({
    host: 'localhost',
    user: 'admin',
    password: 'admin',
    database: 'Farhat_Hassan_And_Bavisetty_Avinash_db',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// i) Add Product
async function addProduct(categoryID, brand, productName) {
    try {
        const connection = await pool.promise().getConnection();
        const [rows, fields] = await connection.execute('CALL AddProduct(?, ?, ?)', [categoryID, brand, productName]);
        connection.release();
        return rows;
    } catch (error) {
        throw error;
    }
}

// ii) Place Order
async function placeOrder(customerID, orderDate, deliveryStatus) {
    try {
        const connection = await pool.promise().getConnection();
        const [rows, fields] = await connection.execute('CALL PlaceOrder(?, ?, ?)', [customerID, orderDate, deliveryStatus]);
        connection.release();
        return rows;
    } catch (error) {
        throw error;
    }
}

// iii) Track Inventory (Not implemented here as it involves a trigger)

// iv) Process Transactions
async function processTransaction(productID, transactionType, quantity, transactionDate) {
    try {
        const connection = await pool.promise().getConnection();
        const [rows, fields] = await connection.execute('CALL ProcessTransaction(?, ?, ?, ?)', [productID, transactionType, quantity, transactionDate]);
        connection.release();
        return rows;
    } catch (error) {
        throw error;
    }
}

// v) Generate Reports
// Implemented as regular SQL queries, not stored procedures

// vi) Manage Warranties
async function manageWarranties() {
    try {
        const connection = await pool.promise().getConnection();
        const [rows, fields] = await connection.execute('SELECT * FROM Warranty');
        connection.release();
        return rows;
    } catch (error) {
        throw error;
    }
}

// vii) Customer Feedback
async function customerFeedback() {
    try {
        const connection = await pool.promise().getConnection();
        const [rows, fields] = await connection.execute('SELECT * FROM Feedback');
        connection.release();
        return rows;
    } catch (error) {
        throw error;
    }
}

// Analytical Queries
// Not implemented here as they are regular SQL queries, not stored procedures

// // Example usage
// async function example() {
//     try {
//         // Add a product
//         await addProduct(1, 'Brand Name', 'Product Name');

//         // Place an order
//         await placeOrder(1, '2024-03-04', 1);

//         // Process a transaction
//         await processTransaction(1, 'purchase', 10, '2024-03-04');

//         // Retrieve warranties
//         const warranties = await manageWarranties();
//         console.log('Warranties:', warranties);

//         // Retrieve customer feedback
//         const feedback = await customerFeedback();
//         console.log('Feedback:', feedback);
//     } catch (error) {
//         console.error('Error:', error);
//     }
// }

// // Call the example function
// example();
