user1 = User.create(:username => "skittles123", :password => "iluvskittles")

user2 = User.create(:username => "flatiron4lyfe", :password => "Rubie!")

user3 = User.create(:username => "kittens1265", :password => "crazycatlady")

user4 = User.create(:username => "cat", :password => "123456")

case1 = DartCase.create(:name => "bigone", :user_id => user1.id)

case2 = DartCase.create(:name => "lilone", :user_id => user2.id)

case3 = DartCase.create(:name => "hio", :user_id => user3.id)

case4 = DartCase.create(:name => "alo", :user_id => user4.id)

case5 = DartCase.create(:name => "lucky", :user_id => user1.id)

case6 = DartCase.create(:name => "dud", :user_id => user2.id)

case7 = DartCase.create(:name => "firstone", :user_id => user3.id)

case8 = DartCase.create(:name => "oldy", :user_id => user4.id)

set1 = DartSet.create(:name => "stuff", :dart_case_id => case1.id)

set2 = DartSet.create(:name => "things", :dart_case_id => case2.id)

set3 = DartSet.create(:name => "badass", :dart_case_id => case3.id)

set4 = DartSet.create(:name => "wingit", :dart_case_id => case4.id)

set5 = DartSet.create(:name => "kapoochin", :dart_case_id => case5.id)

set6 = DartSet.create(:name => "lavender", :dart_case_id => case6.id)

set7 = DartSet.create(:name => "stench", :dart_case_id => case7.id)

set8 = DartSet.create(:name => "exciting", :dart_case_id => case8.id)

