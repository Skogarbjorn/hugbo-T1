package com.hugbo.clock_in;

/**
 * Address
 */
public class Address {
    private String street;
    private int number;

    public Address(String street, int number) {
        this.street = street;
        this.number = number;
    }

    public String toString() {
        return street + " " + number;
    }
}
