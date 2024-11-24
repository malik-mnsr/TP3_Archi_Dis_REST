package com.example.exceptions;
public class ReservationFailedException extends Exception {
    public ReservationFailedException(String message) {
        super(message);
    }
}