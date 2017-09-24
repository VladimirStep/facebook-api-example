class User
  include ActiveModel::Model

  def self.get_info(token)
    user_api = Koala::Facebook::API.new(token)
    feeds = user_api.get_connection('me', 'feed')
    post_id = feeds.first['id']
    post_likes = user_api.get_connections(post_id, 'likes')
    [feeds, post_id, post_likes]
  rescue Koala::Facebook::AuthenticationError => err
    session.delete(:user_token)
    nil
  end
end