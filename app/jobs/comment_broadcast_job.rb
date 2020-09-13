class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast "stories_#{comment.story.id}_channel", comment: render_comment(comment)
  end

  private

  def render_comment(comment)
    CommentsController.render partial: 'comments/comment', locals: { comment: comment }
  end
end