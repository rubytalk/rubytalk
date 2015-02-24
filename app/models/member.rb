class Member < ActiveRecord::Base
  has_many :failed_invitations

  validates :email, uniqueness: true, presence: true
  validates_presence_of :name

  def failed(reason)
    failed_invitations.create! reason: reason
  end

  def invite
    return true unless Rails.env.production?

    api_call = JSON[
      RestClient.post(ENDPOINT,
        't'           => Time.now.to_i,
        'channels'    => ENV['CHANNELS'],
        'email'       => @member.email,
        'first_name'  => @member.name,
        'token'       => ENV['API'],
        'set_active'  => true,
        '_attempts'   => 1
      )
    ]

    failed(api_call) unless api_call['ok']
    api_call['ok']
  rescue => e
    failed(e.response)
    false
  end
end
