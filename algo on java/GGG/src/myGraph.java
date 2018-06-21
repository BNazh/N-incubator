import java.util.*;
public class myGraph
{
    protected String[] names;	// 1-d array to store the vertices
    protected boolean[][] Edges;	// 2-d array to store adjacencies between vertices,

    protected int numVertices;
    protected int numEdges;

    // Default constructor. Sets aside enough capacity for one vertex
    public myGraph( )
    {
        this(1);
    }

    // Constructor that sets aside as much capacity as specified by the user
    public myGraph(int capacity)
    {
        names = new String[capacity];
        Edges = new boolean[capacity][];

        // We use only the portion of the matrix below the main diagonal to store the edges
        for(int i = 0; i < Edges.length; i++)
        {
            Edges[i] = new boolean[i+1];
            for(int j = 0; j < i; j++)
                Edges[i][j] = false;
        }
    }

    public int numberOfVertices()
    {
        return numVertices;
    }

    public int numberOfEdges()
    {
        return numEdges;
    }

    // Finds the location at which a vertex is stored in Vertices.
    // Returns -1 if vertex not found
    public int getIndex(String vertex)
    {
        for(int i = 0; i < numVertices; i++)
            if(vertex.equals(names[i]))
                return i;

        return -1;
    }

    // Resizes the array of vertices. Can make it larger or smaller, depending
    // on what newSize is.
    protected String[] resize(String[] array, int newSize)
    {
        String[] temp = new String[newSize];

        int smallerSize = newSize;
        if(array.length < smallerSize)
            smallerSize = array.length;

        for(int i = 0; i < smallerSize; i++)
            temp[i] = array[i];

        return temp;
    }



    // Resizes the array of adjacencies. Can make it larger or smaller, depending
    // on what newSize is.
    protected boolean[][] resize(boolean[][] array, int newSize)
    {
        boolean[][] temp = new boolean[newSize][];
        int smallerSize = newSize;
        if(array.length < smallerSize)
            smallerSize = array.length;

        for(int i = 0; i < newSize; i++)
        {
            temp[i] = new boolean[i+1];
            for(int j = 0; j < i+1; j++)
            {
                if (i < smallerSize)
                    temp[i][j] = array[i][j];
                else
                    temp[i][j] = false;
            }
        }
        return temp;
    }


    // Adds a new vertex
    public void addVertex(String newVertex)
    {
        if(getIndex(newVertex) != -1)
        {
            System.out.print("addVertex: ");
            System.out.print(newVertex);
            System.out.println(" failed -- vertex already exists.");
            return;
        }

        // if array of vertices is full, we need to expand it and
        // also expand Edges
        if (names.length == numVertices)
        {
            names = resize(names, 2*numVertices+1);
            Edges = resize(Edges, 2*numVertices+1);
        }

        names[numVertices++] = newVertex;
    }


    // delete the given vertex
    public void deleteVertex(String vertex)
    {
        int i = getIndex(vertex);
        if(i == -1)
        {
            System.out.print("deleteVertex: ");
            System.out.print(vertex);
            System.out.println(" failed -- it does not exist.");
            return;
        }

        // Move the last vertex up to fill the hole made by vertex i
        names[i] = names[numVertices-1];
        names[numVertices-1] = null;

        for(int j = 0; j < i; j++)
        {
            // For every edge incident on vertex i, decrement numEdges
            if(Edges[i][j])
                numEdges--;
            // Move the first i elements of the last row in the adj. matrix into the ith row
            Edges[i][j] = Edges[numVertices-1][j];
        }

        for(int j = i+1; j < numVertices-1; j++)
        {
            // For every edge incident on vertex i, decrement numEdges
            if(Edges[j][i])
                numEdges--;
            // Move the remaining elements of the last row in the adj. matrix into the ith collumn
            Edges[j][i] = Edges[numVertices-1][j];
        }

        // Delete the last row in the matrix
        for(int k = 0; k<numVertices; k++)
            Edges[numVertices-1][k] = false;

        numVertices--;

    }
    // Adds a new edge
    public void addEdge(String vertex1, String vertex2)
    {
        int i = getIndex(vertex1);
        if(i == -1)
        {
            System.out.print("addEdge failed: ");
            System.out.print(vertex1);
            System.out.println(" does not exist.");
            return;
        }

        int j = getIndex(vertex2);
        if(j == -1)
        {
            System.out.print("addEdge failed: ");
            System.out.print(vertex2);
            System.out.println(" does not exist.");
            return;
        }

        if (i>=j) Edges[i][j] = true;
        else Edges[j][i] = true;

        numEdges++;
    }


    // deletes a given edge
    public void deleteEdge(String vertex1, String vertex2)
    {
        int i = getIndex(vertex1);
        if(i == -1)
        {
            System.out.print("deleteEdge failed: ");
            System.out.print(vertex1);
            System.out.println(" does not exist.");
            return;
        }

        int j = getIndex(vertex2);
        if(j == -1)
        {
            System.out.print("deleteEdge failed: ");
            System.out.print(vertex2);
            System.out.println(" does not exist.");
            return;
        }


        if (i>=j)
        {
            if (Edges[i][j])
            {
                Edges[i][j] = false;
                numEdges--;
            }
        }
        else
        {
            if (Edges[j][i])
            {
                Edges[j][i] = false;
                numEdges--;
            }
        }
    }

    // returns the names of all the neighbors of a given vertex in an array of Strings
    public String[] getNeighbors(String vertex)
    {
        String[] neighbors = new String[numVertices];
        int numNeighbors = 0;

        int source = getIndex(vertex);
        if(source == -1)
        {
            System.out.print("getNeighbors failed: Vertex ");
            System.out.print(vertex);
            System.out.println(" does not exist.");
            return new String[0];
        }

        for(int j = 0; j < numVertices; j++)
        {
            boolean edge = false;
            if (j <= source) edge = Edges[source][j];
            else edge = Edges[j][source];

            if(edge)
                neighbors[numNeighbors++] = new String(names[j]);
        }

        neighbors = resize(neighbors, numNeighbors);
        return neighbors;
    }

    // returns the degree of a vertex with given name
    public int degree(String vertex)
    {
        // Get the index of the vertex
        int i = getIndex(vertex);
        if(i == -1)
        {
            System.out.print("In degree: ");
            System.out.print(vertex);
            System.out.println(" does not exist.");
            return -1;
        }

        // Call the other degree function that returns the degree
        // of a vertex, given its index
        return degree(i);
    }


    // returns the degree of a vertex with given index
    public int degree(int index)
    {
        int numNeighbors = 0;

        // Scan the row corresponding to vertex in the adjacency
        // matrix, counting the number of neighbors
        for (int j = 0; j <= index; j++)
            if(Edges[index][j])
                numNeighbors++;

        for (int j = index+1; j < numVertices; j++)
            if(Edges[j][index])
                numNeighbors++;

        return numNeighbors;
    }

    // returns the indices of all the neighbors of a given vertex with index
    public int[] getNeighbors(int index)
    {
        int numNeighbors = degree(index);
        int[] neighbors = new int[numNeighbors];

        // Scan the row corresponding to vertex in the adjacency matrix
        numNeighbors = 0;

        for(int j = 0; j < numVertices; j++)
        {
            boolean edge = false;
            if (j <= index) edge = Edges[index][j];
            else edge = Edges[j][index];

            if(edge)
                neighbors[numNeighbors++] = j;
        }
        return neighbors;
    }


    public String[][] listTriangles()
    {
        // From a set of n elements, n(n-1)(n-2)/6 triples can be chosen.
        // So this is an upper bound on the number of triangles in the
        // graph. For large graphs this upper bound may be too large
        // and the Java Virtual Machine may run out of memory in trying
        // to allocate memory for the 2-d String array defined below.
        int upperBound = numVertices * (numVertices - 1) * (numVertices - 2)/6;

        String[][] triangles = new String[upperBound][3];
        int counter = 0; // will be used as we generate triangles

        // Scan all vertices. Pick the first vertex of the triangle
        for(int i = 0; i < numVertices; i++)
        {
            int[] neighbors = getNeighbors(i);

            // Scan the list of neighbors of i to find pairs of
            // adjacent vertices j and k
            // We only care about triangles of the form i < j < k
            for(int ii = 0; ii < neighbors.length; ii++)
                for(int iii = 0; iii < neighbors.length; iii++)
                {
                    int j = neighbors[ii];
                    int k = neighbors[iii];
                    if((i < j) && (j < k) && Edges[k][j])
                    {
                        triangles[counter][0] = names[i];
                        triangles[counter][1] = names[j];
                        triangles[counter][2] = names[k];
                        counter++;
                    } // end-if
                } // end-for-iii
        } // end-for-i

        // Resizing the triangles array to be of just the right size
        String[][] temp = new String[counter][3];
        for(int i = 0; i < counter; i++)
        {
            temp[i][0] = triangles[i][0];
            temp[i][1] = triangles[i][1];
            temp[i][2] = triangles[i][2];
        }
        triangles = temp;

        return triangles;
    }





} // end of class