import java.util.Properties
import java.io.FileInputStream
import java.io.InputStreamReader

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("kotlinx-serialization")
}

val localProperties = Properties()
val localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    InputStreamReader(FileInputStream(localPropertiesFile), Charsets.UTF_8).use { reader ->
        localProperties.load(reader)
    }
}

val keystoreFile = rootProject.file("key.properties")
if (keystoreFile.exists()) {
    InputStreamReader(FileInputStream(keystoreFile), Charsets.UTF_8).use { reader ->
        localProperties.load(reader)
    }
}

android {
    namespace = "com.tercad.fingrom"
    //compileSdk = flutter.compileSdkVersion
    compileSdk = 34 // Downgrade for better Google Play Services compatibility
    // ndkVersion = flutter.ndkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.tercad.fingrom"
        minSdk = flutter.minSdkVersion
        //targetSdk = flutter.targetSdkVersion
        targetSdk = 34 // Downgrade for better Google Play Services compatibility
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            keyAlias = "key"
            keyPassword = localProperties.getProperty("key.password")
            if (localProperties.getProperty("key.file") != null) {
              storeFile = file(localProperties.getProperty("key.file"))
            }
            storePassword = localProperties.getProperty("key.password")
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
        }
    }

    buildFeatures {
        viewBinding = true
    }
}

dependencies {
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.5.0")
    implementation(platform("com.google.firebase:firebase-bom:33.7.0"))
    implementation("com.google.firebase:firebase-analytics")
}

flutter {
    source = "../.."
}
