package dto;

public class UserDTO {
	private int idx;
	private String id;
	private String name;
	private String age;
	private String gender;
	private String email;
	private String insta_id;
	private String img;
	private String description;

	public UserDTO(int idx, String id, String name, String age, String gender, String email, String insta_id,
			String img, String description) {
		super();
		this.idx = idx;
		this.id = id;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.insta_id = insta_id;
		this.img = img;
		this.description = description;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getInsta_id() {
		return insta_id;
	}

	public void setInsta_id(String insta_id) {
		this.insta_id = insta_id;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
