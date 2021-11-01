json.array! @news.each do |news|
    json.id news.id
    json.title news.title
    json.description news.description
    json.date news.created_at.strftime('%F %H:%M')
end
