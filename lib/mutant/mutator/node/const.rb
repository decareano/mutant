# encoding: utf-8

module Mutant
  class Mutator
    class Node

      # Mutation emitter to handle const nodes
      class Const < self

        handle(:const)

      private

        # Emit mutations
        #
        # @return [undefined]
        #
        # @api private
        #
        def dispatch
          emit_nil unless parent_type == :const
          emit_self(nil, *children.drop(1))
          children.each_with_index do |child, index|
            mutate_child(index) if child.kind_of?(Parser::AST::Node)
          end
        end

      end # Const
    end # Node
  end # Mutator
end # Mutant
