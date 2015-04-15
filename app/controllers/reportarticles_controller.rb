class ReportarticlesController < ApplicationController
  def dismiss
    @reportarticles=Reportarticle.where(:article_id => params[:a_id])
    @reportarticles.each do|rep_art|
    rep_art.is_dismissed = 1
    if rep_art.save
      flash[:notice] = 'Article was successfully dismissed.'
    else
      flash[:notice] = "Error dismissing article: #{rep_art.errors}"
    end
    end
    redirect_to :back
  end
end
