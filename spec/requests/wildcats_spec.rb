require 'rails_helper'

RSpec.describe "Wildcats", type: :request do
  describe "GET /index" do
    it "gets a list of wildcats" do
      Wildcat.create(
        name: 'Bob the Bengal Tiger',
        age: 2,
        enjoys: 'Sunbathing by the river',
        dislikes:'Loud noises',
        image: 'https://images.unsplash.com/photo-1553054366-ebbf4296eb32?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1229&q=80'
      )

      get '/wildcats'

      wildcat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(wildcat.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a wildcat" do
      # The params we are going to send with the request
      wildcat_params = {
        wildcat: {
          name: 'Simba the Lion',
          age: 4,
          enjoys: 'Bugs, and plenty of sunshine.',
          dislikes: 'Fighting with Scar',
          image: 'https://images.unsplash.com/photo-1548425333-81e49d519f68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1012&q=80'
        }
      }

    # Send the request to the server
    post '/wildcats', params: wildcat_params

    # Assure that we get a success back
    expect(response).to have_http_status(200)

    # Look up the cat we expect to be created in the db
    wildcat = Wildcat.first

    # Assure that the created cat has the correct attributes
    expect(wildcat.name).to eq 'Simba the Lion'
  end

  it "doesn't create a cat without a name" do
    wildcat_params = {
      wildcat: {
        age: 2,
        enjoys: 'Walks in the park',
        dislikes: 'Getting pat with water',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80',
      }
    }
    # Send the request to the  server
    post '/wildcats', params: wildcat_params
    # expect an error if the cat_params does not have a name
    expect(response.status).to eq 422
    # Convert the JSON response into a Ruby Hash
    wildcat = JSON.parse(response.body)
    # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
    expect(wildcat['name']).to include "can't be blank"
  end

  it "requires age to be inputted" do
    wildcat_params = {
      wildcat: {
        enjoys: 'swimming',
        dislikes: 'Getting pat with water',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80',
      }
    }
    # Send the request to the  server
    post '/wildcats', params: wildcat_params
    # expect an error if the cat_params does not have a name
    expect(response.status).to eq 422
    # Convert the JSON response into a Ruby Hash
    wildcat = JSON.parse(response.body)
    # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
    expect(wildcat['age']).to include "can't be blank"
  end

    it "requires a image to be uploaded" do
      wildcat_params = {
        wildcat: {
          age: 2,
          enjoys: 'swimming',
          dislikes: 'Getting pat with water',
        }
      }
      # Send the request to the  server
      post '/wildcats', params: wildcat_params
      # expect an error if the cat_params does not have a name
      expect(response.status).to eq 422
      # Convert the JSON response into a Ruby Hash
      wildcat = JSON.parse(response.body)
      # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
      p wildcat['image']
      expect(wildcat['image']).to include "can't be blank"
    
    end
  end
end

