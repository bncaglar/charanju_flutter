package com.example.charanju_flutter

import android.content.Context
import android.os.Bundle
import android.view.View
import io.flutter.embedding.android.SplashScreen

class SimpleSplashScreen : SplashScreen {
    override fun createSplashView(
            context: Context,
            savedInstanceState: Bundle?
    ): View? {
        return View.inflate(context, R.layout.activity_splash, null)
    }

    override fun transitionToFlutter(onTransitionComplete: Runnable) {
        onTransitionComplete.run()
    }
}