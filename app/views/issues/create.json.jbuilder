json.id @issue.id
json.name @issue.name
json.description @issue.description
json.project_id @issue.project_id
json.created_at time_ago_in_words(@issue.created_at)
