json.data do
    if @developer['message']
        # json.status = 404
        json.message = @developer['message']
    else
        json.login @developer['login']
        json.public_repos @developer['public_repos']
        json.name @developer['name']
        json.location @developer['location']
    end
end