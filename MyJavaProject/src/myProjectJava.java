package src;
import java.io.*;
import java.util.*;

public class myProjectJava {

    static class Appliances {
        String productName;
        int price;
        String category;
        boolean inStock;

        public Appliances(String productName, int price, String category, boolean inStock) {
            this.productName = productName;
            this.price = price;
            this.category = category;
            this.inStock = inStock;
        }

        public String returnTaskOne() {
            return "Product Name: " + productName + " | Price: " + price + " | Category: " + category + " | Stock: " + inStock;
        }

        public String returnTaskTwo() {
            return "Product Name: " + productName + " | Price: " + price + " | Category: " + category;
        }
}

// ----------------------------------------------------------------------------------------------------------
public static void main(String[] args) {
    // Start of code for CSV file parsing
    ArrayList<Appliances> items = new ArrayList<>();
    String fileName = "myAppliances.csv"; 

    try {
        BufferedReader myReader = new BufferedReader(new FileReader(fileName));
        String lineSplit;

        myReader.readLine();

        while ((lineSplit = myReader.readLine()) != null) {
            String[] segments = lineSplit.split(",");

            String productName = segments[0].trim();
            int price = Integer.parseInt(segments[1].trim());
            String category = segments[2].trim();
            boolean inStock = Boolean.parseBoolean(segments[3].trim());

            items.add(new Appliances(productName, price, category, inStock));
        }

        myReader.close();
    } 
    catch (IOException e) {
        System.out.println("There was an error reading this file. Please check if uploaded file is correct.");
        e.printStackTrace();
    }

// End of code for CSV parsing
// ----------------------------------------------------------------------------------------------------------


// Start of code for processing data
Scanner scanner = new Scanner(System.in);
System.out.println("************************************************************************************************");
System.out.println("                       Good day! Welcome to Andrea Vitorios's Appliances                        ");
System.out.println("************************************************************************************************");
System.out.println("Press a or A: Display all available items that cost above 100 pesos and show items per category");
System.out.println("Press b or B: Sort items by price and display top 5 most expensive items");
System.out.println("Press c or C: Display all available items that cost above 100 pesos and show items per category");
System.out.println("************************************************************************************************");
System.out.print("Please enter your chosen action: ");
char inputChar = scanner.next().charAt(0);
System.out.println();

// TASK 2: Count items that are in stock and cost more than 100.
if (inputChar == 'a'  || inputChar == 'A') {
    System.out.println("---------------------------------------------------------------------");
    System.out.println("AVAILABLE APPLIANCES ABOVE 100 PESOS:");
    for (Appliances item : items) { // This line of code goes through the loop of "items" arraylist. 
        if (item.inStock && item.price > 100) { // It goes in a validation if an in stock and cost more than 100.
            System.out.println(item.returnTaskOne());
        }
    }

// TASK 2: Group products by category and print the number of products per category.
    System.out.println("---------------------------------------------------------------------");
    System.out.println("NUMBER OF STOCKS PER CATEGORY");
    ArrayList<String> itemsCategory = new ArrayList<>();
    for (Appliances item : items) { // This line of code goes through the loop of "items" arraylist. 
        if (!itemsCategory.contains(item.category)) { // It validates if a category does not occurs inside the 'itemsCategory' arraylist.
            itemsCategory.add(item.category); // Adds the current category inside the 'itemsCategory' arraylist if it does not exist yet.
        }
    }
    for (String category : itemsCategory) {
        int count = 0;
        for (Appliances item : items) {
            if(item.category.equals(category)) { // This line of code counts the number of occurence of category in "itemsCategory" arraylist.
            count++; // Variable "count" adds up to one if it exists.
        }
    }
        System.out.println(category + ": " + count);
        }
        System.out.println("---------------------------------------------------------------------");
    }

// TASK 3: Print all products that are in stock and cost more than 100.
else if (inputChar == 'b'  || inputChar == 'B') {
    Collections.sort(items, new Comparator<Appliances>() {
    public int compare(Appliances one, Appliances two) {
    return two.price - one.price; // descending order
        }
    });

        int range = 5; // Print from 1 to 5 items
        if (items.size() < 5) {
        range = items.size();
    }

    System.out.println("---------------------------------------------------------------------");
    System.out.println("TOP 5 MOST EXPENSIVE PRODUCTS");
    for (int i = 0; i < range; i++) {
        System.out.println(items.get(i).returnTaskTwo()); 
    }
        System.out.println("---------------------------------------------------------------------");
    }

// TASK 4: Generate a summary report and print it to console
    else if (inputChar == 'c' || inputChar == 'C') {
    System.out.println("---------------------------------------------------------------------");
    System.out.println("                         SUMMARY REPORT                         ");
    System.out.println("---------------------------------------------------------------------");

    // Count all products
    System.out.println("TOTAL NUMBER OF PRODUCTS: " + items.size());

    // Count items that are in stock and cost more than 100
    int filteredCount = 0;
    for (Appliances item : items) {
        if (item.inStock && item.price > 100) {
            filteredCount++;
        }
    }
    System.out.println("AVAILABLE APPLIANCES ABOVE 100 PESOS: " + filteredCount);
    System.out.println();

    // Get categories
    ArrayList<String> categories = new ArrayList<>();
    for (Appliances item : items) {
        if (!categories.contains(item.category)) {
            categories.add(item.category);
        }
    }

    // Count and print items per category
    System.out.println("NUMBER OF STOCKS PER CATEGORY:");
    for (String category : categories) {
        int count = 0;
        for (Appliances item : items) {
            if (item.category.equals(category)) {
                count++;
            }
        }
        System.out.println("- " + category + ": " + count);
    }
        System.out.println();

    // Sort and print top 5 most expensive items
    Collections.sort(items, new Comparator<Appliances>() {
        public int compare(Appliances itemOne, Appliances itemTwo) {
            return itemTwo.price - itemOne.price;
        }
    });

    System.out.println("TOP 5 MOST EXPENSIVE PRODUCTS:");
    int top = Math.min(5, items.size());
    for (int i = 0; i < top; i++) {
        Appliances item = items.get(i);
        System.out.println("- " + item.productName + " (" + item.price + ")");
    }
    System.out.println("---------------------------------------------------------------------");
}

else {
        System.out.println("--------- WARNING! Please enter only the available options. ---------");
        }
    }
}
