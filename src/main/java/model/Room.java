package model;

public class Room {
    private int id;
    private String name;
    private int capacity;
    private boolean projector;
    private boolean whiteboard;

    public Room(int id, String name, int capacity, boolean projector, boolean whiteboard) {
        this.id = id;
        this.name = name;
        this.capacity = capacity;
        this.projector = projector;
        this.whiteboard = whiteboard;
    }

	public Room() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public boolean isProjector() {
		return projector;
	}

	public void setProjector(boolean projector) {
		this.projector = projector;
	}

	public boolean isWhiteboard() {
		return whiteboard;
	}

	public void setWhiteboard(boolean whiteboard) {
		this.whiteboard = whiteboard;
	}

	public String getLocation() {
		// TODO Auto-generated method stub
		return null;
	}
    
}
