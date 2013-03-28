json.array! @projects do |project|
  json.id project.id
  json.name project.name
  json.issues_count project.issues.size
end
