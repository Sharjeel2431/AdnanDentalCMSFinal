json.array!(@transitions) do |transition|
  json.extract! transition, :id, :TransitionID, :TransitionName
  json.url transition_url(transition, format: :json)
end
