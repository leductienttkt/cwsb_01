module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user || :current_admin

    def connect
      self.current_user = find_verified_user
      logger.add_tags "ActionCable", current_user.email
    end

    protected
    def find_verified_user
      if verified_user = User.find_by(id: cookies.signed["user.id"])
        verified_user
      elsif verified_admin = Admin.find_by(id: cookies.signed["admin.id"])
        verified_admin
      else
        reject_unauthorized_connection
      end
    end
  end
end
