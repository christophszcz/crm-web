require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

$rolodex= Rolodex.new

get '/' do
	@crm_app_name = "My CRM"
	@title = "Sinatra"
  erb :index
end

get '/contacts' do
  @title = "View All Contacts"
  erb :contacts
end

get '/contacts/new' do
	@title =  "New Contact"
  erb :new_contact
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end

