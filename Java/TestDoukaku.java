import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintStream;

public class TestDoukaku {
    static void test(String input, String expected, PrintStream out) {
        String actual = Solver.solve(input);
        if(actual.equals(expected)) {
            out.print(".");
        } else {
            out.format("\ninput:    %s\nexpected: %s\nactual:   %s\n", input, expected, actual);
        }
    }

    public static void main(String args[]) {
        try {
            File file = new File(args[0]);
            FileReader fileReader = new FileReader(file);
            BufferedReader reader = new BufferedReader(fileReader);
            for(String line = reader.readLine(); line != null; line = reader.readLine()) {
                String[] words = line.split(" ");
                test(words[0], words[1], System.out);
            }
            System.out.println();
            reader.close();
        } catch(IOException e) {
        }
    }
}
