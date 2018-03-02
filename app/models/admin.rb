class Admin
    def initialize(user)
        @user = user
    end

    def create
        is_admin = @user.has_role? :admin
        return unless is_admin
        
    end
end