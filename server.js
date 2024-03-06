const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors'); // Import the cors middleware

const app = express();
const PORT = 3000;

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

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
