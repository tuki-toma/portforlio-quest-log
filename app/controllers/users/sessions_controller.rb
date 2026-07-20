class Users::SessionsController < Devise::SessionsController

    def guest_sign_in
        user = User.find_by(email: "guest@example.com")
        if current_user == nil
            if user == nil
                user = User.create(
                    email: "guest@example.com",
                    password: "guest_password",
                    name: "ゲストユーザー",
                    )
            end
            sign_in user
            redirect_to tasks_path ,notice: "ゲストユーザーとしてログインしています"
        end
    end
end