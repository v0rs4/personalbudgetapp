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

    def default(attribute, value = nil, &block)
      defaults[attribute] = value
      # Allow the passing of blocks
      defaults[attribute] = block if block_given?
    end

    def defaults
      @defaults ||= {}
    end
  end

  def self.included(base)
    base.class_eval do
      extend ClassMethods
      prepend Callable
      include ActiveModel::Model

      attr_reader :result
      attr_reader :status

      private

      def initialize(attrs={})
        super
        apply_default_values
      end
    end
  end

  def apply_default_values
    self.class.defaults.each do |attribute, param|
      next unless self.send(attribute).nil?
      value = param.respond_to?(:call) ? param.call(self) : param
      self.send('%s=' % attribute, value)
    end
  end

  def resolve(callbacks)
    if (callback = callbacks[status])
      callback.call(self)
    elsif status != :ok
      (any_error = callbacks[:any_error]) && any_error.call(self)
    end
  end
end
