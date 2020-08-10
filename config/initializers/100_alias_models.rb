def free_module_classes(module_with_classes)

  constants = module_with_classes.constants
  constants = constants.freeze
  constants.each do |class_name|
    class_name = class_name.to_s

    begin
      eval "#{class_name} ||= module_with_classes.const_get(class_name)"
    rescue
      #
    end

    eval("#{class_name}").instance_eval do
      def to_s
        super.demodulize
      end

      def name
        to_s
      end

      def self.model_name
        ActiveModel::Name.new(self, nil, self.to_s)
      end

    end
  end
end


free_module_classes LocalBankGh

