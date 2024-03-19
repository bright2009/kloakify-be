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
      # Send invitation email
      UserMailer.with(email: document_params[:recipient_email]).new_user_invitation.deliver_later
      render json: { message: "Invitation sent to recipient" }, status: :accepted
    end
 end

 private

 def document_params
    params.require(:document).permit(:file, :recipient_email)
 end

end
