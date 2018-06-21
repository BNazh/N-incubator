package Node;

public class BinarySearchTree{
	Node root;

	public BinarySearchTree(){root=null;}
	
	
	
	
	public void insert(int n){
		Node node=new Node(n);
		if(root==null){
			root=node;
			return;
		}
		Node current=root;
		
		while(true){
			if(current.data>n){
				if(current.left==null){
					current.left = node;
					return;
				}
				current=current.left;
				
			}
			else{
				if(current.right==null){
					current.right = node;
					return;
				}
				current=current.right;
			}
		}
	}
	
    
	public boolean find(int id){
		Node current = this.root;
		while(current!=null){
			if(current.data==id){
				return true;
			}else if(current.data>id){
				
				current = current.left;
			}else{
				current = current.right;
			}
		}
		return false;
	}
	
	public void show(Node e){
		if(e!=null){
			show(e.left);
			System.out.print(" "+e.data);
			show(e.right);
		}
	}
	
	public static void main(String[] args){
		BinarySearchTree a=new BinarySearchTree();
		
		a.insert(7);
		a.insert(8);
		a.insert(3);
		a.insert(6);
		a.insert(11);
		a.insert(4);
		a.insert(5);
		a.insert(2);
		System.out.println(a.find(7));
		System.out.println(a.find(10));
		System.out.println(a.find(30));
		
		a.show(a.root);
		
	}



	
}

