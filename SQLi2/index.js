
const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2');
const path = require('path');
const dotenv = require('dotenv').config();

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));

// Serve static files from the 'public' directory
app.use(express.static(path.join(__dirname, 'public')));

console.log(process.env.DB_SERVER, process.env.DB_USER, process.env.DB_PASSWORD, process.env.DB_NAME);
// MySQL connection
const connection = mysql.createConnection({
    host: process.env.DB_SERVER,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD, // Your MySQL password
    database: process.env.DB_NAME
});

// Connect to database
connection.connect((err) => {
    if (err) throw err;
    console.log('Connected to the database');
});

// Serve the HTML file on '/'
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Save preference logic (same as before)
app.post('/set-preference', (req, res) => {
    const { filter_column, filter_value } = req.body;
    console.log(filter_column, filter_value);
    const userId = 1; // For simplicity, assume the user is always user_id=1

    const checkQuery = `SELECT * FROM preferences WHERE user_id = ?`;
    connection.execute(checkQuery, [userId], (err, results) => {
        if (err) throw err;

        if (results.length > 0) {
            const updateQuery = `UPDATE preferences SET filter_column = ?, filter_value = ? WHERE user_id = ?`;
            connection.execute(updateQuery, [filter_column, filter_value, userId], (err) => {
                if (err) throw err;
                res.send('Preference updated');
            });
        } else {
            const insertQuery = `INSERT INTO preferences (user_id, filter_column, filter_value) VALUES (?, ?, ?)`;
            connection.execute(insertQuery, [userId, filter_column, filter_value], (err) => {
                if (err) throw err;
                res.send('Preference saved');
            });
        }
    });
});


app.get('/dogs', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'dogs.html'));
});

app.get('/view-dogs', (req, res) => {
    const userId = 1; // For simplicity, assume the user is always user_id=1

    const query = `SELECT filter_column, filter_value FROM preferences WHERE user_id = ?`;
    connection.execute(query, [userId], (err, results) => {
        if (err) throw err;

        const { filter_column, filter_value } = results[0];
        const dogQuery = `SELECT * FROM dogs WHERE ${filter_column} = ?`; // Use parameterized queries to prevent SQL injection
        console.log(dogQuery);

        connection.query(dogQuery, [filter_value], (err, dogs) => {
            if (err) throw err;

            // Send the filtered dogs data as JSON
            res.json(dogs);
        });
    });
});


// Start the server
app.listen(3000, () => {
    console.log('Server is running on port 3000');
});
