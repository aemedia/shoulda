module Thoughtbot # :nodoc:
  module Shoulda
    class Context # :nodoc:
      def uses_transactions
        @transactional = true
      end
      
      def is_transactional?
        if @transactional.nil?
          if am_subcontext?
            self.parent.is_transactional?
          else
            false
          end
        else
          @transactional
        end
      end

      def mark_transactional(test_name)
        test_unit_class.send(:uses_transaction, test_name)
      end
      
      def create_test_from_should_hash_with_transactions(should)
        create_test_from_should_hash_without_transactions(should)
        mark_transactional(test_name_for_should(should[:name])) if is_transactional?
      end
      alias_method_chain :create_test_from_should_hash, :transactions
    end # Context
  end
end
