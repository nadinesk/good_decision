json.user do 
	json.(@user, :id, :email)
ends
json.token(Auth.create_token(@user.id))
#{ user: {id: 1, email: blah@blah.com, username: blah}}