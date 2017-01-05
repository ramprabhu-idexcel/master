module Api
  class QuizzesController < CommonController
    before_action :set_type, :set_user, only: [:validate]

    # GET api/quizzes
    def index
      @quizzes = Quiz.all

      render json: @quizzes
    end

    # POST api/quizzes/validate
    def validate
      answers = []
      @quizzes.each do |quiz|
        answers << true if quiz_data.has_key?(quiz.question) && quiz_data[quiz.question] == quiz.answer
      end
      Score.where(user: @user, section: quiz_type).first_or_initialize.tap do |score|
        score.user = @user
        score.marks = answers.length
        score.attempt = score.attempt + 1
        score.section = quiz_type
        score.save
        @score_json = { marks: score.marks, attempt: score.attempt, type: score.section }
      end
      render json: @score_json
    end

    # GET api/quizzes/computer
    def computer
      @computer_arr = []
      Computer.all.shuffle.each do |computer|
        @computer_arr << { name: computer.question, answers: computer.options }
      end
      render json: @computer_arr
    end

    private

    def set_type
      @quizzes = quiz_params[:type].constantize.all
    end

    # Only allow a trusted parameter "white list" through.
    def quiz_params
      params.require(:quiz).tap do |whitelisted|
        whitelisted[:obj] = params[:quiz][:obj]
        whitelisted[:type] = params[:quiz][:type]
        whitelisted[:user_id] = params[:quiz][:user_id]
      end
    end

    # only quiz objects
    def quiz_data
      quiz_params[:obj]
    end

    # only quiz type
    def quiz_type
      quiz_params[:type]
    end

    # set user
    def set_user
      @user = User.find(quiz_params[:user_id])
    end
  end
end