package org.socks;

public class SockService {

    /**
     * Method that gets the chaussettesSales output for a range of numbers
     * @param startRange start of the range
     * @param endRange end of the range
     * @throws IllegalArgumentException if start is greater than end or if either is less than 0
     */
    public static void rangeDirtySocks(int startRange, int endRange) throws IllegalArgumentException {
        if (startRange > endRange) {
            throw new IllegalArgumentException("Start must be less than or equal to end");
        }
        if (startRange < 0) {
            throw new IllegalArgumentException("Start and end must be positive integers");
        }
        for (int i = startRange; i <= endRange; i++) {
            System.out.println(getOutput(i));
        }
    }

    /**
     * Method that return chaussettes if multiple of 3, sales if multiple of 5, ChaussettesSales if multiple of 3 and 5
     * return the number if not a multiple of either 3 or 5
     * @param number: number to evaluate
     * @return output
     */
    public static String getOutput(int number) {
        StringBuilder sb = new StringBuilder();
        if (number % 3 == 0) {
            sb.append("Chaussettes");
        }
        if (number % 5 == 0) {
            sb.append("Sales");
        }
        if (sb.length() == 0) {
            sb.append(number);
        }
        return sb.toString();
    }
}
