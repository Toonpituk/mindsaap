# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  def index
    @title = "ข้อมูลสมาชิก"
    @today = Date.today
    @xmains = current_user.xmains.in(status:['R','I']).asc(:created_at)
  end

  # mindapp methods
  def update_user
    # can't use session, current_user inside mindapp methods
    $user.update_attributes $xvars["enter_user"]["user"]
    $xvars["p"]["return"] = "/users"
  end
  def change_password
    # check if old password correct
    identity = Identity.find_by :code=> $user.code
    if identity.authenticate($xvars["enter"]["epass"])
      identity.password = $xvars["enter"]["npass"]
      identity.password_confirmation = $xvars["enter"]["npass_confirm"]
      identity.save
      ma_log "แก้ไขรหัสผ่านเรียบร้อยแล้ว"
    else
      ma_log "รหัสผ่านไม่ถูกต้อง"
    end
  end
end
