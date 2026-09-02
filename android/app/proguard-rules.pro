# Keep Room generated implementations
-keep class * extends androidx.room.RoomDatabase
-keep class **_Impl { *; }

# Keep WorkManager
-keep class androidx.work.** { *; }

# Keep AndroidX Startup
-keep class androidx.startup.** { *; }
