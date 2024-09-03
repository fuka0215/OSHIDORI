module NotificationsHelper
  def notification_message(notification)
    case notification.notifiable_type
    when "Post"
      "#{notification.notifiable.user.name}さんが新規投稿しました"
    when "PostComment"
      "あなたの投稿が#{notification.notifiable.user.name}さんからコメントされました"
    when "Relationship"
      "#{notification.notifiable.follower.name}さんにフォローされました"
    else
      "あなたの投稿が#{notification.notifiable.user.name}さんにいいねされました"
    end
  end
end
