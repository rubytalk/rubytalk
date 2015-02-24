class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to new_member_url, user_message(@member)
    else
      render :new
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :email)
  end

  def user_message(member)
    if member.invite
      { notice: "Obrigado! Você receberá um e-mail de convite para o chat." }
    else
      { alert: "Algo deu errado ao te convidar pro chat, mas pode deixar que vamos consertar e te avisar o quanto antes." }
    end
  end
end
