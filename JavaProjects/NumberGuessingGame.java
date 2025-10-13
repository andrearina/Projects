import java.util.*;

public class NumberGuessingGame {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Random random = new Random();

        int secretNumber = random.nextInt(100) + 1;
        int guessNumber = 0;
        int attempts = 0;

        System.out.println("Welcome to Number Guessing Game!");
        System.out.println("I'm thinking of a number. Can you guess it?");

    do {
        try {
            System.out.print("Enter a number: ");
            guessNumber = scanner.nextInt();
            attempts++;
            if (guessNumber > secretNumber) {
                System.out.println("Too high! Please try again.");
            } 
            else if (guessNumber < secretNumber) {
                System.out.println("Too low! Please try again");
            } 
            else {
                System.out.println("Congratulations! You got it!");
                System.out.println("Number of attempts: " + attempts);
            }
        } 
        catch (InputMismatchException e) { // include in notes InputMismatchException e
            System.out.println("Invalid input. Please enter an integer, not a string.");
            scanner.next(); // Consume the invalid input to prevent an infinite loop
        }
    }

    while (guessNumber != secretNumber);

    }
}
