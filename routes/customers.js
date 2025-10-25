var express = require('express');
const { getCustomers,createCustomer } = require('../controllers/customerController.js');
var router = express.Router();

/* GET users listing. */
router.get('/',getCustomers);
router.post('/',createCustomer);

module.exports = router;
