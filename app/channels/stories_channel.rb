class StoriesChannel < ApplicationCable::Channel

def subscribed 
	stream_from"stories_#{params['story_id']}_channel"
end 

def unsubscribed
end

def send_comment(data)
	current_user.comments.create!(content: data['comment'], story_id: data['story_id'])
end


end