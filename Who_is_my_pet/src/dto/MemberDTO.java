package dto;

public class MemberDTO {
	private int idx;
	private String id;
	private String password;
	private String name;
	private String gender;
	private String age;
	private String insta_id;
	private String email;
	private String description;
	
	public MemberDTO(int idx, String id, String password, String name, String gender, String age, String insta_id, String email, String description) {
		this.idx = idx;
		this.id = id;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.insta_id = insta_id;
		this.email = email;
		this.description = description;
	}
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getInsta_id() {
		return insta_id;
	}
	public void setInsta_id(String insta_id) {
		this.insta_id = insta_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
