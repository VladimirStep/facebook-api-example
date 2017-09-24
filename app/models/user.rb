class User
  include ActiveModel::Model

  def self.facebook_api(token)
    user_api = Koala::Facebook::API.new(token)
    result = user_api.batch do |batch_api|
      batch_api.get_object('me', { fields: %w(id name picture)})
      batch_api.get_connection('me',
                               'posts',
                               { limit: 5,
                                 fields: %w(id message created_time picture likes comments shares)})
    end
    result
  rescue Koala::Facebook::AuthenticationError
    session.delete(:user_token)
    nil
  rescue
    nil
  end
end