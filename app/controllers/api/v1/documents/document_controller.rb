class Api::V1::Documents::DocumentsController < ApplicationController
  before_action :authenticate_user!

  def create
 recipient = User.find_by(email: document_params[:recipient_email])
 document = Document.create!(file: document_params[:file])

 if recipient
   SentDocument.create!(document: document, sender: current_user, recipient: recipient)
   ReceivedDocument.create!(document: document, sender: current_user, recipient: recipient)
   render json: { message: "Document sent successfully" }, status: :created
 else
    # Use Devise Invitable to send an invitation
    User.invite!(email: document_params[:recipient_email], skip_invitation: true) do |u|
      u.skip_invitation = false
    end
    render json: { message: "Invitation sent to recipient" }, status: :accepted
 end
end

 private

 def document_params
    params.require(:document).permit(:file, :recipient_email)
 end

end
