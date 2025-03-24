class RegistrationsController < Devise::RegistrationsController
    def create
      super do |resource|
        if resource.persisted?
          flash[:notice] = "Welcome!, #{resource.name}! 🎉"
        end
      end
    end
  end
  