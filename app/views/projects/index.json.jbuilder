json.array! @projects do |project|
  json.id project.id
  json.user_id project.user_id
  json.name project.name
  json.issues_count project.issues.size
end
