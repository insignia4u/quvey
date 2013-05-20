class SurveysController < ApplicationController
  before_filter :authenticate_user!

  def new
    @survey = current_user.surveys.build
    question = @survey.questions.build
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
    params.require(:survey).permit(:name, "expired_at(1i)", "expired_at(2i)", 
      "expired_at(3i)", :questions_attributes => [:question_type_id, :title] )
  end

  # def expired_at
  #   year  = params[:survey]["expired_at(1i)".to_sym].to_i
  #   month = params[:survey]["expired_at(2i)".to_sym].to_i
  #   day   = params[:survey]["expired_at(3i)".to_sym].to_i
  #   obj = DateTime.new year, month, day
  #   {:expired_at => obj}
  # end
end
