json.array!(@groups_groupings) do |groups_grouping|
  json.extract! groups_grouping, :id, :cohort_id, :name
  json.url groups_grouping_url(groups_grouping, format: :json)
end
