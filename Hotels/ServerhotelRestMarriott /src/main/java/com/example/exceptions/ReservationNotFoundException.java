package com.example.exceptions;

public class ReservationNotFoundException extends Exception{
    private static final long serialVersionUID = 1L;

    public ReservationNotFoundException(String msg) {
        super(msg);
    }
}
