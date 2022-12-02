require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }


  # context "GET /" do
  #   it "returns a hello page is password is correct" do
  #     response = get('/', password: 'abcd')

  #     expect(response.body).to include('Hello!') 
  #   end

  #   it "returns a forbidden page if the password is incorrect" do
  #     response = get('/', password: 'wxyz')

  #     expect(response.body).to include('Access forbidden!') 
  #   end
  # end

  context "GET /albums/:id" do
    it "returns info about album 2" do
      response = get('/albums/2')

      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Surfer Rosa</h1>")
      expect(response.body).to include("Release year: 1988")
      expect(response.body).to include("Artist: Pixies")
    end
  end

  context "Get /albums" do
    # it "should return the list of albums" do
    #   response = get("/albums")

    #   expected_response = "Doolittle, Surfer Rosa, Waterloo, Super Trouper, Bossanova, Lover, Folklore, I Put a Spell on You, Baltimore, Here Comes the Sun, Fodder on My Wings, Ring Ring"
    #   expect(response.status).to eq(200)
    #   expect(response.body).to eq(expected_response)
    # end
    it "returns a list of albums as an HTML page" do
      response = get("/albums")

      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Albums</h1>")
      expect(response.body).to include("Title: Surfer Rosa")
      expect(response.body).to include("Released: 1988")
    end
  end

  context "GET /artists" do
    it "returns 200 OK and the list of artists" do
      response = get("/artists")
      expected_response = "Pixies, ABBA, Taylor Swift, Nina Simone"

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
    end

    it "returns 404 Not found" do
      response = get("/artistt")
    end
  end

  context "POST /albums" do
    it " should create a new album" do
      response = post("/albums",
                      title: "OK, Computer",
                      release_year: "1997",
                      artist_id: "1")

      expect(response.status).to eq(200)
      expect(response.body).to eq("")

      response = get("/albums")

      expect(response.body).to include("OK, Computer")
    end
  end

  context "POST /albums" do
    it "200 OK and creates a new album" do
      response = post("/albums", title: "voyager", release_year: "2022", artist_id: "2")

      expect(response.status).to eq(200)
      expect(response.body).to eq("")

      response = get("/albums")
      expect(response.status).to eq(200)
      expect(response.body).to include("voyager")
    end

    it "returns 404 Not Found" do
      response = post("/albumz")

      expect(response.status).to eq(404)
    end
  end

  context "POST /artists" do
    it " returns 200 OK and should create a new artist" do
      response = post("/artists",
                      name: "Wild nothing",
                      genre: "Indie")

      expect(response.status).to eq(200)
      expect(response.body).to eq("")

      response = get("/artists")

      expect(response.body).to include("Wild nothing")
    end

    it "returns 404 Not found" do
      response = get("/artist?id=4098")

      expect(response.status).to eq(404)
    end
  end
end
