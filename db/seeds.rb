User.destroy_all

u1 = User.create :name => "Admin", :email => "maddi.milasas@gmail.com", :password => "chicken", :admin => true
u2 = User.create :name => "Pepe Silvia", :email => "pepe@ga.co", :password => "chicken"

Issue.destroy_all

i1 = Issue.create :summary => "sQ Cut has frozen", :details => "sQ Cut is not playing clips or responding to keyboard/mouse."
i2 = Issue.create :summary => "I can't see my clip in Quantel"
i3 = Issue.create :summary => "I can't hear audio from my TVU pack IFB"

Fix.destroy_all

f1 = Fix.create :title => "Restart sQ Cut", :steps => "Press CTRL + F5 to restart."
f2 = Fix.create :title => "Check all Quantel servers", :steps => "Your clip may be in Quantel, but on a different server to what you expect. Check alternate servers, especially Playout."
f3 = Fix.create :title => "Try a different search method", :steps => "1. Check the spelling in your search. 2. Browse all clips and search by created date."
f4 = Fix.create :title => "Check earpiece", :steps => "1. Check earpiece for wax. 2. Try an alternate earpiece."
f5 = Fix.create :title => "Check earpiece cable", :steps => "1. Check cable connection points. 2. Try an alternate cable."

Technology.destroy_all

t1 = Technology.create :name => "sQ Cut", :links => "https://s-a-m.com/support/post-and-editing"
t2 = Technology.create :name => "TVU"

i1.fixes << f1
i2.fixes << f2 << f3
i3.fixes << f4 << f5

i1.technologies << t1
i2.technologies << t1
i3.technologies << t2
