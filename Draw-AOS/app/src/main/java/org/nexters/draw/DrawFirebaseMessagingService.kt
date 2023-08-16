package org.nexters.draw

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.Build
import androidx.core.app.NotificationCompat
import com.google.android.gms.tasks.OnCompleteListener
import com.google.firebase.messaging.FirebaseMessaging
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage

class DrawFirebaseMessagingService : FirebaseMessagingService() {

    override fun onNewToken(token: String) {
        super.onNewToken(token)
        getFirebaseToken()
    }


    override fun onMessageReceived(remoteMessage: RemoteMessage) {
        super.onMessageReceived(remoteMessage)

        if (remoteMessage.notification !=null) { //포그라운드
            sendNotification(remoteMessage)
        }
        else if (remoteMessage.data.isNotEmpty()) { //백그라운드
            sendNotification(remoteMessage)

        }

    }


    private fun sendNotification(remoteMessage: RemoteMessage) {
        val channelId = "draw_channel"
        val notificationManager =
            getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

        val channel =
            NotificationChannel(channelId, "Notice", NotificationManager.IMPORTANCE_DEFAULT)
        notificationManager.createNotificationChannel(channel)

        // RequestCode, Id를 고유값으로 지정하여 알림이 개별 표시
        val uniId: Int = (System.currentTimeMillis() / 7).toInt()


        val resultIntent = Intent(this, MainActivity::class.java)
        resultIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        resultIntent.putExtra("url", remoteMessage.data["url"].toString())
        val requestCode = System.currentTimeMillis().toInt()
        val pendingIntent = PendingIntent.getActivity(
            this, requestCode, resultIntent, PendingIntent.FLAG_IMMUTABLE
        )


        val notificationBuilder = NotificationCompat.Builder(this, channelId)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setSmallIcon(R.mipmap.ic_draw)
            .setContentTitle(remoteMessage.data["title"].toString())
            .setContentText(remoteMessage.data["body"].toString())
            .setAutoCancel(true)
            .setOnlyAlertOnce(true)
            .setLargeIcon(drawableToBitmap(this, R.drawable.ic_draw))
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .setContentIntent(pendingIntent)

        notificationManager.notify(uniId, notificationBuilder.build())
    }


    fun getFirebaseToken(): String? {
        var token: String? = null
        FirebaseMessaging.getInstance().token.addOnCompleteListener(OnCompleteListener { task ->
            if (!task.isSuccessful) {
                return@OnCompleteListener
            }

            // Get new FCM registration token
            token = task.result

            // Log and toast
        })

        return token
    }
}
