package org.nexters.draw

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.TaskStackBuilder
import android.content.Context
import android.content.Intent
import android.os.Build
import androidx.core.app.NotificationCompat
import com.google.firebase.messaging.FirebaseMessaging
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage

class DrawFirebaseMessagingService : FirebaseMessagingService() {


    override fun onNewToken(token: String) {
        super.onNewToken(token)


        //웹으로 토큰 전달

    }

    override fun onMessageReceived(message: RemoteMessage) {
        super.onMessageReceived(message)

        //받은 remoteMessage의 값 출력해보기. 데이터메세지 / 알림메세지
        //Log.d(TAG, "Message data : ${remoteMessage.data}")
        //Log.d(TAG, "Message noti : ${remoteMessage.notification}")

        if (message.data.isNotEmpty()) {

            sendNotification(message)
        } 


    }


    private fun sendNotification(remoteMessage: RemoteMessage) {
        val channelId = "draw_channel"
        val notificationManager =
            getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel =
                NotificationChannel(channelId, "Notice", NotificationManager.IMPORTANCE_DEFAULT)
            notificationManager.createNotificationChannel(channel)
        }

        // RequestCode, Id를 고유값으로 지정하여 알림이 개별 표시
        val uniId: Int = (System.currentTimeMillis() / 7).toInt()

        val resultIntent = Intent(this, MainActivity::class.java)
        for (key in remoteMessage.data.keys) {
            resultIntent.putExtra(key, remoteMessage.data.getValue(key))
        }

        resultIntent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
        val stackBuilder: TaskStackBuilder = TaskStackBuilder.create(this)
        stackBuilder.addParentStack(MainActivity::class.java)
        stackBuilder.addNextIntent(resultIntent)
        val resultPendingIntent: PendingIntent =
            stackBuilder.getPendingIntent(0, PendingIntent.FLAG_UPDATE_CURRENT)


        val notificationBuilder = NotificationCompat.Builder(this, channelId)
            .setSmallIcon(R.drawable.ic_draw)
            .setContentTitle(remoteMessage.data["title"].toString())
            .setContentText(remoteMessage.data["body"].toString())
            .setAutoCancel(true)
            .setOnlyAlertOnce(true)
            .setLargeIcon(drawableToBitmap(this, R.drawable.ic_draw))
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .setContentIntent(resultPendingIntent)

        notificationManager.notify(uniId, notificationBuilder.build())
    }


    fun getFirebaseToken() {
        FirebaseMessaging.getInstance().token.addOnSuccessListener {
            // get token
        }
    }
}
