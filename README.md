# Amaflip 🛒

A modern e-commerce mobile application built with Flutter and Firebase, featuring secure payment processing, user management, and a comprehensive admin panel.


## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Screenshots](#screenshots)
- [Technologies Used](#technologies-used)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Admin Panel](#admin-panel)
- [Payment Integration](#payment-integration)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## 🎯 Overview

Amaflip is a full-featured e-commerce mobile application that provides a seamless shopping experience for users and powerful management tools for administrators. Built with Flutter for cross-platform compatibility and Firebase for robust backend services, the app includes secure payment processing through Stripe and a comprehensive admin dashboard.

### Why Choose Amaflip?

- 📱 **Cross-Platform** - Single codebase for iOS and Android
- 🔥 **Firebase Backend** - Real-time database and authentication
- 💳 **Secure Payments** - Integrated Stripe payment gateway
- 👨‍💼 **Admin Control** - Comprehensive admin panel for management
- 🚀 **Fast Performance** - Optimized Flutter UI with smooth animations

## ✨ Features

### 👤 **User Features**
- **User Authentication** - Secure login and signup with Firebase Auth
- **Profile Management** - Complete profile customization and editing
- **Product Browsing** - Browse products by categories and search
- **Shopping Cart** - Add, remove, and manage cart items
- **Secure Checkout** - Stripe-powered payment processing
- **Order History** - View past purchases and order status
- **User Dashboard** - Personalized user experience
- **Wishlist** - Save favorite products for later

### 🛡️ **Admin Features**
- **Admin Dashboard** - Comprehensive admin panel
- **Product Management** - Add, edit, and delete products
- **Order Management** - View and manage customer orders
- **User Management** - Monitor and manage user accounts
- **Inventory Control** - Track product stock and availability
- **Sales Analytics** - View sales reports and statistics
- **Category Management** - Organize products into categories

### 🔒 **Security & Performance**
- **Firebase Security Rules** - Secure data access control
- **Input Validation** - Client and server-side validation
- **Secure Payment Processing** - PCI-compliant Stripe integration
- **Real-time Updates** - Live data synchronization
- **Offline Support** - Basic offline functionality
- **Cross-platform Compatibility** - Works on iOS and Android

## 📸 Screenshots

### User App
#### Authentication Screens
| Signup Screen | 
|:---:|
<p align="center">![Signup Screen](https://github.com/prashant000000004/Amaflip/blob/76bfe93b9ffea3ac9cc280e43cd260a09589f9b7/a1.jpeg)</p>



#### Main App Screens
| Home Screen | Product Details | Shopping Cart | Profile Page |
|:---:|:---:|:---:|:---:|
<p align="center"> <img src="https://github.com/prashant000000004/Amaflip/blob/76bfe93b9ffea3ac9cc280e43cd260a09589f9b7/a3.jpeg" width="50" alt="Home Screen">
  &nbsp;&nbsp;&nbsp;
<img src="https://github.com/prashant000000004/Amaflip/blob/76bfe93b9ffea3ac9cc280e43cd260a09589f9b7/a11.png" width="50" alt="Product Details">
  &nbsp;&nbsp;&nbsp;
<img src="https://github.com/prashant000000004/Amaflip/blob/76bfe93b9ffea3ac9cc280e43cd260a09589f9b7/a5.jpeg" width="50" alt="Shopping Cart">
  &nbsp;&nbsp;&nbsp;
<img src="https://github.com/prashant000000004/Amaflip/blob/76bfe93b9ffea3ac9cc280e43cd260a09589f9b7/a6.jpeg" width="50" alt="Profile Page"><p>


#### Payment
| Payment Screen | Payment Successfull|
|:---:|:---:|
![Payment Screen](https://github.com/prashant000000004/Amaflip/blob/76bfe93b9ffea3ac9cc280e43cd260a09589f9b7/a10.png)
![Payment Successfull](https://github.com/prashant000000004/Amaflip/blob/76bfe93b9ffea3ac9cc280e43cd260a09589f9b7/a9.png)



### Admin Panel
| Admin Dashboard | Order Managment|
|:---:|:---:|
| ![Admin Dashboard](https://github.com/prashant000000004/Amaflip/blob/76bfe93b9ffea3ac9cc280e43cd260a09589f9b7/a7.jpeg) |
![Order Management](https://github.com/prashant000000004/Amaflip/blob/76bfe93b9ffea3ac9cc280e43cd260a09589f9b7/a8.jpeg) |


## 🛠️ Technologies Used

### **Frontend**
- **Flutter** - Cross-platform mobile framework
- **Dart** - Programming language
- **Material Design** - UI/UX design system
- **Provider** / **Bloc** - State management (specify which you used)

### **Backend & Database**
- **Firebase** - Backend-as-a-Service platform
  - **Firebase Auth** - User authentication
  - **Cloud Firestore** - NoSQL database
  - **Firebase Storage** - File storage for images
  - **Firebase Hosting** - Web hosting (if admin panel is web-based)
  - **Cloud Functions** - Serverless functions (if used)

### **Payment Processing**
- **Stripe** - Payment gateway integration
- **Stripe SDK for Flutter** - Mobile payment processing

### **Development Tools**
- **Android Studio** / **VS Code** - IDE
- **Firebase CLI** - Firebase command-line tools
- **Git** - Version control
- **Flutter DevTools** - Debugging and profiling

## 📋 Prerequisites

Before running this application, ensure you have:

- **Flutter SDK** (v3.0.0 or higher)
- **Dart SDK** (v2.17.0 or higher)
- **Android Studio** / **Xcode** (for mobile development)
- **Firebase CLI** - For Firebase configuration
- **Git** - Version control
- **Stripe Account** - For payment processing

### **System Requirements:**
- **For Android:** Android SDK 21+ (Android 5.0+)
- **For iOS:** iOS 11.0+
- **RAM:** 8GB minimum (recommended)
- **Storage:** 3GB free space

## 🚀 Installation

### 1. Clone the Repository
```bash
git clone https://github.com/prashant000000004/Amaflip.git
cd Amaflip
```

### 2. Install Flutter Dependencies
```bash
# Get Flutter packages
flutter pub get

# For iOS (if developing on macOS)
cd ios && pod install && cd ..
```

### 3. Firebase Setup
```bash
# Install Firebase CLI (if not already installed)
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize Firebase in your project
firebase init
```

### 4. Configure Firebase
- Create a new Firebase project at [Firebase Console](https://console.firebase.google.com)
- Enable Authentication, Firestore, and Storage
- Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
- Place them in the appropriate directories:
  - `android/app/google-services.json`
  - `ios/Runner/GoogleService-Info.plist`

### 5. Configure Stripe
- Create a Stripe account at [stripe.com](https://stripe.com)
- Get your publishable and secret keys
- Add them to your environment configuration

### 6. Run the Application
```bash
# Check connected devices
flutter devices

# Run on connected device/emulator
flutter run

# Build for production
flutter build apk --release  # Android
flutter build ios --release  # iOS
```

## ⚙️ Configuration

### **Firebase Configuration**

#### 1. Firebase Rules (Firestore Security Rules)
```javascript
// firestore.rules
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can read/write their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Products are readable by all, writable by admin only
    match /products/{productId} {
      allow read: if true;
      allow write: if request.auth != null && 
        get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'admin';
    }
    
    // Orders are readable/writable by owner and admin
    match /orders/{orderId} {
      allow read, write: if request.auth != null && 
        (request.auth.uid == resource.data.userId || 
         get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'admin');
    }
  }
}
```

### **Environment Configuration**

Create a `lib/config/config.dart` file:
```dart
class Config {
  // Stripe Configuration
  static const String stripePublishableKey = 'pk_test_your_stripe_publishable_key';
  static const String stripeSecretKey = 'sk_test_your_stripe_secret_key';
  
  // App Configuration
  static const String appName = 'Amaflip';
  static const String appVersion = '1.0.0';
  
  // Firebase Configuration (auto-configured via google-services files)
  
  // Admin Configuration
  static const List<String> adminEmails = [
    'admin@amaflip.com',
    'prashant@amaflip.com',
  ];
}
```

### **Stripe Configuration**

Add to `pubspec.yaml`:
```yaml
dependencies:
  stripe_payment: ^1.1.4
  # or
  flutter_stripe: ^9.1.2
```

## 🎮 Usage

### **For End Users:**

#### 1. **Account Management**
- Sign up with email and password
- Log in to existing account
- Update profile information
- Change profile picture

#### 2. **Shopping Experience**
- Browse products by categories
- Search for specific items
- View detailed product information
- Add products to cart
- Manage wishlist items

#### 3. **Checkout Process**
- Review cart items
- Enter shipping information
- Select payment method
- Complete purchase with Stripe
- Receive order confirmation

#### 4. **Order Management**
- View order history
- Track order status
- Contact support if needed

### **For Administrators:**

#### 1. **Access Admin Panel**
- Log in with admin credentials
- Access admin dashboard

#### 2. **Product Management**
- Add new products with images
- Edit existing product details
- Manage product categories
- Control inventory levels

#### 3. **Order Management**
- View all customer orders
- Update order status
- Process refunds if needed

#### 4. **User Management**
- View registered users
- Manage user roles
- Handle customer support

## 👨‍💼 Admin Panel

The admin panel provides comprehensive management tools:

### **Dashboard Features:**
- **Sales Overview** - Today's sales, monthly revenue
- **Order Statistics** - Pending, completed, cancelled orders
- **User Metrics** - New registrations, active users
- **Product Insights** - Top-selling products, low stock alerts

### **Management Modules:**
- **Product Management** - CRUD operations for products
- **Category Management** - Organize product categories
- **Order Processing** - Handle customer orders
- **User Administration** - Manage user accounts
- **Content Management** - Update app content

### **Access Control:**
- Role-based permissions
- Secure admin authentication
- Activity logging and audit trails

## 💳 Payment Integration

### **Stripe Integration Features:**
- **Secure Card Processing** - Handle credit/debit cards
- **Multiple Payment Methods** - Cards, digital wallets
- **Real-time Validation** - Instant payment verification
- **Refund Management** - Process refunds through admin panel
- **Transaction History** - Complete payment records

### **Payment Flow:**
1. User adds items to cart
2. Proceeds to checkout
3. Enters payment information
4. Stripe processes payment securely
5. Order confirmation and receipt
6. Admin receives order notification

## 📁 Project Structure

```
Amaflip/
├── lib/
│   ├── config/                 # Configuration files
│   │   ├── config.dart
│   │   └── firebase_config.dart
│   ├── models/                 # Data models
│   │   ├── user_model.dart
│   │   ├── product_model.dart
│   │   ├── order_model.dart
│   │   └── cart_model.dart
│   ├── screens/                # UI screens
│   │   ├── auth/               # Authentication screens
│   │   │   ├── login_screen.dart
│   │   │   └── signup_screen.dart
│   │   ├── home/               # Home and main screens
│   │   │   ├── home_screen.dart
│   │   │   ├── product_detail_screen.dart
│   │   │   └── category_screen.dart
│   │   ├── profile/            # User profile screens
│   │   │   ├── profile_screen.dart
│   │   │   └── edit_profile_screen.dart
│   │   ├── cart/               # Shopping cart screens
│   │   │   ├── cart_screen.dart
│   │   │   └── checkout_screen.dart
│   │   ├── orders/             # Order management screens
│   │   │   ├── order_history_screen.dart
│   │   │   └── order_detail_screen.dart
│   │   └── admin/              # Admin panel screens
│   │       ├── admin_dashboard.dart
│   │       ├── manage_products.dart
│   │       ├── manage_orders.dart
│   │       └── manage_users.dart
│   ├── services/               # Business logic services
│   │   ├── auth_service.dart
│   │   ├── database_service.dart
│   │   ├── payment_service.dart
│   │   └── storage_service.dart
│   ├── providers/              # State management
│   │   ├── auth_provider.dart
│   │   ├── cart_provider.dart
│   │   ├── product_provider.dart
│   │   └── order_provider.dart
│   ├── widgets/                # Reusable UI components
│   │   ├── custom_button.dart
│   │   ├── product_card.dart
│   │   ├── custom_textfield.dart
│   │   └── loading_widget.dart
│   ├── utils/                  # Utility functions
│   │   ├── constants.dart
│   │   ├── helpers.dart
│   │   └── validators.dart
│   └── main.dart               # App entry point
├── android/                    # Android-specific files
├── ios/                        # iOS-specific files
├── web/                        # Web support files (if enabled)
├── assets/                     # App assets
│   ├── images/
│   ├── icons/
│   └── fonts/
├── firebase/                   # Firebase configuration
│   ├── firestore.rules
│   └── firebase.json
├── pubspec.yaml               # Flutter dependencies
└── README.md                  # This file
```

## 🔧 Build and Deployment

### **Development Build:**
```bash
# Debug build for testing
flutter run --debug

# Profile build for performance testing
flutter run --profile
```

### **Production Build:**

#### Android:
```bash
# Build APK
flutter build apk --release

# Build App Bundle (recommended for Play Store)
flutter build appbundle --release
```

#### iOS:
```bash
# Build for iOS
flutter build ios --release

# Archive for App Store
# Use Xcode to archive and upload to App Store Connect
```

### **Firebase Deployment:**
```bash
# Deploy Firestore rules
firebase deploy --only firestore:rules

# Deploy Cloud Functions (if used)
firebase deploy --only functions

# Deploy hosting (for admin panel web version)
firebase deploy --only hosting
```

## 🤝 Contributing

We welcome contributions to improve Amaflip! Here's how you can help:

### **How to Contribute:**
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test thoroughly on both Android and iOS
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

### **Contribution Guidelines:**
- Follow Flutter/Dart style guidelines
- Test on both Android and iOS platforms
- Update documentation for new features
- Ensure Firebase rules are properly configured
- Test payment flows in Stripe test mode

### **Areas for Contribution:**
- UI/UX improvements
- New payment methods
- Enhanced admin features
- Performance optimizations
- Bug fixes and security improvements

## 🗺️ Roadmap

### **Upcoming Features:**
- [ ] **Push Notifications** - Order updates and promotions
- [ ] **Social Login** - Google, Facebook, Apple Sign-In
- [ ] **Multi-language Support** - Internationalization
- [ ] **Dark Mode** - Theme switching
- [ ] **Product Reviews** - User rating and review system
- [ ] **Advanced Search** - Filters and sorting options
- [ ] **Promo Codes** - Discount and coupon system
- [ ] **Live Chat** - Customer support integration

### **Technical Improvements:**
- [ ] **Offline Support** - Enhanced offline functionality
- [ ] **Performance Optimization** - Faster app loading
- [ ] **Security Enhancements** - Additional security measures
- [ ] **Analytics Integration** - User behavior tracking
- [ ] **Automated Testing** - Unit and integration tests

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact

**Prashant** - [@prashant000000004](https://github.com/prashant000000004)

Project Link: [https://github.com/prashant000000004/Amaflip](https://github.com/prashant000000004/Amaflip)

## 🙏 Acknowledgments

- **Flutter Team** - For the amazing cross-platform framework
- **Firebase Team** - For the comprehensive backend services
- **Stripe** - For secure and reliable payment processing
- **Material Design** - For the beautiful design system
- **Open Source Community** - For the helpful packages and resources

---

## 📊 Project Info

![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue.svg)
![Firebase](https://img.shields.io/badge/Firebase-Latest-orange.svg)
![Stripe](https://img.shields.io/badge/Stripe-Integrated-blueviolet.svg)
![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android-lightgrey.svg)

⭐ **If you found this project useful, please give it a star!** ⭐

---

### 📱 **Download Links** (Coming Soon)
- 📱 [Download on App Store](#)
- 🤖 [Get it on Google Play](#)
