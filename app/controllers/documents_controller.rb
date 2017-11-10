class DocumentsController < ApplicationController
  def destroy
  document = Document.find(params[:id])
  @event = document.event
  if @event.user.id == current_user.id
    document.destroy

    redirect_to edit_event_path(@event), notice: "Document successfully removed"
  else
    redirect_to @event, notice: "Cannot delete that document"
  end
end
end
