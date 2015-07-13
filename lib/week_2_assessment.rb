# I was not able to accept an array as an input!!!! Don't get why.

Node = Struct.new(:value, :parent, :left_child, :right_child)

class BinarySearchTree
	attr_reader :root, :input_arr

 	def initialize(input_arr)
		raise ArgumentError if input_arr.nil?
		raise ArgumentError if input_arr.class != Array
		raise ArgumentError if input_arr.each {|ele| ele.class != Integer}
 		@input_arr = input_arr
 		@root = Node.new(@input_arr[0], nil)
 		@current_right = @root
 		@current_left = @root
 		build_tree
 	end

 	def build_tree
 		current_right_node = @root
 		current_left_node = @root
 		@input_arr.each do |val|
 			if val > current_right_node.val
 				until current_right_node.right_child.value > val || current_right_node.right_child.nil?
 					current_right_node = current_right_node.right_child
 				end
 				construct_right(current_right_node)
 			end

 			if val < current_left_node.val
 				until current_left_node.left_child.value > val || current_left_node.left_child.nil?
 					current_left_node = current_left_node.left_child
 				end
 				construct_left(current_left_node)
 			end
 		end
 		@root
 	end

 	def construct_left(parent_node)
 		node_to_insert = Node.new(val, current_node)
 		parent_node.left_child << node_to_insert
 	end

 	def construct_right(parent_node)
 		node_to_insert = Node.new(val, current_node)
 		parent_node.right_child  << node_to_insert
 	end

 	def find_node_with_value(value)
 		current_node = @head
 		while current_node.value != value || current_node.children != nil
 			if current_node.value > value
 				current_node = current_node.right_child
 			else
 				current_node = current_node.left_child
 			end
 		end
 		current_node
 	end

end