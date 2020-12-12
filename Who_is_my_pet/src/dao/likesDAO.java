package dao;

public class likesDAO {
	private int user_idx;
	private int other_idx;

	public likesDAO(int user_idx, int other_idx) {
		super();
		this.user_idx = user_idx;
		this.other_idx = other_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getOther_idx() {
		return other_idx;
	}

	public void setOther_idx(int other_idx) {
		this.other_idx = other_idx;
	}

}
