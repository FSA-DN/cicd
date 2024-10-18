package com.example.cicd;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class TestCases {

    @Test
    public void test1() {
        // This test will always pass
        assertTrue(true, "This test will fail.");
    }

    @Test
    public void test2() {
        // This test will always pass
        assertTrue(true, "This test always passes.");
    }

    @Test
    public void test3() {
        // This test will always pass
        assertTrue(false, "This test always passes.");
    }
}
