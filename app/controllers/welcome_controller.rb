# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    if params[:tag]
      tagged_paginator
    else
      untagged_paginator
    end
  end

  private

  def tagged_paginator
    if current_user
      @tutorials = Tutorial.tagged_with(params[:tag])
                           .paginate(page: params[:page], per_page: 5)
    else
      @tutorials = Tutorial.non_class_content.tagged_with(params[:tag])
                           .paginate(page: params[:page], per_page: 5)
    end
  end

  def untagged_paginator
    if current_user
      @tutorials = Tutorial.all.paginate(page: params[:page], per_page: 5)
    else
      @tutorials = Tutorial.non_class_content
                           .paginate(page: params[:page], per_page: 5)
    end
  end
end
