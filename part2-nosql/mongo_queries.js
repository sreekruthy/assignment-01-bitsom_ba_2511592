//connect to database
use("product_catalog");

// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    _id: "E1001",
    name: "iPhone 14",
    category: "Electronics",
    price: 75000,
    brand: "Apple",
    specifications: {
      storage: "128GB",
      ram: "6GB",
      battery: "3279mAh",
      voltage: "5V"
    },
    warranty: {
      period: "1 year",
      type: "manufacturer"
    },
    ratings: [5, 4, 5, 4]
  },
  {
    _id: "E1002",
    name: "Samsung Smart TV",
    category: "Electronics",
    price: 45000,
    brand: "Samsung",
    specifications: {
      screen_size: "55 inch",
      resolution: "4K",
      voltage: "220V"
    },
    warranty: {
      period: "2 years",
      type: "manufacturer"
    },
    ratings: [4, 4, 5]
  },
  {
    _id: "C2001",
    name: "Men's Casual Shirt",
    category: "Clothing",
    price: 1200,
    brand: "Levis",
    sizes: ["S", "M", "L", "XL"],
    material: "Cotton",
    color: "Blue",
    care_instructions: {
      wash: "Machine wash",
      dry: "Do not tumble dry"
    }
  },
  {
    _id: "G3001",
    name: "Amul Milk 1L",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry_date: new Date("2024-12-20"),
    manufacture_date: new Date("2024-12-15"),
    nutritional_info: {
      calories: 42,
      protein: "3.4g",
      fat: "1g"
    },
    storage: "Keep refrigerated"
  },
  {
    _id: "G3002",
    name: "Brown Bread",
    category: "Groceries",
    price: 45,
    brand: "Harvest Gold",
    expiry_date: new Date("2024-12-25"),
    manufacture_date: new Date("2024-12-18"),
    nutritional_info: {
      calories: 265,
      fiber: "7g",
      carbohydrates: "49g"
    },
    ingredients: ["Wheat flour", "Water", "Yeast", "Salt"]
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { _id: "E1002" },
  { $set: { discount_percent: 13 } }
);

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });
/* Explanation: Indexing "category" field improves query performance for find 
operations because many queries filter products by category (Clothing, Electronics, 
Groceries). Without an index, MongoDB performs a full collection scan, which is 
slow for large datasets. With an index, it can quickly locate documents matching 
to the specific category.*/