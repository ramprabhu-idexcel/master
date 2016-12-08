module Api
  class QuizzesController < CommonController
    before_action :set_type, only: [:validate]

    # GET api/quizzes
    def index
      @quizzes = Quiz.all

      render json: @quizzes
    end

    # POST api/quizzes/validate
    def validate

    end

    private

    def set_type
      @quizzes = Quiz.where(type: params[:type])
    end
  end
end