public class BinaryTree {
    Node root;
    public static void main(String[] args) {
        BinaryTree y=new BinaryTree();
        y.Insert(4);

    }

    public BinaryTree(){
        root=null;
    }
    public  void Insert(int n){
        Node current=new Node(n);
        if(root==null){
           root=current;
           return;
        }


    }

    public void display(Node e){
        if(e!=null){
            display(e.left);
            System.out.println(e.data);
            display(e.right);
        }

    }


}
class Node{
    Node left;
    Node right;
    int data;
    public Node(int a){
        data=a;
        left=null;
        right=null;
    }

}
