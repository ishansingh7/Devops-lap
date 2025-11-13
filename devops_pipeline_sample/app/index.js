const express = require('express');
const client = require('prom-client');

const app = express();
const register = client.register;

// Default metrics collection
client.collectDefaultMetrics();

// Custom counter example
const requestCounter = new client.Counter({
  name: 'app_requests_total',
  help: 'Total number of requests',
  labelNames: ['method','route','status']
});

app.get('/', (req, res) => {
  requestCounter.inc({method: req.method, route: '/', status: 200});
  res.send('Hello from sample app!');
});

// Health endpoint
app.get('/health', (req, res) => {
  res.json({status: 'ok'});
});

// Prometheus metrics endpoint
app.get('/metrics', async (req, res) => {
  try {
    res.set('Content-Type', register.contentType);
    res.end(await register.metrics());
  } catch (ex) {
    res.status(500).end(ex);
  }
});

const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`App listening on port ${PORT}`);
});
