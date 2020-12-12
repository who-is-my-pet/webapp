package dto;

public class AnimalDTO {
	int idx;
	String name;
	String description;
	String celebs;
	String img;

	public AnimalDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AnimalDTO(int idx, String name, String description, String celebs, String img) {
		super();
		this.idx = idx;
		this.name = name;
		this.description = description;
		this.celebs = celebs;
		this.img = img;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCelebs() {
		return celebs;
	}

	public void setCelebs(String celebs) {
		this.celebs = celebs;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

}
