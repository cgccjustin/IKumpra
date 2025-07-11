# IKumpra Backend API

A RESTful API for the IKumpra e-commerce platform, built with Node.js, Express, and MongoDB.

## 🚀 Features

- **Authentication**: JWT-based authentication with refresh tokens
- **User Management**: Customer and admin roles
- **Product Management**: CRUD operations for products with categories
- **Shopping Cart**: Add, update, remove items
- **Order Management**: Create, track, and manage orders
- **File Upload**: Image upload for products
- **Email Notifications**: Order confirmations and password reset
- **Security**: Rate limiting, CORS, helmet, input validation

## 📋 Prerequisites

- Node.js (v14 or higher)
- MongoDB (local or cloud)
- npm or yarn

## 🛠 Installation

1. **Clone the repository**
   ```bash
   cd backend
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Environment Setup**
   Create a `.env` file in the root directory:
   ```env
   # Server Configuration
   PORT=5000
   NODE_ENV=development

   # Database Configuration
   MONGODB_URI=mongodb://localhost:27017/ikumpra_db

   # JWT Configuration
   JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
   JWT_EXPIRE=7d
   JWT_REFRESH_SECRET=your-refresh-secret-key-change-this-too
   JWT_REFRESH_EXPIRE=30d

   # Email Configuration
   EMAIL_HOST=smtp.gmail.com
   EMAIL_PORT=587
   EMAIL_USER=your-email@gmail.com
   EMAIL_PASS=your-app-password

   # File Upload Configuration
   MAX_FILE_SIZE=5242880
   UPLOAD_PATH=./uploads

   # CORS Configuration
   CORS_ORIGIN=http://localhost:3000,http://localhost:8080

   # Rate Limiting
   RATE_LIMIT_WINDOW_MS=900000
   RATE_LIMIT_MAX_REQUESTS=100
   ```

4. **Start the server**
   ```bash
   # Development
   npm run dev

   # Production
   npm start
   ```

## 📚 API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user
- `POST /api/auth/logout` - Logout user
- `POST /api/auth/refresh` - Refresh token
- `POST /api/auth/forgot-password` - Forgot password
- `POST /api/auth/reset-password` - Reset password
- `GET /api/auth/me` - Get current user

### Products
- `GET /api/products` - Get all products (with filters)
- `GET /api/products/:id` - Get single product
- `GET /api/products/featured` - Get featured products
- `GET /api/products/search` - Search products
- `POST /api/products` - Create product (Admin)
- `PUT /api/products/:id` - Update product (Admin)
- `DELETE /api/products/:id` - Delete product (Admin)

### Cart
- `GET /api/cart` - Get user cart
- `GET /api/cart/summary` - Get cart summary
- `POST /api/cart/add` - Add item to cart
- `PUT /api/cart/update/:itemId` - Update cart item
- `DELETE /api/cart/remove/:itemId` - Remove item from cart
- `DELETE /api/cart/clear` - Clear cart

### Orders
- `POST /api/orders` - Create order
- `GET /api/orders` - Get user orders
- `GET /api/orders/:id` - Get single order
- `PUT /api/orders/:id/cancel` - Cancel order
- `GET /api/orders/admin/all` - Get all orders (Admin)
- `PUT /api/orders/:id/status` - Update order status (Admin)

### Users
- `GET /api/user/profile` - Get user profile
- `PUT /api/user/profile` - Update user profile
- `PUT /api/user/change-password` - Change password
- `GET /api/user/admin/all` - Get all users (Admin)
- `PUT /api/user/admin/:id` - Update user (Admin)
- `DELETE /api/user/admin/:id` - Delete user (Admin)

### File Upload
- `POST /api/upload` - Upload image

## 🔐 Authentication

The API uses JWT tokens for authentication. Include the token in the Authorization header:

```
Authorization: Bearer <your-jwt-token>
```

## 📊 Database Models

### User
- name, email, phone, password
- role (customer/admin)
- address, isActive
- refreshToken, passwordResetToken

### Product
- name, description, category
- price, unit, stock, freshness
- images, nutrition, tags
- isAvailable, isFeatured

### Cart
- user, items (array)
- totalItems, totalAmount

### Order
- user, orderNumber, items
- subtotal, deliveryFee, totalAmount
- status, paymentMethod, paymentStatus
- deliveryAddress, contactInfo

## 🛡 Security Features

- **Rate Limiting**: Prevents abuse
- **CORS**: Cross-origin resource sharing
- **Helmet**: Security headers
- **Input Validation**: Request validation
- **Password Hashing**: bcrypt
- **JWT**: Secure token-based auth

## 🧪 Testing

```bash
npm test
```

## 📝 Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| PORT | Server port | 5000 |
| NODE_ENV | Environment | development |
| MONGODB_URI | MongoDB connection | mongodb://localhost:27017/ikumpra_db |
| JWT_SECRET | JWT secret key | - |
| JWT_EXPIRE | JWT expiration | 7d |
| EMAIL_HOST | SMTP host | smtp.gmail.com |
| EMAIL_PORT | SMTP port | 587 |
| CORS_ORIGIN | Allowed origins | http://localhost:3000,http://localhost:8080 |

## 🚀 Deployment

1. Set environment variables
2. Install dependencies: `npm install`
3. Start server: `npm start`

## 📞 Support

For support, email support@ikumpra.com or create an issue in the repository.

## 📄 License

This project is licensed under the MIT License. 