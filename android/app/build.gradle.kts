import java.util.Properties
import java.io.FileInputStream
import java.io.InputStreamReader

plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
    // END: FlutterFire Configuration
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
    // compileSdk = flutter.compileSdkVersion
    compileSdk = 36
    // ndkVersion = flutter.ndkVersion
    ndkVersion = "28.2.13676358"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.tercad.fingrom"
        minSdk = flutter.minSdkVersion
        // targetSdk = flutter.targetSdkVersion
        targetSdk = 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            keyAlias = localProperties.getProperty("key.alias") ?: "key"
            keyPassword = localProperties.getProperty("key.password")
            storePassword = localProperties.getProperty("key.password")
            val keyFilePath = localProperties.getProperty("key.file")
            val keyFile = if (keyFilePath != null) file(keyFilePath) else null
            if (keyFile != null && keyFile.exists()) {
                storeFile = keyFile
            } else {
                val fallbackAppKey = file("key.jks")
                val fallbackAndroidKey = rootProject.file("key.jks")
                if (fallbackAppKey.exists()) {
                    storeFile = fallbackAppKey
                } else if (fallbackAndroidKey.exists()) {
                    storeFile = fallbackAndroidKey
                }
            }
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
    implementation("androidx.work:work-runtime:2.10.0")
}

flutter {
    source = "../.."
}
