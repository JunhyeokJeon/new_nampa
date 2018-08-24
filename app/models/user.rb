class User < ApplicationRecord
  rolify
  after_create :assign_default_role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products
  has_many :manuals
  has_many :comments
  has_many :reviews
  has_one :userspec

  pwRegex = /\A(?=.*?[a-z])(?=.*?[0-9]).{8,20}\z/
  phoneRegex = /\A\d{3}-\d{4}-\d{4}\z/
  validates :email, :nickname, presence: true
  validates :phone, presence: true, format: { with: phoneRegex, message: "형식(010-xxxx-xxxx)에 맞게 입력해주세요." }
  validates :password, presence: true, format: { with: pwRegex, message: "형식(소문자+숫자 조합, 8~20자리)에 맞게 입력해주세요." }


  def assign_default_role
    emails = ['inamorfati@likelion.org', 'seokk1209@likelion.org', 'wjs7541@likelion.org', 'thrhdwk75@gmail.com', 'gihye0395@gmail.com', 'horyeong0326@likelion.org']
    if emails.include? self.email
      self.add_role('admin')
    elsif
      self.add_role('normal')
    end
  end
end
