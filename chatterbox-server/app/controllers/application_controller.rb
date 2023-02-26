class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    # returns an array of all messages as JSON, --DONE
    # ordered by created_at in ascending order.
    message = Message.all
    message.order(:created_at).to_json
  end

  post '/messages' do
    # creates a new message with a body and username from params, --DONE
    # and returns the newly created post as JSON. --DONE
    message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    message.to_json
  end

  patch '/messages/:id' do
    # updates the body of the message using params, --DONE
    # and returns the updated message as JSON.
    message = Message.find(params[:id])
    message.update(body: params[:body])
    message.to_json
  end

  delete '/messages/:id' do
    message = Message.find(params[:id])
    message.destroy.to_json
  end
  
end
