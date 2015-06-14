module Kendocup
  class User < ActiveRecord::Base


    belongs_to :club
    has_many :kenshis, dependent: :destroy

    validates_presence_of :email, unless: lambda{
      # Rails.logger.debug "SELF: #{self.inspect}"
      # Rails.logger.debug "SELF BLANK?: #{self.uid.blank? && self.provider.blank?}"
      self.uid.blank? && self.provider.blank?
    }
    # validates :email, presence: { unless: :uid? }
    validates :last_name, presence: true, uniqueness: {scope: :first_name,  unless: Proc.new { |u| u.first_name.blank? }}
    validates :first_name, presence: true

    before_validation :format

    def club_name=(club_name)
      self.club = Club.find_or_initialize_by name: club_name
    end

    def club_name
      club.try(:name)
    end

    def full_name
      "#{first_name} #{last_name}"
    end

    def registered_for_cup?(cup)
      cup.present? && cup.kenshis.where("kenshis.first_name = ? AND kenshis.last_name = ?", first_name, last_name).present?
    end

    def has_kenshis?
      kenshis.count > 0
    end

    def has_kenshis_for_cup?(cup)
      kenshis.where(cup: cup).count > 0
    end

    def gender
      female? ? '♀' : '♂'
    end

    def fees(currency, cup)
      kenshis.for_cup(cup).map{|k| k.fees(currency)}.inject{|sum,x| sum + x}
    end

  private

    def format
      # use POSIX bracket expression here
      self.last_name = self.last_name.gsub(/[[:alpha:]]+/){|w| w.capitalize } if self.last_name
      self.first_name = self.first_name.mb_chars.gsub(/[[:alpha:]]+/){|w| w.capitalize } if self.first_name
      self.email = self.email.downcase if self.email
    end

    # def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    #   user = User.where(provider: auth.provider, uid: auth.uid).first
    #   unless user
    #     birthday = auth.extra.raw_info.birthday.present? ? Date.strptime(auth.extra.raw_info.birthday, '%m/%d/%Y') : nil
    #     name = auth.info.name.split(' ')
    #     user = User.new(first_name: name.first, last_name: name.last, dob: birthday, provider: auth.provider, uid: auth.uid, password: Devise.friendly_token[0,20])
    #     user.skip_confirmation!
    #     user.save
    #     Rails.logger.info "AUTH: #{auth.to_yaml}"
    #     Rails.logger.info "USER: #{user.inspect}"
    #     user
    #   end
    #   return user
    # end
  end
end
