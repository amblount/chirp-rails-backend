10.times do
	Tweet.create({content: "This is a tweet blah blah", bird_id: 1})
end


Bird.create(name: "Karen")
Bird.create(name: "Sam")
Bird.create(name: "Ron")
Bird.create(name: "Olivia")