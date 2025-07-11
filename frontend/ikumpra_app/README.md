# IKumpra Flutter App

A modern e-commerce mobile application for selling fresh vegetables and fish, built with Flutter.

## 🚀 Features

- **Authentication**: Secure login/register with JWT tokens
- **Product Browsing**: Browse products with search and filters
- **Shopping Cart**: Add, update, and manage cart items
- **Order Management**: Place orders and track their status
- **User Profile**: Manage personal information and addresses
- **Real-time Updates**: Live order status updates
- **Offline Support**: Basic offline functionality
- **Push Notifications**: Order updates and promotions

## 📱 Screenshots

*Screenshots will be added here*

## 🛠 Tech Stack

- **Framework**: Flutter 3.x
- **State Management**: Riverpod
- **HTTP Client**: Dio
- **Local Storage**: SharedPreferences, Hive
- **Navigation**: GoRouter
- **UI Components**: Material Design 3
- **Fonts**: Google Fonts (Poppins)
- **Images**: Cached Network Image

## 📋 Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- Android SDK / Xcode (for mobile development)

## 🛠 Installation

1. **Clone the repository**
   ```bash
   cd frontend/ikumpra_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # For Android
   flutter run

   # For iOS
   flutter run -d ios

   # For web
   flutter run -d chrome
   ```

## 📁 Project Structure

```
lib/
├── config/
│   ├── api_constants.dart
│   └── app_constants.dart
├── models/
│   ├── user.dart
│   ├── product.dart
│   ├── cart.dart
│   └── order.dart
├── screens/
│   ├── splash_screen.dart
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── register_screen.dart
│   ├── home/
│   │   ├── home_screen.dart
│   │   └── product_detail_screen.dart
│   ├── cart/
│   │   └── cart_screen.dart
│   ├── orders/
│   │   ├── orders_screen.dart
│   │   └── order_detail_screen.dart
│   └── profile/
│       └── profile_screen.dart
├── widgets/
│   ├── common/
│   │   ├── loading_widget.dart
│   │   └── error_widget.dart
│   ├── product/
│   │   └── product_card.dart
│   └── cart/
│       └── cart_item_widget.dart
├── services/
│   ├── api_service.dart
│   ├── auth_service.dart
│   ├── product_service.dart
│   ├── cart_service.dart
│   └── order_service.dart
├── providers/
│   ├── auth_provider.dart
│   ├── cart_provider.dart
│   └── product_provider.dart
├── utils/
│   ├── helpers.dart
│   └── validators.dart
└── main.dart
```

## 🔧 Configuration

### API Configuration

Update the API base URL in `lib/config/api_constants.dart`:

```dart
static const String baseUrl = 'http://your-api-domain.com/api';
```

### Environment Variables

Create a `.env` file in the project root (if needed):

```env
API_BASE_URL=http://localhost:5000/api
```

## 📱 App Features

### Authentication
- User registration with email and phone
- Secure login with JWT tokens
- Password reset functionality
- Profile management

### Product Browsing
- Product listing with categories
- Search functionality
- Filter by price, category, freshness
- Product details with images
- Add to cart functionality

### Shopping Cart
- Add/remove items
- Update quantities
- Cart summary
- Checkout process

### Order Management
- Place orders
- Order tracking
- Order history
- Order cancellation

### User Profile
- Personal information
- Address management
- Order history
- Settings

## 🎨 UI/UX Features

- **Material Design 3**: Modern UI components
- **Responsive Design**: Works on all screen sizes
- **Dark/Light Theme**: Theme switching support
- **Animations**: Smooth transitions and animations
- **Loading States**: Proper loading indicators
- **Error Handling**: User-friendly error messages

## 🔐 Security Features

- **JWT Authentication**: Secure token-based auth
- **Input Validation**: Form validation
- **Secure Storage**: Encrypted local storage
- **HTTPS**: Secure API communication

## 📊 State Management

The app uses Riverpod for state management:

- **AuthProvider**: Manages authentication state
- **CartProvider**: Manages shopping cart
- **ProductProvider**: Manages product data
- **OrderProvider**: Manages order data

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run widget tests
flutter test test/widget_test.dart

# Run integration tests
flutter drive --target=test_driver/app.dart
```

## 📦 Building

### Android APK
```bash
flutter build apk --release
```

### iOS IPA
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## 🚀 Deployment

### Android
1. Build the APK: `flutter build apk --release`
2. Upload to Google Play Console

### iOS
1. Build the IPA: `flutter build ios --release`
2. Upload to App Store Connect

### Web
1. Build for web: `flutter build web --release`
2. Deploy to hosting service (Firebase, Netlify, etc.)

## 📝 Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| API_BASE_URL | Backend API URL | http://localhost:5000/api |

## 🔧 Development

### Code Style
- Follow Flutter/Dart conventions
- Use meaningful variable names
- Add comments for complex logic
- Keep functions small and focused

### Git Workflow
1. Create feature branch
2. Make changes
3. Write tests
4. Submit pull request

## 📞 Support

For support, email support@ikumpra.com or create an issue in the repository.

## 📄 License

This project is licensed under the MIT License.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## 📚 Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Riverpod Documentation](https://riverpod.dev/)
- [Material Design](https://material.io/design)
- [Dart Language](https://dart.dev/guides)
