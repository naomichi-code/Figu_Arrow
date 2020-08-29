
crumb :root do
  link "トップページ", root_path
 end

crumb :mypage do |obj|
  link "#{obj.account_name}さんの部屋", user_path(obj)
 end
crumb :users do
  link "ユーザー・一覧", users_path
 end
crumb :edit_mypage do |obj|
  link "#{obj.account_name}さんのアカウント詳細", edit_user_path(obj)
  parent :mypage, obj
 end
crumb :followed do |obj|
  link "フォローされているユーザー",user_followers_path(obj)
  parent :mypage, obj
 end
crumb :follower do |obj|
  link "フォローしているユーザー",user_follows_path(obj)
  parent :mypage, obj
 end

 crumb :posts do
  link "投稿一覧", posts_path
 end
 crumb :post do |obj|
  link "投稿レビュー画面", post_path(obj)
  parent :posts
end
crumb :group do
 link "トークルーム一覧", groups_path
end
crumb :show_group do |obj|
  link "トークルーム", group_path(obj)
 parent :group
end
crumb :new_group do |obj|
  link "トークルーム作成", new_group_path
 parent :group
end
crumb :tags do
  link "ジャンル一覧", tags_path
end
crumb :new_group do |obj|
  link "トークルーム作成", new_group_path
 parent :group
end
crumb :requirements do |obj|
  link "譲渡・交換・一覧", requirements_path
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).