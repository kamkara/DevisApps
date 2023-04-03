class ApplicationController < ActionController::Base
    before_action :authenticate_user!, unless: :devise_controller?


    private
        def current_compagny
        @current_compagny ||= current_user.compagny if user_signed_in?
        end
        #Ajoutons cette logique dans car ApplicationControllernous utiliserons la current_companyméthode plus tard dans nos contrôleurs et nos vues
        helper_method :current_compagny
end
