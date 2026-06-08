const express = require('express');

const app = express();
const port = Number(process.env.PORT || 3000);

app.get('/', (_req, res) => {
	res.send('Put Your Application Here!');
});

app.listen(port, '0.0.0.0', () => {
	console.log(`Express listening on ${port}`);
});
