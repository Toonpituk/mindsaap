# -*- encoding : utf-8 -*-
class ActivityController < MdController
  def news
    @title= "ข่าว"
    @activities = Act.where(:atype=>1).desc(:created_at).page(params[:page]).per(10)
  end
  def act
    @title= "กิจกรรม"
    @activities = Act.where(:atype=>2).desc(:created_at).page(params[:page]).per(10)
    render :template=> "activity/news"
  end
  def procure
    @title= "จัดซื้อ จัดจ้าง"
    @activities = Act.where(:atype=>3).desc(:created_at).page(params[:page]).per(10)
    render :template=> "activity/news"
  end
  def show
    @activity = Act.find params[:id]
  end
  def rm
    @activity = Act.find params[:id]
    @activity.destroy
    # debugger
    redirect_to env["HTTP_REFERER"]
  end

  def create_activity
    Act.create $xvars["enter"]["act"]
  end
end
