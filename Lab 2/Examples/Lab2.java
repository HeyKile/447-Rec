import java.util.Arrays;
import java.util.Scanner;

public class Lab2 {
	// These variables will go in the .data segment.
	static int display = 0;
	static char operation = 0;

	public static void main(String[] args) {
		// Use the print_str macro to easily print messages.
		System.out.print("Welcome to CALCY THE CALCULATOR!\n");

		while(true) {
			System.out.print(display); // syscall #1
			System.out.print("\nOperation (=,+,-,*,/,c,q) (YOU HAVE TO PRESS ENTER HERE BUT YOU WON'T IN MARS): ");
			operation = read_char(); // syscall #12

			switch(operation) {
				case 'q':
					System.exit(0); // syscall #10

				case 'c':
					display = 0;
					break;

				case '+': case '-': case '*': case '/': case '=':
					System.out.print("Value: ");
					int value = read_int(); // syscall #5, and 'value' is gonna be in v0.

					switch(operation) {
						case '+':
							display += value;
							break;
						case '-':
							display -= value;
							break;
						case '*':
							display *= value;
							break;
						case '/':
							if(value == 0)
								System.out.print("Attempting to divide by 0!\n");
							else
								display /= value;
							break;

						default: // must be '=' here.
							display = value;
							break;
					}
					break;

				default:
					System.out.print("Huh?\n");
			}
		}
	}

	// ----------------------------------------------------------------------------------------
	// Don't translate the stuff below this line! These are just emulating syscalls 5 and 12.
	// ----------------------------------------------------------------------------------------

	static Scanner s = new Scanner(System.in);

	static int read_int() {
		int ret = s.nextInt();
		s.nextLine();
		return ret;
	}

	static char read_char() {
		return s.nextLine().charAt(0);
	}

	static void test() {

		while(true) {

			// some code

		}

	}

}