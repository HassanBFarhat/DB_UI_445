const express = require('express');
const mysql = require('mysql2/promise');

const bodyParser = require('body-parser');

const cors = require('cors'); // Import the cors middleware

const app = express();
const PORT = 3000;

app.use(bodyParser.json());

// Enable CORS middleware
app.use(cors());

// Create a MySQL connection pool
const pool = mysql.createPool({
  host: 'localhost',
  user: 'admin',
  password: 'admin',
  database: 'farhat_hassan_and_bavisetty_avinash_db',
});

// Define an endpoint to fetch processors from the database
app.get('/api/getProcessors', async (req, res) => {
  try {
    // Fetch processors from the database
    const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [1]);
    res.json(rows);
  } catch (error) {
    console.error('Error fetching processors:', error);
    res.status(500).json({ error: 'Failed to fetch processors' });
  }
});

app.get('/api/getGPUs', async (req, res) => {
    try {
      // Fetch processors from the database
      const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [2]);
      res.json(rows);
    } catch (error) {
      console.error('Error fetching processors:', error);
      res.status(500).json({ error: 'Failed to fetch processors' });
    }
  });

  app.get('/api/getMemory', async (req, res) => {
    try {
      // Fetch processors from the database
      const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [3]);
      res.json(rows);
    } catch (error) {
      console.error('Error fetching processors:', error);
      res.status(500).json({ error: 'Failed to fetch processors' });
    }
  });

  app.get('/api/getStorage', async (req, res) => {
    try {
      // Fetch processors from the database
      const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [4]);
      res.json(rows);
    } catch (error) {
      console.error('Error fetching processors:', error);
      res.status(500).json({ error: 'Failed to fetch processors' });
    }
  });

  app.get('/api/getMOBOs', async (req, res) => {
    try {
      // Fetch processors from the database
      const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [5]);
      res.json(rows);
    } catch (error) {
      console.error('Error fetching processors:', error);
      res.status(500).json({ error: 'Failed to fetch processors' });
    }
  });

  app.get('/api/getPSUs', async (req, res) => {
    try {
      // Fetch processors from the database
      const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [6]);
      res.json(rows);
    } catch (error) {
      console.error('Error fetching processors:', error);
      res.status(500).json({ error: 'Failed to fetch processors' });
    }
  });

  app.get('/api/getCases', async (req, res) => {
    try {
      // Fetch processors from the database
      const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [7]);
      res.json(rows);
    } catch (error) {
      console.error('Error fetching processors:', error);
      res.status(500).json({ error: 'Failed to fetch processors' });
    }
  });

  app.get('/api/getCooling', async (req, res) => {
    try {
      // Fetch processors from the database
      const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [8]);
      res.json(rows);
    } catch (error) {
      console.error('Error fetching processors:', error);
      res.status(500).json({ error: 'Failed to fetch processors' });
    }
  });

  app.get('/api/getPeripherals', async (req, res) => {
    try {
      // Fetch processors from the database
      const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [9]);
      res.json(rows);
    } catch (error) {
      console.error('Error fetching processors:', error);
      res.status(500).json({ error: 'Failed to fetch processors' });
    }
  });

app.post('/api/addNewItem', async (req, res) => {
  try {
    // Check if all required properties are present in the request body
    const { CategoryID, Brand, ProductName, UnitPrice } = req.body;
    if (!CategoryID || !Brand || !ProductName || !UnitPrice) {
      return res.status(400).json({ error: 'Missing required fields' });
    }

    // Insert the new item into the database
    const connection = await pool.getConnection();
    await connection.execute(
        `INSERT INTO Product (CategoryID, Brand, ProductName, UnitPrice) VALUES (?, ?, ?, ?)`,
        [CategoryID, Brand, ProductName, UnitPrice]
    );
    connection.release();

    // Respond with success message
    return res.status(200).json({ message: 'Item added successfully' });
  } catch (error) {
    console.error('Error adding item:', error);
    return res.status(500).json({ error: 'Failed to add item' });
  }
});

app.post('/api/transactions', async (req, res) => {
  try {
    const { ProductID, Transaction, Quantity, TransactionDate } = req.body;
    if (!ProductID || !Transaction || !Quantity || !TransactionDate) {
      return res.status(400).json({ error: 'Missing required fields' });
    }

    // Perform the insert operation in the database
    const connection = await pool.getConnection();
    await connection.execute(
      'INSERT INTO Transaction (ProductID, Transaction, Quantity, TransactionDate) VALUES (?, ?, ?, ?)',
      [ProductID, Transaction, Quantity, TransactionDate]
    );
    connection.release();

    // Respond with success message
    res.status(200).json({ message: 'Transaction added successfully' });
  } catch (error) {
    console.error('Error adding transaction:', error);
    res.status(500).json({ error: 'Failed to add transaction' });
  }
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
