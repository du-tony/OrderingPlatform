// Importing necessary modules
require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const helmet = require('helmet');
// error handler
const notFoundMiddleware = require('./middleware/not-found');
const errorHandlerMiddleware = require('./middleware/error-handler');

// Create an Express app
const app = express();

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(helmet());


const authRoutes = require('./routes/authRoute');
const dashRoutes = require('./routes/dashboardRoute')

// Use routes
app.use('/api/auth', authRoutes);
app.use('/api/dashboard', dashRoutes )

app.get('/', (req, res) => {
  res.status(200).json({ message: 'Welcome to OrderingPlatform backend.' });
});

// middleware
app.use(notFoundMiddleware);
app.use(errorHandlerMiddleware);

// Set the server to listen on a port
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
