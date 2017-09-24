class User
  include ActiveModel::Model

  def self.get_info(token)
    user_api = Koala::Facebook::API.new(token)
    result = user_api.batch do |batch_api|
      batch_api.get_object('me', { fields: ['id', 'name', 'picture'] })
      batch_api.get_connection('me', 'posts', { limit: 5, fields: ['id', 'message', 'created_time', 'picture', 'likes', 'comments', 'shares'] })
    end

    # profile = user_api.get_object('me')
    # posts = user_api.get_connection('me', 'posts', {limit: 5})
    # post_id = posts.first['id']
    # post_likes = user_api.get_connections(post_id, 'likes')
    # post_comments = user_api.get_connections(post_id, 'comments')
    # [profile, feeds]#, post_id, post_likes]
    result
  rescue Koala::Facebook::AuthenticationError => err
    session.delete(:user_token)
    nil
  end
end