# 메인기능을 테스트하기 위한 더미데이터를 넣습니다.
# rake 명령어를 사용해야 합니다.
# User -> Proudcts -> Manuals -> Reviews 순으로 데이터를 넣어주세요.
# 명령어는 각 task 주석에서 볼 수 있습니다.
# 명령어를 터미널창에 순서대로 입력해주세요.

# "1" Add Users: add_users => rake add_users
phone = ['010-2323-2323', '010-7323-1113', '010-9003-2323', '010-1723-2543', '010-1003-4823', '010-2236-4829']
task :add_users => [:environment] do
  (1..10).each do
  pass = Faker::Internet.password(8)
    User.create({
      :email => Faker::Internet.email,
      :nickname => Faker::Internet.user_name(5..8),
      :phone => phone.sample,
      :password => pass,
      :password_confirmation => pass
      })
  end
end

# "2" Add Products: 명령어 => rake add_products
task :add_products => [:environment] do
  category = ['피부', '화장', '헤어', '바디']
  age = ['10대', '20대초반', '20대후반', '30대초반', '30대후반', '40대이상']
  skintype = ['건성', '지성', '복합성', '중성', '민감성']
  price = [20000, 30000, 31000, 15600, 23000, 22200, 34000, 65300, 20500, 8000, 9000, 8500, 31000, 153000, 2000, 15200 ]
  bool = [true, false]
  skincolor = [1,2,3,4,5,6,7,8,9,10,22,21,23,24,25,14,15,16,17,18]

  (1..20).each do
    Product.create({:category => category.sample, :age => age.sample, :skintype => skintype.sample,
                    :brand => Faker::Lorem.word, :name => Faker::Lorem.word, :price => price.sample,
                    :image => File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),
                    :contents => Faker::Lorem.paragraph,
                    :allergy => bool.sample, :atopy => bool.sample, :pimple => bool.sample,
                    :bb => bool.sample, :lip => bool.sample, :eyebrow => bool.sample, :eyeline => bool.sample, :color => bool.sample,
                    :skincolor => skincolor.sample})
  end
end

# "3" Add Manuals: 명령어 => rake add_manuals
task :add_manuals => [:environment] do
  category = ['피부', '화장', '헤어', '바디']
  age = ['10대', '20대초반', '20대후반', '30대초반', '30대후반', '40대이상']
  skintype = ['건성', '지성', '복합성', '중성', '민감성']
  price = [20000, 30000, 31000, 15600, 23000, 22200, 34000, 65300, 20500, 8000, 9000, 8500, 31000, 153000, 2000, 15200 ]
  bool = [true, false]
  skincolor = [1,2,3,4,5,6,7,8,9,10,22,21,23,24,25,14,15,16,17,18]

  (1..20).each do
    Manual.create({:category => category.sample, :title => Faker::Lorem.word,
                   :image => File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),
                   :content => Faker::Lorem.paragraph,
                   :age => age.sample, :skintype => skintype.sample,
                   :allergy => bool.sample, :atopy => bool.sample, :pimple => bool.sample,
                   :bb => bool.sample, :lip => bool.sample, :eyebrow => bool.sample, :eyeline => bool.sample, :color => bool.sample,
                   :skincolor => skincolor.sample})
  end
end

# "4" Add Reviews: 명령어 => rake add_reviews
task :add_reviews => [:environment] do
  products = Product.all
  users = User.all

  (1..80).each do
    product = products.sample
    user = users.sample
    Review.create({
      :user_id =>  user.id,
      :product_id => product.id,
      :rating => [0,1,2,3,4,5].sample,
      :review => Faker::Lorem.sentence
      })
  end
end
