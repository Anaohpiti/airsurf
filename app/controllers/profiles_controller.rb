class ProfilesController < ApplicationController
before_action(:set_profile, only: [:show])

# profile   GET  /profile(.:format)   profiles#show
  def show
    @owner_has_no_rentals = owner_has_no_rentals?
  end

  private

  def set_profile
    @profile = current_user
  end

  def owner_has_no_rentals?
    count = 0
      @profile.boards.each do |board|
        board.rentals.each do |rental|
          count += 1 if rental
        end
      end
    return count == 0
  end
end
