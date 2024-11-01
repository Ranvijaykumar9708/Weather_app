import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import com.example.weather_app.MainActivity

class NotificationReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val notificationIntent = Intent(context, MainActivity::class.java)
        // Extract the target page from the intent
        val targetPage = intent.getStringExtra("target") ?: "home" // default to home if not found
        notificationIntent.putExtra("target", targetPage)
        notificationIntent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
        context.startActivity(notificationIntent)
    }
}
