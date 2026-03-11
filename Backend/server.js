const express = require("express");
const cors = require("cors");

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.send("HealthCost Navigator API is running");
});

app.get("/services", (req, res) => {
  res.json([
    { id: 1, service: "GP Consultation" },
    { id: 2, service: "Physiotherapy" },
    { id: 3, service: "Dental Cleaning" }
  ]);
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
