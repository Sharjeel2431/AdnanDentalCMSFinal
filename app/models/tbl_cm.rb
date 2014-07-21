class TblCm < ActiveRecord::Base
  begin
    def encrypt_password

      if password.present?

        self.password_salt = BCrypt::Engine.generate_salt

        self.password = BCrypt::Engine.hash_secret(password, password_salt)

      end

    end

    def self.authenticate(username="", password="")

      user = find_by_username(username)

      if user && user.password == BCrypt::Engine.hash_secret(password,user.password_salt)
        user
      else

        nil
      end

    end


  rescue

  ensure

  end
end
