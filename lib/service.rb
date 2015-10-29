module Service
  module Callable
    def call
      return result if @status == :ok
      valid? ? super : (@status = :unprocessable_entity)
      result
    end
  end

  module ClassMethods
    def call(*args)
      new(*args).tap { |obj| obj.call }
    end
  end

  def self.included(base)
    base.class_eval do
      extend ClassMethods
      prepend Callable
      include ActiveModel::Model

      attr_reader :result
      attr_reader :status
    end
  end
end
