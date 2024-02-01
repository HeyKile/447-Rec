import java.util.Scanner;

public class SwitchExample {

    static Scanner scan = new Scanner(System.in);

    public static void main(String[] args) {

        while (true) {
            int input = scan.nextInt();
            switch (input) {
                case 1:
                    System.out.println("it's a 1");
                    return;
                case 10:
                    System.out.println("it's a 10");
                    return;
                default:
                    System.out.println("Not what we are looking for...");
            }
        }

    }

}