package src;

public class StepsTracker {
    public static void main(String[] args) {   
        int goalSteps = 10000;
        int stepsTaken = 7850;
        int stepsLeft = goalSteps - stepsTaken;
        boolean goalReached = stepsTaken == goalSteps;
        
        System.out.println("Steps taken: " + stepsTaken);
        System.out.println("Steps left to reach goal: " + stepsLeft);
        stepsTaken += 150;
        System.out.println("Goal reached: " + goalReached);
        System.out.println("Steps after walking more: " + stepsTaken);
        System.out.println("New goal status: " + (goalReached && stepsTaken < 20000));
    }
}
