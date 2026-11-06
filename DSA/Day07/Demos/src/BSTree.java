import java.util.Stack;

class BST{
	static class Node{
		private int data;
		private Node left;
		private Node right;
		private boolean visited;
		
		public Node(int value) {
			data = value;
			left = right = null;
			visited = false;
		}
	}
	
	private Node root;
	
	public BST() {
		root = null;
	}
	
	public boolean isEmpty() {
		return root == null;
	}
	
	public void addNode(int value) {
		//1. create a newnode
		Node newnode = new Node(value);
		//2. if BST is empty, add newnode into root
		if(root == null)
			root = newnode;
		//3. if BST is not empty
		else {
			//3.1 create a reference to traverse and start at root
			Node trav = root;
			while(true) {
				//3.2 if value is less than current node data
				if(value < trav.data) {
					//3.2.1 if left of current node is empty
					if(trav.left == null) {
						// add newnode into left of current node
						trav.left = newnode;
						break;
					}
					//3.2.2 if left of current node is not empty
					else
						// go on left of current node
						trav = trav.left;
				}
				//3.3 if value is greater or equal than current node data
				else {
					//3.3.1 if right of current node is empty
					if(trav.right == null) {
						// add newnode into right of current node
						trav.right = newnode;
						break;
					}
					//3.3.2 if right of current node is not empty
					else
						// go on right of current node
						trav = trav.right;
				}
			}//3.4 repeat step 3.2 and 3.3 until node is added into BST
		}
	}
	
	public void nonRecursivePreorder() {
		//0. create a stack to push nodes
		Stack<Node> st = new Stack<BST.Node>();
		//1. start from root node
		Node trav = root;
		System.out.print("Preoder : ");
		while(trav != null || !st.isEmpty()) {
			//2. traverse till extreme left
			while(trav != null) {
				//2.1 print current node
				System.out.print(" " + trav.data);
				//2.2 if right exist push it on stack
				if(trav.right != null)
					st.push(trav.right);
				//2.3 go on left node
				trav = trav.left;
			}
			//3. pop node from stack
			if(!st.isEmpty())
				trav = st.pop();
		}
		//4. repeat step 2 and 3 till all nodes are not visited
		System.out.println();
	}
	
	public void nonRecursiveInorder() {
		//0. create a stack to push nodes
		Stack<Node> st = new Stack<BST.Node>();
		//1. start from root node
		Node trav = root;
		System.out.print("Inoder : ");
		while(trav != null || !st.isEmpty()) {
			//2. traverse till extreme left
			while(trav != null) {
				//2.1 push current node on stack
				st.push(trav);
				//2.2 go on left of current node
				trav = trav.left;
			}
			//3. pop node from the stack
			if(!st.isEmpty())
				trav = st.pop();
			//4. visit current node
			System.out.print(" " + trav.data);
			//5. go on right of current node
			trav = trav.right;
		}
		//6. repeat step 2 and 5 till all nodes are not visited
		System.out.println();
	}
	
	public void nonRecursivePostorder() {
		//0. create a stack to push nodes
		Stack<Node> st = new Stack<BST.Node>();
		//1. start from root node
		Node trav = root;
		System.out.print("Postoder : ");
		while(trav != null || !st.isEmpty()) {
			//2. traverse till extreme left
			while(trav != null) {
				//2.1 push current node on stack
				st.push(trav);
				//2.2 go on left of current node
				trav = trav.left;
			}
			//3. pop node from the stack
			if(!st.isEmpty()) {
				trav = st.pop();
				//4. if right doesn't exist or right is visited
				if(trav.right == null || trav.right.visited == true) {
					//4.1 visit current node
					System.out.print(" " + trav.data);
					//4.2 mark node as visited
					trav.visited = true;
					//4.3 to pop next node from stack
					trav = null;
				}
				//5. if right exist and not visited
				else {
					//5.1 push current node on stack
					st.push(trav);
					//5.2 go on right node
					trav = trav.right;
				}
			}
		}
		//6. repeat step 2 and 5 till all nodes are not visited
		System.out.println();
	}
	
	public void deleteNode(int key) {
		//1. search a node along with its parent
		Node trav = root, parent = null;
		while(trav != null) {
			if(key == trav.data)
				break;
			parent = trav;
			if(key < trav.data)
				trav = trav.left;
			else
				trav = trav.right;
		}
		//2. if node is not found, return
		if(trav == null)
			return;
		//3. node has two child
		if(trav.left != null && trav.right != null) {
			//3.1 find inorder predecessor
			Node pred = trav.left;
			parent = trav;
			while(pred.right != null) {
				parent = pred;
				pred = pred.right;
			}
			//3.2 replace node value by predecessor value
			trav.data = pred.data;
			//3.3 delete predecessor
			if(pred == parent.left)
				parent.left = pred.left;
			else if(pred == parent.right)
				parent.right = pred.left;
		}
		//4. node has single child (left child)
		else if(trav.right == null) {
			if(trav == root)
				root = trav.left;
			else if(trav == parent.left)
				parent.left = trav.left;
			else if(trav == parent.right)
				parent.right = trav.left;
		}
		//5. node has single child (right child)
		else {	//if(trav.left == null) {
			if(trav == root)
				root = trav.right;
			else if(trav == parent.left)
				parent.left = trav.right;
			else if(trav == parent.right)
				parent.right = trav.right;
		}
	}
	
	private int height(Node trav) {
		//1. if tree is empty
		if(trav == null)
			return -1;
		//2. find height of left subtree
		int hl = height(trav.left);
		//3. find height of right subtree
		int hr = height(trav.right);
		//4. find max height
		int max = hl > hr ? hl : hr;
		//5. add one to max height and return
		return max + 1;
	}
	
	public int height() {
		return height(root);
	}
	
	public void deleteAll() {
		root = null;
	}
	
}


public class BSTree {

	public static void main(String[] args) {

		BST bst = new BST();
		
		bst.addNode(8);
		bst.addNode(3);
		bst.addNode(10);
		bst.addNode(2);
		bst.addNode(15);
		bst.addNode(6);
		bst.addNode(14);
		bst.addNode(4);
		bst.addNode(7);
		
		
//		bst.nonRecursivePreorder();
//		bst.nonRecursiveInorder();
//		bst.nonRecursivePostorder();
		
//		bst.nonRecursiveInorder();
//		bst.deleteNode(8);
//		bst.nonRecursiveInorder();

		
		bst.nonRecursiveInorder();
		System.out.println("Height : " + bst.height());
		
		
	}
	
}







