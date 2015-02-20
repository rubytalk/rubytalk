class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to new_member_url, notice: 'Member was successfully created.'
    else
      render :new
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :email)
  end
end
