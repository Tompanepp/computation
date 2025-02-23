import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Trie {

    private class TrieNode {
        Map<Character, TrieNode> children;
        boolean isEndOfWord;
        public TrieNode() {
            children = new HashMap<>();
            isEndOfWord = false;
        }
    }

    private final TrieNode root;
    public Trie() {
        root = new TrieNode();
    }

    public void insert(String word) {
        insertRecursive(root, word, 0);
    }

    private void insertRecursive(TrieNode current, String word, int index) {

        if(index == word.length()) {
            current.isEndOfWord = true;
            return;
        }
        else {
            Character currentCharacter = word.charAt(index);
            TrieNode node = current.children.get(currentCharacter);

            if(node == null){
                node = new TrieNode();
                current.children.put(currentCharacter, node);
            }
            insertRecursive(node, word, index + 1);
        }
    }

    public int findPartial(String partial) {
        TrieNode last = findPartialRecursive(root, partial, 0);
        if(last == null) return 0;
        else return countSubWords(0, last.children);
    }

    private int countSubWords(int total, Map<Character, TrieNode> children) {
        if(children.size() == 0) return total;
        else {
            children.map((k,v) -> {
                if(v.isEndOfWord) return countSubWords(total + 1, v.children);
                else return countSubWords(total, v.children);
            });
        }
    }

    private TrieNode findPartialRecursive(TrieNode current, String partial, int index) {
        if(index == partial.length()) return current;
        else {
            Character currentCharacter = partial.charAt(index);
            TrieNode node = current.children.get(currentCharacter);
            if(node == null) return null;
            else return findPartialRecursive(node, partial, index + 1);
        }
    }


    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        int n = scanner.nextInt();
        scanner.skip("(\r\n|[\n\r\u2028\u2029\u0085])?");

        Trie contacts = new Trie();
        for (int nItr = 0; nItr < n; nItr++) {
            String[] opContact = scanner.nextLine().split(" ");

            String op = opContact[0];

            String contact = opContact[1];

            if(op.equals("add")) {
                contacts.insert(contact);
            }
            else {
                int matches = contacts.findPartial(contact);
                System.out.println(matches);
            }
        }

        scanner.close();
    }
}
