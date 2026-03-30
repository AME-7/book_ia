abstract class Apis {
  static const baseUrl = 'https://codingarabic.online/api';
  // auth
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forget-password';
  static const checkForgetPassword = '/check-forget-password';
  // home
  static const sliders = '/sliders';
  static const productsBestseller = '/products-bestseller';
  static const search = '/products-search';

  // wishlist
  static const wishlist = '/wishlist';
  static const addTowishlist = '/add-to-wishlist';
  static const removeFromwishlist = '/remove-from-wishlist';

  // cart

  static const cart = '/cart';
  static const addToCart = '/add-to-cart';
  static const removeFromCart = '/remove-from-cart';
  static const updateCart = '/update-cart';
  static const checkout = '/checkout';

  // place order
  static const governorates = '/governorates';

  // profile
  static const profile = '/profile';
  static const updateProfile = '/update-profile';
  static const updatePassword = '/update-password';
}
