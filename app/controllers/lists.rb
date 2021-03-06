get '/lists' do
  @lists = List.where(user_id: session[:user_id])
  erb :'/lists/index'
end

get '/lists/new' do #make sure the new form page goes before the show page
  erb :'/lists/new'
end

get "/lists/:id" do
  @list = List.find_by(id: params[:id])
  erb :'/lists/show'
end

post '/lists' do
  list = List.new(params[:list])
  list.user_id = session[:user_id]
  if list.save
    redirect '/lists' #have to update this later
  else
    @errors = list.errors.full_messages
    erb :'/lists/new'
  end
end
