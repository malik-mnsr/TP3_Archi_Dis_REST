package com.example.exceptions;


public class ReservationAlreadyExistsException extends Exception{
    private static final long serialVersionUID = 1L;

    public ReservationAlreadyExistsException(String msg) {
        super(msg);
    }
}
