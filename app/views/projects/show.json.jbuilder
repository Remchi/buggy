json.id @project.id
json.name @project.name
json.description @project.description

json.issues @project.issues do |issue|
  json.id issue.id
  json.name issue.name
  json.description issue.description
  json.created_at time_ago_in_words(issue.created_at)
end
