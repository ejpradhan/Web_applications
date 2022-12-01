require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  # GET /hello

  context "GET /hello" do
    it "returns 'Hello Leo'" do
      response = get("/hello?name=Leo")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Leo")
    end

    it "returns 'Hello Josh'" do
      response = get("/hello?name=Josh")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Josh")
    end
  end

  # GET /
  context "GET /" do
    it "returns 200 OK" do
      response = get("/")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello!")
    end
  end

  # GET /names
  context "GET /names" do
    it "returns the names" do
      response = get("/names?names=Julia, Mary, Karim")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end

    it "returns the names" do
      response = get("/names?names=Bob, Bill, Ben")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Bob, Bill, Ben")
    end
  end

  # POST /sort-names
  context "POST /sort-names" do
    it "returns a string of 5 sorted names" do
      response = post("/sort-names", names: "Joe,Alice,Zoe,Julia,Kieran")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end

    it "returns a string of 3 sorted names" do
      response = post("/sort-names", names: "Kate,Daniel,Mike")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Daniel,Kate,Mike")
    end
  end
end
