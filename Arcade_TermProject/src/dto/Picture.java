package dto;

import java.io.Serializable;
import java.util.ArrayList;

public class Picture implements Serializable{
	
	private int stage=0;
	private String picture;
	private String[] targetPictures;
	private String[] targetPos;
	private String answerPicture;

	public Picture() {
		// TODO Auto-generated constructor stub
		
	}

	public int getStage() {
		return stage;
	}

	public void setStage(int stage) {
		this.stage = stage;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String[] getTargetPictures() {
		return targetPictures;
	}

	public void setTargetPictures(String[] targetPictures) {
		this.targetPictures = targetPictures;
	}

	public String[] getTargetPos() {
		return targetPos;
	}

	public void setTargetPos(String[] targetPos) {
		this.targetPos = targetPos;
	}

	public String getAnswerPicture() {
		return answerPicture;
	}

	public void setAnswerPicture(String answerPicture) {
		this.answerPicture = answerPicture;
	}


		
}
