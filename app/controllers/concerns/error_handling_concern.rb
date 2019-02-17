# frozen_string_literal: true

module ErrorHandlingConcern
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActionController::ParameterMissing, with: :bad_request_exception
    rescue_from ArgumentError, with: :argument_error
  end

  private

  def record_invalid(exception)
    errors = exception.record.errors.to_hash(true).flat_map do |k, v|
      v.map do |msg|
        {
          title: k,
          detail: msg
        }
      end
    end

    unprocessable_entity_errors(errors)
  end

  def argument_error(exception)
    # Solo devolver error al cliente si viene por un valor invalido para un enum.
    raise exception unless exception.message.match?(/is not a valid/)

    errors = [{
      status: 422,
      title: 'Unprocessable Entity',
      detail: exception.message
    }]

    unprocessable_entity_errors(errors)
  end

  def record_not_found_message(exception)
    model_name = exception.model || params[:controller]
    model_name = model_name.singularize.underscore

    detail = "Couldn't find #{model_name}"
    if exception.primary_key.present? && exception.id.present?
      detail += " with #{exception.primary_key} = '#{exception.id}'"
    end

    detail
  end

  def record_not_found(exception)
    not_found_error(
      detail: record_not_found_message(exception)
    )
  end

  def bad_request_exception(exception)
    bad_request_error(detail: exception.message)
  end

  def bad_request_error(error = {})
    @error = {
      status: 400,
      title: 'Bad Request'
    }.merge!(error)

    render 'errors/show', status: :bad_request
  end

  def not_found_error(error = {})
    @error = {
      status: 404,
      title: 'Not Found'
    }.merge!(error)

    render 'errors/show', status: :not_found
  end

  def unprocessable_entity_errors(errors = [])
    @errors = errors.map do |error|
      {
        status: 422,
        title: 'Unprocessable Entity'
      }.merge(error)
    end

    render 'errors/index', status: :unprocessable_entity
  end
end
