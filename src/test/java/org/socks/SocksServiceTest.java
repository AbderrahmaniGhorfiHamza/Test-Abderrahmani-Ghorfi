package org.socks;

import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.junit.jupiter.params.provider.ValueSource;
import static org.junit.Assert.assertEquals;

public class SocksServiceTest {

    public void testNumbers(Integer number, String expected) {
        assertEquals(expected, SockService.getOutput(number));
    }

    /**
     * Test for multiples of 3 and 5
     */
    @ParameterizedTest
    @ValueSource(ints = {15,30 ,60})
    public void testMultiplesOf3And5(Integer number) {
        assertEquals("ChaussettesSales", SockService.getOutput(number));
    }

    /**
     * Test for multiples of 3 only
     */
    @ParameterizedTest
    @ValueSource(ints = {3, 6, 9})
    public void testMultiplesOf3Only(Integer number) {
        assertEquals("Chaussettes", SockService.getOutput(number));
    }

    /**
     * Test for multiples of 5 only
     */
    @ParameterizedTest
    @ValueSource(ints = {5, 10, 20})
    public void testMultiplesOf5Only(Integer number) {
        assertEquals("Sales", SockService.getOutput(number));
    }

    /**
     * Test for numbers that are not multiples of 3 or 5
     */
    @ParameterizedTest
    @ValueSource(ints = {1, 2, 4, 7})
    public void testOtherNumbers(Integer number) {
        testNumbers(number, number.toString());
    }

    /**
     * Test for a valid range
     * if the range is not valid, it will throw an exception and the test will fail
     */
    @Test
    public void testValidRange() {
        SockService.rangeDirtySocks(1, 5);
    }

    /**
     * Test for invalid ranges using parameterized tests
     */
    @ParameterizedTest
    @CsvSource({
            "10, 5",  // startRange greater than endRange
            "-1, 5",  // negative startRange
            "1, -5"   // negative endRange
    })
    public void testInvalidRanges(int startRange, int endRange) {
        Assertions.assertThrows(IllegalArgumentException.class, () -> {
            SockService.rangeDirtySocks(startRange, endRange);
        });
    }
}
