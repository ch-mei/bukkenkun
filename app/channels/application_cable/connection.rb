module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    #channnelでcurrent_userが使えるようにする

    def connect
      self.current_user = find_verified_user
    end

    protected
    def find_verified_user
      verified_user = User.find_by(id: env['warden'].user.id)
      return reject_unauthorized_connection unless verified_user
      verified_user
    end

    def session
      cokkies.encrypted[Rails.application.config.session_options[:key]]
    end

  end
end
