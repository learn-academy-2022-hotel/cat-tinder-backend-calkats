class WildcatsController < ApplicationController

    def index
        wildcats = Wildcat.all
        render json: wildcats
      end

      def create
        # Create a new cat
        wildcat = Wildcat.create(wildcat_params)
        if wildcat.valid?
            render json: wildcat
        else
            render json: wildcat.errors, status: 422
        end
      end
    
      # Handle strong parameters, so we are secure
      private
      def wildcat_params
        params.require(:wildcat).permit(:name, :age, :enjoys, :dislikes, :image)
      end

end
