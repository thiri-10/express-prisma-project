// const { PrismaClient } = require("@prisma/client");
// const prisma = new PrismaClient();

// const { Prisma } = require("@prisma/client");
const prisma = require("../db/prisma");





const customerController = {
    getCustomers: async function getCustomers(req, res) {
        try {
            const customers = await prisma.customer.findMany();
            res.json(customers);
        } catch (err) {
            res.status(500).json({ error: err.message });
        }



    },
    createCustomer: async function createCustomer(req, res) {
        const { name, phno, address, email } = req.body;
        const customer = await prisma.customer.create({
            data: { name, phno, address, email }
        });
        return res.json(customer);
    }
}
module.exports = customerController;