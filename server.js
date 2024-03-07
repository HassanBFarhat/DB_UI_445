/**
 * This file houses our Node.js server which will ultimately connect to our MySQL DB server
 * in order to utilize the DB by fetching data to be used or posting data to different
 * tables of the DB itself.
 * 
 * Authors: Hassan Farhat
 *          Avinash Bavisetty
 * Version: Winter 2024
 */

const express = require('express');
const mysql = require('mysql2/promise');
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();
const PORT = 3000;

app.use(bodyParser.json());
app.use(cors());

// This starts the MySQL connection pool
const pool = mysql.createPool({
  host: 'localhost',
  user: 'admin',
  password: 'admin',
  database: 'farhat_hassan_and_bavisetty_avinash_db',
});

// This endpoints GETS all the processors stored in our DB
app.get('/api/getProcessors', async (req, res) => {
  try {
    const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [1]);
    res.json(rows);
  } catch (error) {
    console.error('Error fetching processors:', error);
    res.status(500).json({ error: 'Failed to fetch processors' });
  }
});

// This endpoints GETS all the Graphics Cards stored in our DB
app.get('/api/getGPUs', async (req, res) => {
    try {
      const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [2]);
      res.json(rows);
    } catch (error) {
      console.error('Error fetching processors:', error);
      res.status(500).json({ error: 'Failed to fetch processors' });
    }
});

// This endpoints GETS all the Memory stored in our DB
app.get('/api/getMemory', async (req, res) => {
    try {
      const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [3]);
      res.json(rows);
    } catch (error) {
      console.error('Error fetching processors:', error);
      res.status(500).json({ error: 'Failed to fetch processors' });
    }
});

// This endpoints GETS all the Storage stored in our DB
app.get('/api/getStorage', async (req, res) => {
    try {
      const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [4]);
      res.json(rows);
    } catch (error) {
      console.error('Error fetching processors:', error);
      res.status(500).json({ error: 'Failed to fetch processors' });
    }
});

// This endpoints GETS all the Motherboards stored in our DB
app.get('/api/getMOBOs', async (req, res) => {
    try {
      const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [5]);
      res.json(rows);
    } catch (error) {
      console.error('Error fetching processors:', error);
      res.status(500).json({ error: 'Failed to fetch processors' });
    }
});

// This endpoints GETS all the Power Supplies stored in our DB
app.get('/api/getPSUs', async (req, res) => {
    try {
      const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [6]);
      res.json(rows);
    } catch (error) {
      console.error('Error fetching processors:', error);
      res.status(500).json({ error: 'Failed to fetch processors' });
    }
});

// This endpoints GETS all the Cases stored in our DB
app.get('/api/getCases', async (req, res) => {
    try {
      const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [7]);
      res.json(rows);
    } catch (error) {
      console.error('Error fetching processors:', error);
      res.status(500).json({ error: 'Failed to fetch processors' });
    }
});

// This endpoints GETS all the Cooling Items stored in our DB
app.get('/api/getCooling', async (req, res) => {
    try {
      const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [8]);
      res.json(rows);
    } catch (error) {
      console.error('Error fetching processors:', error);
      res.status(500).json({ error: 'Failed to fetch processors' });
    }
});

// This endpoints GETS all the Peripherals stored in our DB
app.get('/api/getPeripherals', async (req, res) => {
    try {
      const [rows, fields] = await pool.query('SELECT * FROM Product WHERE CategoryID = ?', [9]);
      res.json(rows);
    } catch (error) {
      console.error('Error fetching processors:', error);
      res.status(500).json({ error: 'Failed to fetch processors' });
    }
});

// This endpoints POSTS the new item that was added to our store's DB
app.post('/api/addNewItem', async (req, res) => {
  try {
    const { CategoryID, Brand, ProductName, UnitPrice } = req.body;
    if (!CategoryID || !Brand || !ProductName || !UnitPrice) {
      return res.status(400).json({ error: 'Missing required fields' });
    }
    const connection = await pool.getConnection();
    await connection.execute(
        `INSERT INTO Product (CategoryID, Brand, ProductName, UnitPrice) VALUES (?, ?, ?, ?)`,
        [CategoryID, Brand, ProductName, UnitPrice]
    );
    connection.release();
    return res.status(200).json({ message: 'Item added successfully' });
  } catch (error) {
    console.error('Error adding item:', error);
    return res.status(500).json({ error: 'Failed to add item' });
  }
});

// This endpoints POSTS the transactions made from each item a user buys from our DB
app.post('/api/transactions', async (req, res) => {
  try {
    const { ProductID, Transaction, Quantity, TransactionDate } = req.body;
    if (!ProductID || !Transaction || !Quantity || !TransactionDate) {
      return res.status(400).json({ error: 'Missing required fields' });
    }
    const connection = await pool.getConnection();
    await connection.execute(
      'INSERT INTO Transaction (ProductID, Transaction, Quantity, TransactionDate) VALUES (?, ?, ?, ?)',
      [ProductID, Transaction, Quantity, TransactionDate]
    );
    connection.release();
    res.status(200).json({ message: 'Transaction added successfully' });
  } catch (error) {
    console.error('Error adding transaction:', error);
    res.status(500).json({ error: 'Failed to add transaction' });
  }
});

// This starts the node.js server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
