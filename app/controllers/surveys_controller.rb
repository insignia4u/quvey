class SurveysController < ApplicationController
  before_filter :authenticate_user!

  def new
    @survey = current_user.surveys.build
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
    params.require(:survey).permit(:name, :expired_at => [])
  end
end