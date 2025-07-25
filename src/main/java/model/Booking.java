package model;

import java.time.LocalDate;
import java.time.LocalTime;

public class Booking {
    private int id;
    private int userId;
    private int roomId;
    private LocalDate bookingDate;
    private LocalTime startTime;
    private LocalTime endTime;

    // Additional fields for display purposes
    private String username;
    private String roomName;

    public Booking() {}

    public Booking(int id, int userId, int roomId, LocalDate bookingDate,
                   LocalTime startTime, LocalTime endTime) {
        this.id = id;
        this.userId = userId;
        this.roomId = roomId;
        this.bookingDate = bookingDate;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    // Getters & Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRoomId() {
        return roomId;
    }
    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public LocalDate getBookingDate() {
        return bookingDate;
    }
    public void setBookingDate(LocalDate bookingDate) {
        this.bookingDate = bookingDate;
    }

    public LocalTime getStartTime() {
        return startTime;
    }
    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }
    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }

    // Optional display data
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public String getRoomName() {
        return roomName;
    }
    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
}
