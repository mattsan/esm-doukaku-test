class Solver {
    public static String solve(String input) {
        String[] words = input.split("\\+");
        return String.valueOf(Integer.parseInt(words[0]) + Integer.parseInt(words[1]));
    }
}
