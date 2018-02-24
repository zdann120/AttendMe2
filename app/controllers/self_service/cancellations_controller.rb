class SelfService::CancellationsController < ApplicationController
  def new
    @cancellation = ProcessCancellation.new
  end

  def create
    @cancellation = ProcessCancellation.run(cancellation_params)
    if @cancellation.valid?
      @result = "Cancellation succeeded."
    else
      @result = "Cancellation failed."
    end
  end

  private

  def cancellation_params
    params.require(:process_cancellation).permit(:key1, :key2, :email)
  end
end
