
# -*- encoding : utf-8 -*-
class SampleController < ApplicationController
  def views
    @title= "Views"
    @activities = Code.where(:atype=>1).desc(:created_at).page(params[:page]).per(10)
  end
  def models
    @title= "Models"
    @activities = Code.where(:atype=>2).desc(:created_at).page(params[:page]).per(10)
    render :template=> "sample/views"
  end
  def show
    @activity = Code.find params[:id]
    render :template=> "sample/show"
  end
  def rm
    @activity = Code.find params[:id]
    @activity.destroy
    # debugger
    redirect_to env["HTTP_REFERER"]
  end

  def create_code
    Code.create $xvars["entercode"]["code"]
  end
end
