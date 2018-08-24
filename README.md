**
자신의 개발 내용과 오류 수정사항을 자신의 이름 아래 적어주시고 날짜, 시간과 함께 적어주시기 바랍니다.**

###  해커톤 참여 인원
- 건국대학교 방민석
- 건국대학교 전수종
- 건국대학교 전준혁
- 건국대학교 이호령
- 을지대학교 오지혜
- 충남대학교 김정현

### 역할분담 내용
- 방민석 : 랭킹(별점순), 쇼핑페이지 구현, 제품 랭킹 출력부분
- 전수종 : text editor 선정, 조회수 구현
- 전준혁 : 메인기능/유저인증 구축, 제품/메뉴얼 알고리즘 개발, 테스팅(Faker 더미데이터 활용)
- 이호령 : ranking(index,category) manual(index,category,show) product(show,index,neww,edit) 페이지 css구축
- 오지혜 :
- 김정현 : 


### 날짜별 진행사항
**8월 11 기준 진행 사항**
- 메뉴얼/제품/유저 & 메뉴얼스펙/제품스펙/유저스펙 모델링
- 맞춤 메뉴얼 알고리즘 설계
- 메뉴얼 코멘트 기능 개발

**8월 12일 진행사항**
- 메뉴얼 좋아요 기능 개발
- 맞춤 제품 알고리즘 개발
- 카테고리 분류
- 제품 리뷰 기능 개발

**8월 15일 진행사항**
- Front: ckeditor 적용
- Back: Manual, Proudct 모델에 thumbnail 이미지 추가
- Back: 맞춤제품/메뉴얼 알고리즘 최적화

**8월 16일 진행사항**
- Back: 랭킹, 쇼핑 필터 개발
- Back: 평점계산 기능 최적화
- Back: Faker Gem을 활용한 더미데이터 넣기 & 쇼핑 필터 테스팅
- Front: 메인 메뉴 views 틀잡기

**8월 20일 진행사항**
- < Front >
- home#index를 제외한 전체 페이지 디자인 구성 완료
- manual,custom,ranking,shopping => index, category, show 페이지 완성 (shopping은 아직 show페이지 미구현입니다)

**8월 21일 진행사항**
- Back: 맞춤 매뉴얼, 맞춤 제품 상위 1~4개 뽑아내기 추가
- Front: Manual, Userspec Form Design

### 해야할것
* 알아야할 것: 맞춤제품, 랭킹, 쇼핑, 제품등록의 show page(show.html.erb)는 동일합니다!
- 새 제품 등록/새 메뉴얼 등록 에서 에디터를 통해 업로드 한 사진이 사이즈 조절
- show page 디자인 추가 (manuals + products)
- 메뉴바(메인+서브) 폰트 넣기
- ranking index (all + categries) 페이지 디자인 미완성
- 맞춤제품 index (all + categries)
- manuals/products/custom(+ categories) index 페이지에서 사진 세로로 늘려진는 현상 고치기
- users/manuals/products/userspecs validation 점검 및 추가
- new/edit form 디자인 완성

### 오류내용
##### 8월12일 tinymce와 imageupload 연동하기
paperclip gem을 사용하려 했으나, tinymce 플러그인 안에서 여러장의 사진을 첨부하는데 있어서 paperclip모델과의 연동이 어려움. 구글링에 노출되는 참고 자료가 부족하여 다른 방법을 고안중.

##### rake 파일에서 더미데이터 넣기
Products 데이터를 활용해 쇼핑 카테고리 기능 테스트를 위해 Faker젬을 사용하였다. 여기서 Faker::Avatar 가 서버문제로 작동하지 않았다. 그래서 구글링 진행





- 해결방법: File.open(Dir.glob(File.join(Rails.root, 'directory', '*')).sample) 활용
```
Product.create({
	:image => File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
})
```



### 사용한 Gem
gem 'bootstrap', '> 4.1', '>= 4.1.3'
gem 'simple_form', '> 4.0', '>= 4.0.1'
gem 'rails_db'
gem 'devise', '> 4.4', '>= 4.4.3'
gem 'paperclip', '> 6.1'
gem 'acts_as_votable', '~> 0.11.1'
gem 'faker'
gem 'rolify'
gem 'cancancan'

### 참고 문서
https://stackoverflow.com/questions/5792442/generating-paperclip-image-uploads-with-fake-data-ruby-on-rails-populator-fa https://rubygems.org/gems/rails/versions/4.2.6

### 완성본 스크린샷
