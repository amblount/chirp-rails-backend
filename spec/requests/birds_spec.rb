require "rails_helper"

describe "bird API Tests" do
	it "GET /birds should return 200" do
		get "/birds"

		expect(response).to have_http_status(200)
	end

	it "POST /birds should return 201" do
		post "/birds", params: {
			bird: {
				name: "joe"
			}
		}

		expect(response).to have_http_status(201)
	end

	it "POST /bird missing name should return 400" do
		post "/birds",  params: {
			bird: {
				something: "else"
			}
		}

		expect(response).to have_http_status(400)
	end

	it "GET /birds/:id should return 200" do
		bird = Bird.create(name: "joe")

		get "/birds/#{bird.id}/edit"

		expect(response).to have_http_status(200)
	end

	it "PUT /birds/:id should return 204" do
		bird = Bird.create(name: "joe")

		put "/birds/#{bird.id}", params: {
			bird: {
				name: "joe"
			}
		}
	end

	it "DELETE /birds/:id should return 200" do
		bird = Bird.create(name: "joe")

		delete "/birds/#{bird.id}"

		expect(response).to have_http_status(200)
	end
end