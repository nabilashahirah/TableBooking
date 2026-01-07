# 🍽️ ZappRun: Smart Table Reservation System

![Architecture](https://img.shields.io/badge/Architecture-MVVM-blue)
![Backend](https://img.shields.io/badge/Backend-Serverless-orange)
![Security](https://img.shields.io/badge/Security-AES%2FDES%20Encryption-red)
![Platform](https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter)

**ZappRun** is a full-stack table reservation application designed to demonstrate secure data handling, clean software architecture, and modern UI/UX principles. The project implements a strict **MVVM (Model-View-ViewModel)** pattern on the frontend and utilizes a **Serverless** architecture on the backend.

---

## 📖 Project Overview

This application allows users to reserve tables seamlessly while ensuring data integrity and security. The primary goal of this project was to move beyond simple CRUD operations by implementing:
1.  **Clean Architecture:** Separation of business logic using MVVM.
2.  **Serverless Computing:** Using Google Cloud Functions for scalable backend logic.
3.  **Enhanced Security:** Custom encryption and token-based authentication to prevent unauthorized access.

---

## 🏗️ Technical Architecture

### 📱 Frontend: MVVM & Provider
The app is built using **Flutter** and strictly follows the **Model-View-ViewModel** pattern to ensure the UI code is decoupled from logic.

* **Model:** Defines the data structure (e.g., `Reservation`, `User`, `Table`).
* **View:** The UI components and screens (optimized for UX).
* **ViewModel (Provider):** Manages state, processes business logic, and communicates with the backend.

### ☁️ Backend: Serverless (Google Cloud)
Logic is decoupled from the client-side to prevent tampering.
* **Database:** Firebase Realtime Database / Firestore.
* **Cloud Functions:** Serverless functions handle critical operations (e.g., validating reservations) to ensure "Code on Cloud" security.

---

## 🔐 Security Implementations
To secure the application against potential attacks and unauthorized data access (as per the security audit requirements):

### 1. Token-Based Authentication
* Every API request to the database requires a valid **Access Token**.
* This prevents unauthorized users (or hackers) from bypassing the UI to access the database directly.

### 2. Data Encryption (AES & DES)
* Sensitive data is hashed and encrypted using **AES (Advanced Encryption Standard)** and **DES** algorithms before transmission.
* This ensures that even if data is intercepted (MITM attack), it cannot be read as plain text.

---

## 📂 Folder Structure
The codebase is organized to reflect the MVVM separation of concerns:

```text
lib/
├── models/           # Data definitions (User, Booking)
├── views/            # UI Screens (Login, Home, Reservation)
├── viewmodels/       # Providers (State Management & Logic)
├── services/         # API Service (Google Cloud & Firebase calls)
├── utils/            # Encryption Helpers (AES/DES Logic)
└── main.dart
