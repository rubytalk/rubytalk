class MembersController < ApplicationController
  ENDPOINT = "https://rubytalk.slack.com/api/users.admin.invite"
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      invite_to_slack
      redirect_to new_member_url, notice: 'Member was successfully created.'
    else
      render :new
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :email)
  end

  def invite_to_slack
    RestClient.post ENDPOINT,
      't'           => Time.now.to_i,
      'channels'    => ENV['CHANNELS'],
      'email'       => @member.email,
      'first_name'  => @member.name,
      'token'       => ENV['API'],
      'set_active'  => true,
      '_attempts'   => 1
  end
end