class Api::V1::DocumentsController < ApplicationController
#   before_action :authenticate_user!

   def create
    recipient = User.find_by(email: document_params[:recipient_email])

    if recipient
      document_params[:files].each do |file|
        document = Document.create!(file: file, sender_id: current_user.id, recipient_id: recipient.id)
        # Assuming you have a model for SentDocument and ReceivedDocument
        SentDocument.create!(document: document, sender: current_user, recipient: recipient)
        ReceivedDocument.create!(document: document, sender: current_user, recipient: recipient)
      end
      render json: { message: "Documents sent successfully" }, status: :created
    else
      User.invite!(email: document_params[:recipient_email], skip_invitation: true) do |u|
         u.skip_invitation = false
      end
      render json: { message: "File sent to recipient" }, status: :accepted
    end
 end


   def get_documents
      @document = Document.last
      render json: {
        status: { code: 200, message: "Document." },
        data: DocumentSerializers.new(@document).serializable_hash,
      }, status: :ok
   end


 private

 def document_params
    params.require(:document).permit(:recipient_email, files: [])
 end

end
