"use strict";

const express = require("express");
const path = require("path");
const mysql = require("mysql2/promise");
const dbConfig = require("./config/dbConfig");

const app = express();

app.use(express.static(path.join(__dirname, "public")));
app.use(express.json());

app.post("/movies", async (req, res) => {
    let connection;
    try {
        // Create a MariaDB connection
        connection = await mysql.createConnection(dbConfig);

        // Directly interpolate user input into the query string (vulnerable to SQL injection)
        const query = `SELECT * FROM Movie WHERE Title LIKE "%${req.body.title}%"`;
        console.log(query);
        const [result] = await connection.query(query);

        if (result.length === 0) {
            res.status(404).json({
                message: "No Movie Found"
            });
        } else {
            res.status(200).json(result);
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({
            message: "Internal Server Error"
        });
    } finally {
        if (connection) {
            connection.end();
        }
    }
});

app.use((req, res) => {
    res.sendFile(path.join(__dirname, "public", "404.html"));
});

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Listening on port ${port}`));

