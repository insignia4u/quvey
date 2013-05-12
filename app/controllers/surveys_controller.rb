class SurveysController < ApplicationController
  before_filter :authenticate_user!

  def new
    @survey = current_user.surveys.build
    #3.times do
      question = @survey.questions.build
      question.question_possible_values.build
    #end
  end

  def create
    @survey = current_user.surveys.build(survey_params)
    if @survey.save
      flash[:notice] = 'Survey created successfully!'
      redirect_to root_path
    else
      flash[:error] = 'Error creating the survey'
      render :new
    end
  end

protected
  def survey_params
    params.require(:survey).permit(:name, :expired_at => [], 
      questions_attributes: [:title], question_possible_values_attributes: [:title])
  end
end
