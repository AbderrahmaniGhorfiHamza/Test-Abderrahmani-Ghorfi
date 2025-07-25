package org.example;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class ChaussettesSalesTest {
 
    @Test
    public void testMultiplesOf3And5() {

        assertEquals("ChausettesSales", ChaussettesSales.getOutput(15));

        assertEquals("ChausettesSales", ChaussettesSales.getOutput(30));

        assertEquals("ChausettesSales", ChaussettesSales.getOutput(60));

    }
 
    @Test
    public void testMultiplesOf3Only() {

        assertEquals("Chausettes", ChaussettesSales.getOutput(3));

        assertEquals("Chausettes", ChaussettesSales.getOutput(6));

        assertEquals("Chausettes", ChaussettesSales.getOutput(9));

    }
 
    @Test
    public void testMultiplesOf5Only() {

        assertEquals("Sales", ChaussettesSales.getOutput(5));

        assertEquals("Sales", ChaussettesSales.getOutput(10));

        assertEquals("Sales", ChaussettesSales.getOutput(20));

    }
 
    @Test
    public void testOtherNumbers() {

        assertEquals("1",ChaussettesSales.getOutput(1));

        assertEquals("2",ChaussettesSales.getOutput(2));

        assertEquals("4",ChaussettesSales.getOutput(4));

        assertEquals("7",ChaussettesSales.getOutput(7));

    }

}