# **SignSpeak - Sign Language Translator**

## **An AI-powered Sign Language Recognition App for iOS**

SignSpeak is a cutting-edge **iOS application** that utilizes **Machine Learning** and **Computer Vision** to translate **American Sign Language (ASL)** gestures into text in real-time. This app empowers **deaf** by facilitating seamless communication through AI-driven sign detection.

---

## **Features**

### **Core Features**

- **Live Camera-Based ASL Recognition**\
  - Translates sign language gestures into text using a **CoreML** model.\
  - Uses **real-time image processing** to detect and recognize ASL gestures.

### **Additional Features**

- 🔐 **Privacy-First Approach**: No data is stored or shared.
- 🌐 **Material-Style UI/UX**: Designed for an intuitive user experience.
- ⏳ **Optimized for Performance**: Uses Apple's **CoreML for on-device AI processing**.
- 📲 **Supports iOS/iPadOS 15+**: Runs smoothly on iPhones, iPads.

---

## **⚡ Technology Stack**

| Component             | Technology Used                    |
| --------------------- | ---------------------------------- |
| **Frontend**          | **SwiftUI**                        |
| **Camera Processing** | **AVFoundation**                   |
| **Machine Learning**  | **CoreML, CreateML**               |
| **Model Conversion**  | **PyTorch, TorchScript, CoreML** |
| **Image Processing**  | **Vision Framework**               |
| **State Management**  | **ObservableObject, MVC**         |

---

## **📂 Folder Structure**

```
SignSpeak/
│── Models/                # CoreML Model & ASL Gesture Mapping
│── Views/                 # SwiftUI Views (Camera, Controls, Text Display)
│── Controllers/           # Camera Controller, ASL Model Controller
│── Assets/                # Images, Icons, Assets
│── SignSpeakApp.swift     # Entry Point (SwiftUI App)
│── Info.plist             # Privacy Permissions
└── README.md              # Project Documentation
```

---

## **🚀 Getting Started**

### **🔹 Prerequisites**

- macOS 13+ with **Xcode 15+** installed.
- iPhone with **iOS 15+** for on-device testing.
- **Swift Package Manager (SPM)** for dependency management.

### **🔹 Installation**

1. **Clone the repository**

```bash
git clone https://github.com/Vivek-Tate/SignSpeak.git
cd SignSpeak
```

2. **Open the project in Xcode**

```bash
open SignSpeak.xcodeproj
```

3. **Build & Run the App on Simulator or iPhone**

- Select **Any iPhone, iPad, Mac Device** (or real device).
- Click **Run ▶** in Xcode.

---

## **🛠️ Permissions Required**

To run SignSpeak, add these **privacy descriptions** in `Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>SignSpeak uses your camera for sign language recognition.</string>
```

> 📌 **Note**: The app does NOT record or store any images.

---

## **🧑‍🎓 Contributing**

**Want to improve SignSpeak?** Contributions are welcome!

---

## **📝 License**
See the full [**LICENSE**](https://github.com/Vivek-Tate/SignSpeak/blob/main/LICENSE) for details.

---
Feel free to reach out via the project's GitHub repository for any issues or contributions. Enjoy exploring Sign Speak!

