import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

class BST{
	static class Node{
		private int data;
		private Node left;
		private Node right;
		
		public Node(int value) {
			data = value;
			left = right = null;
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
	
	public Node searchNode(int key) {
		//1. create trav and start at root
		Node trav = root;
		while(trav != null) {
			//2. if key is matching, return reference of current node
			if(key == trav.data)
				return trav;
			//3. if key is less than current node data, search into left sub tree
			else if(key < trav.data)
				trav = trav.left;
			//4. if key is greater than current node data, search key into right sub tree
			else
				trav = trav.right;
		}
		//5. key is not found
		return null;		
	}
	
	private void preOrder(Node trav) {		// original method
		// stop if tree is empty
		if(trav == null)
			return;
		System.out.print(" " + trav.data);		// V
		preOrder(trav.left);		// L
		preOrder(trav.right);		// R
	}
	
	public void preOrder() {			// wrapper method
		System.out.print("Preoder : ");
		preOrder(root);
		System.out.println();
	}
	
	private void inOrder(Node trav) {		// original method
		// stop if tree is empty
		if(trav == null)
			return;
		inOrder(trav.left);		// L
		System.out.print(" " + trav.data);		// V
		inOrder(trav.right);		// R
	}
	
	public void inOrder() {			// wrapper method
		System.out.print("Inoder : ");
		inOrder(root);
		System.out.println();
	}
	
	private void postOrder(Node trav) {		// original method
		// stop if tree is empty
		if(trav == null)
			return;
		postOrder(trav.left);		// L
		postOrder(trav.right);		// R
		System.out.print(" " + trav.data);		// V
	}
	
	public void postOrder() {			// wrapper method
		System.out.print("Postoder : ");
		postOrder(root);
		System.out.println();
	}
	
	public void DFSTraversal() {
		//0. create a stack to push nodes
		Stack<Node> st = new Stack<Node>();
		//1. push root node on stack
		st.push(root);
		System.out.print("DFS Traversal : ");
		while(!st.isEmpty()) {
			//2. pop node from stack
			Node trav = st.pop();
			//3. visit node
			System.out.print(" " + trav.data);
			//4. if right exist, push it
			if(trav.right != null)
				st.push(trav.right);
			//5. if left exist, push it
			if(trav.left != null)
				st.push(trav.left);
		}//6. repeat till stack is not empty
		System.out.println();
	}
	
	public void BFSTraversal() {
		//0. create a queue to push nodes
		Queue<Node> q = new LinkedList<Node>();
		//1. push root node on queue
		q.offer(root);
		System.out.print("BFS Traversal : ");
		while(!q.isEmpty()) {
			//2. pop node from queue
			Node trav = q.poll();
			//3. visit node
			System.out.print(" " + trav.data);
			//4. if left exist, push it
			if(trav.left != null)
				q.offer(trav.left);
			//5. if right exist, push it
			if(trav.right != null)
				q.offer(trav.right);
		}//6. repeat till stack is not empty
		System.out.println();
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
		
//		BST.Node ret =  bst.searchNode(16);
//		if(ret != null)
//			System.out.println("Key is found");
//		else
//			System.out.println("Key is not found");
		
//		bst.preOrder();
//		bst.inOrder();
//		bst.postOrder();
		
		bst.DFSTraversal();
		bst.BFSTraversal();
		
	}

}









