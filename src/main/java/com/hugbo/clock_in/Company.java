package com.hugbo.clock_in;

import org.springframework.stereotype.Component;

/**
 * Company
 */
@Component
public class Company {

    public Address address;

    public Company(Address address) {
        this.address = address;
    }

    public String toString() {
        return address.toString();
    }
}
