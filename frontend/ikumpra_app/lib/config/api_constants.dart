class ApiConstants {
  // Base URL
  static const String baseUrl = 'http://localhost:5000/api';
  
  // Auth endpoints
  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';
  static const String me = '/auth/me';
  
  // Product endpoints
  static const String products = '/products';
  static const String featuredProducts = '/products/featured';
  static const String searchProducts = '/products/search';
  
  // Cart endpoints
  static const String cart = '/cart';
  static const String cartSummary = '/cart/summary';
  static const String addToCart = '/cart/add';
  static const String updateCartItem = '/cart/update';
  static const String removeFromCart = '/cart/remove';
  static const String clearCart = '/cart/clear';
  
  // Order endpoints
  static const String orders = '/orders';
  static const String adminOrders = '/orders/admin/all';
  static const String updateOrderStatus = '/orders/status';
  
  // User endpoints
  static const String userProfile = '/user/profile';
  static const String changePassword = '/user/change-password';
  static const String adminUsers = '/user/admin/all';
  
  // Upload endpoints
  static const String upload = '/upload';
  
  // Headers
  static const String authorizationHeader = 'Authorization';
  static const String contentTypeHeader = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String multipartFormData = 'multipart/form-data';
  
  // Timeouts
  static const int connectTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
  
  // Pagination
  static const int defaultPageSize = 10;
  
  // File upload
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'webp'];
} 