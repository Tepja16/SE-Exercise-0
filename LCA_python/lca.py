class Node:
	def __init__(self, data, left, right):
		self.data = data
		self.left = left
		self.right = right

tree = 	Node("T",
			Node("L", 
				Node("LL", 
					Node("LLL", None, None),
					Node("LLR", None, None)
				),
				Node("LR",
					Node("LRL", None, None),
					Node("LRR", None, None)
				)
			),
			Node("R",
				Node("RL", 
					Node("RLL", None, None),
					Node("RLR", None, None)
				),
				Node("RR",
					Node("RRL", None, None),
					Node("RRR", None, None)
				)
			)
		)	

def lca(tree, n1, n2):
    if tree is None:
        return None

    if tree.data == n1 or tree.data == n2:
        return tree.data

    left_lca = lca(tree.left, n1, n2)
    right_lca = lca(tree.right, n1, n2)

    if left_lca and right_lca:
        return tree.data

    return left_lca if left_lca is not None else right_lca
