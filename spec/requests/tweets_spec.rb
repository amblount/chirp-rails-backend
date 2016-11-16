require "rails_helper"

describe "Tweet API Tests" do
	it "GET /tweets should return 200" do
		get "/tweets"

		expect(response).to have_http_status(200)
	end

	it "POST /tweets should return 201" do
		bird = Bird.create(name: "paul")
		post "/birds/#{bird.id}/tweets", params: {
			tweet: {
				content: "test",
				bird_id: bird.id
			}
		}

		expect(response).to have_http_status(201)
	end

	it "POST /tweets missing content should return 400" do
		post "/tweets",  params: {
			tweet: {
				something: "else"
			}
		}

		expect(response).to have_http_status(400)
	end

	it "GET /tweets/:id should return 200" do
		bird = Bird.create(name: "joe")
		tweet = Tweet.create(content: "test", bird_id: bird.id)

		get "/tweets/#{tweet.id}/edit"

		expect(response).to have_http_status(200)
	end

	it "PUT /tweets/:id should return 204" do
		bird = Bird.create(name: "joe")
		tweet = Tweet.create(content: "test", bird_id: bird.id)

		put "/tweets/#{tweet.id}", params: {
			tweet: {
				content: "test",
				bird_id: bird.id
			}
		}
	end

	it "DELETE /tweets/:id should return 200" do
		bird = Bird.create(name: "joe")
		tweet = Tweet.create(content: "test", bird_id: bird.id)

		delete "/tweets/#{tweet.id}"

		expect(response).to have_http_status(200)
	end
end