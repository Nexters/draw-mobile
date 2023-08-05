package org.nexters.draw

import android.annotation.SuppressLint
import android.content.Context
import android.graphics.Bitmap
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable

@SuppressLint("UseCompatLoadingForDrawables")
fun drawableToBitmap(context: Context, drawableResId: Int): Bitmap? {
    val drawable: Drawable? = context.getDrawable(drawableResId)
    if (drawable is BitmapDrawable) {
        return drawable.bitmap
    }

    return null
}
