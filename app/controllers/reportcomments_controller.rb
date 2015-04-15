class ReportcommentsController < ApplicationController
  def dismiss
    @reportcomments = Reportcomment.where(comment_id: params[:c_id])
    @reportcomments.each do|rep_com|
      rep_com.is_dismissed = 1
      if rep_com.save
        flash[:notice] = 'Article was successfully dismissed.'
      else
        flash[:notice] = "Error dismissing article: #{rep_com.errors}"
      end
    end
    redirect_to :back
  end
end
